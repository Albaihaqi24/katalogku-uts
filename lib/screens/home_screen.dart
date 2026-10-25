import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_service.dart';
import '../utils/currency_formatter.dart';
import '../widgets/product_card.dart';
import '../widgets/status_view.dart';
import 'product_detail_screen.dart';

enum ProductSort { original, lowestPrice, highestPrice, highestRating }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.service});

  final ProductService? service;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ProductService _service;
  late Future<List<Product>> _productsFuture;
  final _searchController = TextEditingController();
  String _query = '';
  String? _category;
  ProductSort _sort = ProductSort.original;

  @override
  void initState() {
    super.initState();
    _service = widget.service ?? ProductService();
    // Simpan Future agar mengetik pencarian tidak mengulang HTTP GET.
    _productsFuture = _service.fetchProducts();
  }

  Future<void> _refresh() async {
    final nextFuture = _service.fetchProducts();
    setState(() {
      _productsFuture = nextFuture;
    });
    try {
      await nextFuture;
    } catch (_) {
      // FutureBuilder menampilkan error; RefreshIndicator tetap diselesaikan.
    }
  }

  void _resetFilters() {
    _searchController.clear();
    setState(() {
      _query = '';
      _category = null;
      _sort = ProductSort.original;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    if (widget.service == null) _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.widgets_outlined),
            SizedBox(width: 10),
            Text('KatalogKu', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Muat ulang data',
            onPressed: () {
              _refresh();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temukan pilihanmu.',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Jelajahi produk, bandingkan harga, lihat detailnya.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _searchController,
                        onChanged: (value) => setState(() => _query = value),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                          hintText: 'Cari nama, merek, atau kategori',
                          prefixIcon: const Icon(Icons.search_rounded),
                          suffixIcon: _query.isEmpty
                              ? null
                              : IconButton(
                                  tooltip: 'Hapus pencarian',
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() => _query = '');
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Product>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const StatusView(
                          isLoading: true,
                          title: 'Sedang memuat produk',
                          message: 'Menunggu data dari server. Mohon tunggu.',
                        );
                      }
                      if (snapshot.hasError) {
                        return StatusView(
                          icon: Icons.error_outline_rounded,
                          title: 'Data gagal dimuat',
                          message: snapshot.error.toString(),
                          actionLabel: 'Coba Lagi',
                          onAction: () {
                            _refresh();
                          },
                        );
                      }
                      if (snapshot.hasData) {
                        final products = snapshot.data!;
                        if (products.isEmpty) {
                          return StatusView(
                            title: 'Belum ada produk',
                            message: 'Server mengembalikan daftar kosong.',
                            actionLabel: 'Muat ulang',
                            onAction: () {
                              _refresh();
                            },
                          );
                        }
                        return _buildCatalog(products);
                      }
                      return StatusView(
                        title: 'Data belum tersedia',
                        message: 'Muat ulang untuk mengambil data dari server.',
                        actionLabel: 'Muat ulang',
                        onAction: () {
                          _refresh();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCatalog(List<Product> products) {
    final categories =
        products.map((product) => product.category).toSet().toList()..sort();
    // Kategori yang hilang setelah refresh diperlakukan sebagai semua kategori.
    final activeCategory = categories.contains(_category) ? _category : null;
    final query = _query.trim().toLowerCase();
    final visibleProducts = products.where((product) {
      final matchesCategory =
          activeCategory == null || product.category == activeCategory;
      final searchable =
          '${product.title} ${product.brand} ${product.category} ${product.categoryLabel}'
              .toLowerCase();
      return matchesCategory && searchable.contains(query);
    }).toList();

    switch (_sort) {
      case ProductSort.original:
        break;
      case ProductSort.lowestPrice:
        visibleProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case ProductSort.highestPrice:
        visibleProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case ProductSort.highestRating:
        visibleProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        // Header dan kondisi pencarian kosong tetap bisa ditarik untuk refresh.
        itemCount: visibleProducts.isEmpty ? 2 : visibleProducts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: 240,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: activeCategory ?? '',
                        icon: const Icon(Icons.expand_more),
                        onChanged: (value) => setState(
                          () => _category = value == '' ? null : value,
                        ),
                        items: [
                          const DropdownMenuItem(
                            value: '',
                            child: Text('Semua kategori'),
                          ),
                          ...categories.map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                products
                                    .firstWhere(
                                      (product) => product.category == category,
                                    )
                                    .categoryLabel,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: DropdownButton<ProductSort>(
                        isExpanded: true,
                        value: _sort,
                        onChanged: (value) {
                          if (value != null) setState(() => _sort = value);
                        },
                        items: const [
                          DropdownMenuItem(
                            value: ProductSort.original,
                            child: Text('Urutan awal'),
                          ),
                          DropdownMenuItem(
                            value: ProductSort.lowestPrice,
                            child: Text('Harga terendah'),
                          ),
                          DropdownMenuItem(
                            value: ProductSort.highestPrice,
                            child: Text('Harga tertinggi'),
                          ),
                          DropdownMenuItem(
                            value: ProductSort.highestRating,
                            child: Text('Nilai tertinggi'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '${visibleProducts.length} dari ${products.length} produk',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    CurrencyFormatter.conversionNote,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            );
          }
          if (visibleProducts.isEmpty) {
            return StatusView(
              icon: Icons.search_off_rounded,
              title: 'Produk tidak ditemukan',
              message: 'Coba kata kunci atau kategori lain.',
              actionLabel: 'Atur ulang pencarian & filter',
              onAction: _resetFilters,
            );
          }
          final product = visibleProducts[index - 1];
          return ProductCard(
            product: product,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
