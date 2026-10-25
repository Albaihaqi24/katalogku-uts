import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiException implements Exception {
  const ApiException(this.message);

  final String message;

  @override
  String toString() => message;
}

class ProductService {
  ProductService({
    http.Client? client,
    this.apiUrl = defaultApiUrl,
    this.timeout = const Duration(seconds: 20),
  }) : _client = client ?? http.Client();

  // Ganti URL melalui --dart-define atau sesuaikan dengan API dari dosen.
  static const defaultApiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://dummyjson.com/products?limit=0',
  );

  final http.Client _client;
  final String apiUrl;
  final Duration timeout;

  Future<List<Product>> fetchProducts() async {
    try {
      final uri = Uri.tryParse(apiUrl);
      if (uri == null ||
          !uri.hasAuthority ||
          (uri.scheme != 'https' && uri.scheme != 'http')) {
        throw const ApiException(
          'URL API tidak valid. Periksa konfigurasi API.',
        );
      }
      final response = await _client
          .get(uri, headers: {'Accept': 'application/json'})
          .timeout(timeout);
      if (response.statusCode != 200) {
        throw ApiException(
          'Server mengembalikan HTTP ${response.statusCode}. '
          'Silakan coba lagi beberapa saat.',
        );
      }
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! Map<String, dynamic> || decoded['products'] is! List) {
        throw const FormatException('Respons harus berisi daftar products.');
      }
      final products = <Product>[];
      for (final item in decoded['products'] as List) {
        if (item is! Map<String, dynamic>) {
          throw const FormatException('Item produk harus berupa objek JSON.');
        }
        products.add(Product.fromJson(item));
      }
      return products;
    } on ApiException {
      rethrow;
    } on TimeoutException {
      throw const ApiException(
        'Waktu tunggu server habis. Periksa koneksi lalu coba lagi.',
      );
    } on http.ClientException {
      throw const ApiException(
        'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.',
      );
    } on FormatException {
      throw const ApiException(
        'Data dari server tidak dapat diproses. Format JSON tidak sesuai.',
      );
    } catch (_) {
      throw const ApiException(
        'Terjadi kesalahan saat mengambil data. Silakan coba lagi.',
      );
    }
  }

  void dispose() => _client.close();
}
