import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tugas_flutter/models/product.dart';
import 'package:tugas_flutter/services/product_service.dart';

void main() {
  test('Model membaca angka integer/double dan atribut opsional', () {
    final product = Product.fromJson({'id': 1, 'title': 'Produk', 'price': 20});
    expect(product.price, 20.0);
    expect(product.formattedPrice, 'Rp320.000');
    expect(product.brand, 'Tanpa merek');
    expect(product.stock, 0);
  });

  test('Model menolak produk tanpa judul atau harga valid', () {
    expect(
      () => Product.fromJson({'id': 1, 'title': '', 'price': -1}),
      throwsFormatException,
    );
  });

  test('Service melakukan GET dan mengonversi respons UTF-8', () async {
    final service = ProductService(
      client: MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.queryParameters['limit'], '0');
        expect(request.headers['Accept'], 'application/json');
        return http.Response.bytes(
          utf8.encode('{"products":[{"id":1,"title":"Café","price":12.5}]}'),
          200,
        );
      }),
    );
    addTearDown(service.dispose);
    final products = await service.fetchProducts();
    expect(products.single.title, 'Café');
    expect(products.single.price, 12.5);
  });

  test('Service mengizinkan daftar kosong', () async {
    final service = ProductService(
      client: MockClient((_) async => http.Response('{"products":[]}', 200)),
    );
    addTearDown(service.dispose);
    expect(await service.fetchProducts(), isEmpty);
  });

  for (final body in [
    'not-json',
    '{}',
    '{"products":[false]}',
    '{"products":[{"id":1}]}',
  ]) {
    test('Service menolak data tidak sesuai: $body', () async {
      final service = ProductService(
        client: MockClient((_) async => http.Response(body, 200)),
      );
      addTearDown(service.dispose);
      await expectLater(
        service.fetchProducts(),
        throwsA(
          isA<ApiException>().having(
            (error) => error.message,
            'message',
            contains('Format JSON'),
          ),
        ),
      );
    });
  }

  test('Service menangani HTTP non-200', () async {
    final service = ProductService(
      client: MockClient((_) async => http.Response('Not found', 404)),
    );
    addTearDown(service.dispose);
    await expectLater(
      service.fetchProducts(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.message,
          'message',
          contains('HTTP 404'),
        ),
      ),
    );
  });

  test('Service menangani koneksi yang gagal', () async {
    final service = ProductService(
      client: MockClient((_) async => throw http.ClientException('offline')),
    );
    addTearDown(service.dispose);
    await expectLater(
      service.fetchProducts(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.message,
          'message',
          contains('koneksi internet'),
        ),
      ),
    );
  });

  test('Service menangani timeout', () async {
    final service = ProductService(
      client: MockClient((_) => Completer<http.Response>().future),
      timeout: const Duration(milliseconds: 10),
    );
    addTearDown(service.dispose);
    await expectLater(
      service.fetchProducts(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.message,
          'message',
          contains('Waktu tunggu'),
        ),
      ),
    );
  });

  test('URL tidak valid ditolak sebelum mengirim permintaan', () async {
    final service = ProductService(
      apiUrl: 'bukan-url',
      client: MockClient(
        (_) async => throw StateError('Tidak boleh dipanggil'),
      ),
    );
    addTearDown(service.dispose);
    await expectLater(
      service.fetchProducts(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.message,
          'message',
          contains('URL API tidak valid'),
        ),
      ),
    );
  });
}
