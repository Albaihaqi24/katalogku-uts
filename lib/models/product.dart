import '../localization/product_translations.dart';
import '../utils/currency_formatter.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final String brand;
  final String thumbnail;

  factory Product.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    final price = json['price'];
    if (id is! int ||
        title is! String ||
        title.trim().isEmpty ||
        price is! num ||
        !price.isFinite ||
        price < 0) {
      throw const FormatException('ID, judul, atau harga produk tidak valid.');
    }

    String readText(String key, String fallback) {
      final value = json[key];
      if (value == null) return fallback;
      if (value is! String) {
        throw FormatException('Atribut $key harus berupa teks.');
      }
      return value.trim().isEmpty ? fallback : value.trim();
    }

    final rating = json['rating'] ?? 0;
    final stock = json['stock'] ?? 0;
    if (rating is! num ||
        !rating.isFinite ||
        rating < 0 ||
        rating > 5 ||
        stock is! int ||
        stock < 0) {
      throw const FormatException('Rating atau stok produk tidak valid.');
    }

    return Product(
      id: id,
      title: ProductTranslations.title(title.trim()),
      description: ProductTranslations.description(
        title.trim(),
        readText('description', 'Deskripsi belum tersedia.'),
      ),
      category: readText('category', 'lainnya'),
      price: price.toDouble(),
      rating: rating.toDouble(),
      stock: stock,
      brand: readText('brand', 'Tanpa merek'),
      thumbnail: readText('thumbnail', ''),
    );
  }

  // Nilai asli API disimpan dalam dolar AS untuk menjaga data sumber.
  double get priceInRupiah => CurrencyFormatter.fromUsd(price);

  String get formattedPrice => CurrencyFormatter.rupiah(priceInRupiah);

  String get formattedRating => CurrencyFormatter.rating(rating);

  String get categoryLabel => ProductTranslations.category(category);
}
