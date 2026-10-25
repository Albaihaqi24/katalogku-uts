import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_flutter/localization/product_translations.dart';
import 'package:tugas_flutter/models/product.dart';
import 'package:tugas_flutter/utils/currency_formatter.dart';

void main() {
  test(
    'Harga dolar benar-benar dikonversi sebelum diformat menjadi rupiah',
    () {
      final product = Product.fromJson({
        'id': 1,
        'title': 'Produk contoh',
        'price': 9.99,
        'rating': 4.8,
      });
      expect(product.price, 9.99);
      expect(product.priceInRupiah, closeTo(159840, 0.001));
      expect(product.formattedPrice, 'Rp159.840');
      expect(product.formattedRating, '4,8');
    },
  );

  test('Format rupiah menangani nol, jutaan, dan pembulatan pecahan', () {
    expect(CurrencyFormatter.rupiah(0), 'Rp0');
    expect(CurrencyFormatter.rupiah(1234567), 'Rp1.234.567');
    expect(CurrencyFormatter.rupiah(159840.6), 'Rp159.841');
    expect(CurrencyFormatter.conversionNote, contains('kurs simulasi'));
  });

  test('Kategori yang ditampilkan menggunakan bahasa Indonesia', () {
    expect(ProductTranslations.category('beauty'), 'Kecantikan');
    expect(ProductTranslations.category('skin-care'), 'Perawatan Kulit');
    expect(ProductTranslations.category('kategori-baru'), 'Lainnya');
  });

  test('Terjemahan produk dipilih berdasarkan judul sumber, bukan ID', () {
    final localized = Product.fromJson({
      'id': 99999,
      'title': 'Essence Mascara Lash Princess',
      'description': 'The Essence Mascara Lash Princess is a popular mascara.',
      'price': 9.99,
    });
    expect(localized.title, contains('Maskara'));
    expect(localized.title, isNot('Essence Mascara Lash Princess'));
    expect(localized.description, isNot(contains('is a popular mascara')));

    final unknown = Product.fromJson({
      'id': 1,
      'title': 'Produk baru dari dosen',
      'description': 'Deskripsi khusus dari API dosen.',
      'price': 10,
    });
    expect(unknown.title, 'Produk baru dari dosen');
    expect(unknown.description, 'Deskripsi khusus dari API dosen.');
  });
}
