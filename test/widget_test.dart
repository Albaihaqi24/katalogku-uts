import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:tugas_flutter/main.dart';
import 'package:tugas_flutter/services/product_service.dart';
import 'package:tugas_flutter/widgets/product_card.dart';

const sampleProducts = [
  {
    'id': 1,
    'title': 'Kopi Nusantara',
    'description': 'Kopi pilihan dari Indonesia.',
    'category': 'groceries',
    'price': 12.5,
    'rating': 4.8,
    'stock': 24,
    'brand': 'Kopi Kita',
  },
  {
    'id': 2,
    'title': 'Lampu Meja',
    'category': 'home-decoration',
    'price': 25,
    'rating': 4.2,
    'stock': 8,
  },
];

http.Response productsResponse() => http.Response(
  jsonEncode({'products': sampleProducts}),
  200,
  headers: {'content-type': 'application/json; charset=utf-8'},
);

Future<void> openHome(WidgetTester tester, MockClient client) async {
  final service = ProductService(client: client);
  addTearDown(service.dispose);
  await tester.pumpWidget(KatalogApp(service: service));
}

void main() {
  testWidgets('FutureBuilder menampilkan loading lalu data sukses', (
    tester,
  ) async {
    final response = Completer<http.Response>();
    await openHome(tester, MockClient((_) => response.future));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Sedang memuat produk'), findsOneWidget);

    response.complete(productsResponse());
    await tester.pumpAndSettle();
    expect(find.text('Kopi Nusantara'), findsOneWidget);
    expect(find.text('2 dari 2 produk'), findsOneWidget);
    expect(find.text('Rp200.000'), findsOneWidget);
    expect(find.textContaining('Nilai 4,8'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('HTTP error dan tombol Coba Lagi mengambil data baru', (
    tester,
  ) async {
    var calls = 0;
    await openHome(
      tester,
      MockClient((_) async {
        calls++;
        return calls == 1
            ? http.Response('Unavailable', 503)
            : productsResponse();
      }),
    );
    await tester.pumpAndSettle();
    expect(find.text('Data gagal dimuat'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    expect(find.textContaining('HTTP 503'), findsOneWidget);
    await tester.tap(find.text('Coba Lagi'));
    await tester.pumpAndSettle();
    expect(calls, 2);
    expect(find.text('Kopi Nusantara'), findsOneWidget);
  });

  testWidgets('JSON tidak valid ditampilkan sebagai error', (tester) async {
    await openHome(
      tester,
      MockClient((_) async => http.Response('invalid', 200)),
    );
    await tester.pumpAndSettle();
    expect(find.text('Data gagal dimuat'), findsOneWidget);
    expect(find.textContaining('Format JSON tidak sesuai'), findsOneWidget);
  });

  testWidgets('Daftar kosong memiliki pesan dan tombol muat ulang', (
    tester,
  ) async {
    await openHome(
      tester,
      MockClient((_) async => http.Response('{"products":[]}', 200)),
    );
    await tester.pumpAndSettle();
    expect(find.text('Belum ada produk'), findsOneWidget);
    expect(find.text('Muat ulang'), findsOneWidget);
  });

  testWidgets('Pencarian lokal tidak menambah permintaan HTTP', (tester) async {
    var calls = 0;
    await openHome(
      tester,
      MockClient((_) async {
        calls++;
        return productsResponse();
      }),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'kopi');
    await tester.pumpAndSettle();
    expect(find.text('Kopi Nusantara'), findsOneWidget);
    expect(find.text('Lampu Meja'), findsNothing);
    expect(calls, 1);
    await tester.enterText(find.byType(TextField), 'tidak-ada');
    await tester.pumpAndSettle();
    expect(find.text('Produk tidak ditemukan'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -240));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Atur ulang pencarian & filter'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('2 dari 2 produk'));
    expect(find.text('2 dari 2 produk'), findsOneWidget);
    expect(calls, 1);
  });

  testWidgets('Kartu membuka halaman detail', (tester) async {
    await openHome(tester, MockClient((_) async => productsResponse()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kopi Nusantara'));
    await tester.pumpAndSettle();
    expect(find.text('Detail produk'), findsOneWidget);
    expect(find.byTooltip('Kembali'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Kopi Kita'), 200);
    expect(find.text('Kopi Kita'), findsOneWidget);
    await tester.tap(find.byTooltip('Kembali'));
    await tester.pumpAndSettle();
    expect(find.text('KatalogKu'), findsOneWidget);
  });

  testWidgets(
    'Filter kategori memilih dan mengembalikan produk tanpa HTTP baru',
    (tester) async {
      var calls = 0;
      await openHome(
        tester,
        MockClient((_) async {
          calls++;
          return productsResponse();
        }),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Semua kategori'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kebutuhan Harian').last);
      await tester.pumpAndSettle();
      expect(find.text('1 dari 2 produk'), findsOneWidget);
      expect(find.text('Kopi Nusantara'), findsOneWidget);
      expect(find.text('Lampu Meja'), findsNothing);

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Semua kategori').last);
      await tester.pumpAndSettle();
      expect(find.text('2 dari 2 produk'), findsOneWidget);
      expect(find.text('Lampu Meja'), findsOneWidget);
      expect(calls, 1);
    },
  );

  testWidgets('Urutan harga dan nilai mengolah data lokal tanpa HTTP baru', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    var calls = 0;
    await openHome(
      tester,
      MockClient((_) async {
        calls++;
        return http.Response(
          jsonEncode({
            'products': [
              ...sampleProducts,
              {
                'id': 3,
                'title': 'Roti Gandum',
                'category': 'groceries',
                'price': 5,
                'rating': 4.6,
              },
            ],
          }),
          200,
        );
      }),
    );
    await tester.pumpAndSettle();

    for (final scenario in [
      (
        'Urutan awal',
        'Harga terendah',
        ['Roti Gandum', 'Kopi Nusantara', 'Lampu Meja'],
      ),
      (
        'Harga terendah',
        'Harga tertinggi',
        ['Lampu Meja', 'Kopi Nusantara', 'Roti Gandum'],
      ),
      (
        'Harga tertinggi',
        'Nilai tertinggi',
        ['Kopi Nusantara', 'Roti Gandum', 'Lampu Meja'],
      ),
    ]) {
      await tester.tap(find.text(scenario.$1));
      await tester.pumpAndSettle();
      await tester.tap(find.text(scenario.$2).last);
      await tester.pumpAndSettle();
      expect(
        tester
            .widgetList<ProductCard>(find.byType(ProductCard))
            .map((card) => card.product.title),
        scenario.$3,
      );
    }
    expect(calls, 1);
  });

  testWidgets('Refresh yang gagal mengganti data lama dengan error', (
    tester,
  ) async {
    var calls = 0;
    await openHome(
      tester,
      MockClient((_) async {
        calls++;
        return calls == 1 ? productsResponse() : http.Response('Error', 500);
      }),
    );
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0, 350));
    await tester.pumpAndSettle();
    expect(calls, 2);
    expect(find.text('Data gagal dimuat'), findsOneWidget);
    expect(find.text('Kopi Nusantara'), findsNothing);
  });

  testWidgets('Katalog tetap tertata pada lebar ponsel 320 piksel', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await openHome(tester, MockClient((_) async => productsResponse()));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Kopi Nusantara'), findsOneWidget);
  });
}
