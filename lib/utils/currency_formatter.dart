import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  // Kurs tetap untuk simulasi tugas, bukan kurs pasar saat ini.
  static const double usdToIdrRate = 16000;

  static final _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  static final _decimal = NumberFormat('0.0', 'id_ID');

  static double fromUsd(num value) => value * usdToIdrRate;

  static String rupiah(num value) => _rupiah.format(value);

  static String rating(num value) => _decimal.format(value);

  static String get conversionNote =>
      'Harga perkiraan dengan kurs simulasi 1 dolar AS = '
      '${rupiah(usdToIdrRate)}.';
}
