# KatalogKu

KatalogKu adalah aplikasi Flutter untuk Ujian Tengah Semester (UTS) mata kuliah
Pemrograman Mobile. Aplikasi mengambil data produk dari REST API, mengubah JSON
menjadi model Dart, mengolah data dengan pencarian, filter, dan pengurutan, lalu
menyajikannya dalam katalog Material Design 3 serta halaman detail.

**Pengembang:** Ahmad Harits Albaihaqi — NIM 240605110177,
Program Studi Teknik Informatika, Fakultas Sains dan Teknologi,
Universitas Islam Negeri Maulana Malik Ibrahim Malang.

**Repositori GitHub publik:** [Albaihaqi24/katalogku-uts](https://github.com/Albaihaqi24/katalogku-uts).

**Pilihan API:** DummyJSON Products digunakan sesuai ide katalog produk.
Berdasarkan klarifikasi mahasiswa, pemilihan API mengikuti proyek masing-masing,
sehingga URL ini menjadi API proyek KatalogKu.

## Fitur utama

- Katalog berisi gambar, nama, kategori, harga rupiah, penilaian, dan stok produk.
- Nama, deskripsi, kategori, pesan, dan tombol tampil dalam bahasa Indonesia.
- `FutureBuilder<List<Product>>` untuk kondisi memuat, berhasil, gagal, dan data kosong.
- Indikator `CircularProgressIndicator` dan informasi menunggu server.
- Kegagalan HTTP, koneksi, batas waktu, atau JSON dengan ikon, pesan, dan **Coba Lagi**.
- Pencarian lokal berdasarkan nama, merek, dan kategori tanpa HTTP tambahan.
- Filter kategori serta pengurutan harga terendah/tertinggi dan penilaian tertinggi.
- Tarik untuk memuat ulang dan tombol muat ulang pada bilah aplikasi.
- Pesan khusus untuk hasil pencarian kosong, beserta tombol reset filter.
- Halaman detail ketika kartu produk diketuk.
- Placeholder jika gambar tidak tersedia atau gagal dimuat.
- Antarmuka Material berbahasa Indonesia dengan daftar yang menyesuaikan lebar layar.

## Kesesuaian modul UTS

Pemetaan berikut mengacu pada modul UTS Pemrograman Mobile, kelas Praktikum
Mobile Programming G, tanggal 19 Oktober 2026. Status ini membedakan implementasi
yang tersedia dari kelengkapan pengumpulan yang masih perlu diselesaikan.

| Ketentuan modul | Implementasi atau status |
| --- | --- |
| Flutter dan bahasa Dart | Kode aplikasi berada di `lib/`, dengan `main.dart` sebagai titik masuk. |
| Minimal satu halaman dengan GUI | `HomeScreen` menyajikan katalog dan `ProductDetailScreen` menyajikan rincian produk. |
| Data dinamis melalui API sesuai proyek | `ProductService` mengambil katalog secara langsung dari `https://dummyjson.com/products?limit=0`; DummyJSON dipilih untuk ide KatalogKu sesuai klarifikasi mahasiswa. |
| Permintaan HTTP dan pemeriksaan status respons | `ProductService.fetchProducts()` mengirim `GET`, memeriksa status `200`, dan menangani kegagalan koneksi, batas waktu, serta respons tidak valid. |
| JSON dikonversi menjadi objek Dart | `Product.fromJson` memvalidasi dan mengonversi atribut produk yang relevan. |
| Pengambilan asinkron dengan `FutureBuilder` | Halaman utama menampilkan kondisi memuat, berhasil, gagal, serta daftar kosong; tersedia tombol **Coba Lagi**. |
| Penyajian dan pengolahan data sesuai tujuan | Katalog, pencarian, filter kategori, pengurutan, detail, dan pemuatan ulang tersedia. |
| Struktur rapi dan README lengkap | Model, layanan, halaman, widget, pelokalan, dan format mata uang dipisahkan; README memuat nama, deskripsi, fitur, teknologi, dan cara menjalankan. |
| Pengujian sistematis dan hasil yang dijelaskan | Pada 25 Oktober 2026, seluruh 26 pengujian lulus dan analyzer tanpa temuan. |
| Source code lengkap di GitHub publik | Tersedia di [Albaihaqi24/katalogku-uts](https://github.com/Albaihaqi24/katalogku-uts); pemeriksaan akhir akses tanpa login masih perlu dilakukan. |
| Laporan berbahasa Indonesia dalam format PDF | Laporan disimpan lokal dan dikumpulkan terpisah melalui Google Drive. |
| PDF di Google Drive dengan akses tautan sebagai Viewer | Belum tersedia tautan PDF Google Drive yang terverifikasi dapat dibaca tanpa login. |

Batas waktu pada modul adalah **Senin, 26 Oktober 2026 pukul 23.59 WIB**.
Pengumpulan akhir memerlukan dua tautan yang dapat dibuka tanpa izin tambahan:
repositori GitHub publik dan laporan PDF di Google Drive.

## Teknologi dan package

| Teknologi | Penggunaan |
| --- | --- |
| Flutter, Dart | UI, navigasi, dan logika aplikasi |
| Material Design 3 | Tema, Card, Chip, tombol, dan form |
| `http: ^1.6.0` | Permintaan HTTP GET |
| `flutter_localizations` (SDK Flutter) | Label bawaan Material dan dukungan lokal Indonesia |
| `intl: ^0.20.2` | Format angka dan rupiah sesuai lokal Indonesia |
| `dart:convert` | Decode JSON dan UTF-8 |
| `dart:async` | Future dan timeout |
| `flutter_test` | Unit test dan widget test |
| `flutter_lints: ^6.0.0` | Analisis statis |

Tidak ada API key, package state management, font eksternal, atau package UI tambahan.

## Struktur direktori

```text
katalogku-uts/
├── lib/
│   ├── main.dart
│   ├── localization/
│   │   └── product_translations.dart
│   ├── models/
│   │   └── product.dart
│   ├── services/
│   │   └── product_service.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── product_detail_screen.dart
│   ├── utils/
│   │   └── currency_formatter.dart
│   └── widgets/
│       ├── product_card.dart
│       ├── product_image.dart
│       └── status_view.dart
├── test/
│   ├── product_service_test.dart
│   ├── indonesian_display_test.dart
│   └── widget_test.dart
├── android/
├── ios/
├── web/
├── windows/
├── macos/
├── linux/
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

## REST API dan model

- Endpoint: `https://dummyjson.com/products?limit=0`
- Metode: `GET`; header `Accept: application/json`.
- Sukses: HTTP `200`; timeout aplikasi: 20 detik.
- `limit=0` mengambil seluruh produk agar pencarian dan pengurutan lokal mencakup
  seluruh katalog contoh. Untuk data produksi yang besar, gunakan pagination.
- Harga asli dari API menggunakan dolar AS (USD). Tampilan mengonversinya menjadi
  rupiah dengan kurs tetap simulasi, sebagaimana dijelaskan di bawah.

Contoh respons minimal yang sesuai dengan model (data ilustrasi, bukan salinan
respons terbaru server):

```json
{
  "products": [
    {
      "id": 1,
      "title": "Contoh Produk",
      "description": "Deskripsi produk dari API.",
      "category": "beauty",
      "price": 9.99,
      "rating": 4.5,
      "stock": 20,
      "brand": "Contoh Merek",
      "thumbnail": ""
    }
  ],
  "total": 1,
  "skip": 0,
  "limit": 1
}
```

`Product.fromJson` memvalidasi `id`, `title`, dan `price`. Angka harga dapat berupa
integer atau double. Atribut opsional yang tidak tersedia memiliki nilai bawaan.
Tipe atribut yang keliru ditolak agar respons rusak menghasilkan state error.
`total`, `skip`, dan `limit` tidak digunakan oleh UI.

## Bahasa Indonesia dan mata uang rupiah

Aplikasi menggunakan lokal `id_ID` dan `flutter_localizations` agar label bawaan
Material, seperti petunjuk pencarian dan pilihan menu teks, mengikuti bahasa
Indonesia. Angka penilaian juga menggunakan tanda desimal Indonesia.

Data produk tetap diambil langsung dari DummyJSON. Berkas
`lib/localization/product_translations.dart` menyediakan terjemahan tampilan
untuk nama, deskripsi, dan kategori dari 194 produk yang telah dikenali.
Nama merek serta model produk dipertahankan. Terjemahan ini merupakan lapisan
tampilan lokal atas data API; data produk tidak diganti dengan katalog buatan.
Produk baru atau teks yang belum dikenal tetap menggunakan teks asli dari API
agar informasi yang belum diterjemahkan tidak ditebak.

Harga menggunakan **kurs simulasi tetap: 1 dolar AS = Rp16.000**, bukan kurs
terkini atau kurs yang diambil dari layanan keuangan. Harga dolar AS dikalikan
16.000, dibulatkan ke rupiah utuh, lalu diformat dengan pemisah ribuan Indonesia.
Contoh: harga API `9.99` ditampilkan sebagai **Rp159.840**. Keterangan kurs
simulasi juga ditampilkan pada antarmuka aplikasi.

Untuk mengubah kurs simulasi dan format rupiah, edit
`lib/utils/currency_formatter.dart`. Properti `priceInRupiah` dan `formattedPrice`
di model produk memakai formatter tersebut sehingga daftar, detail, dan ringkasan
harga konsisten. Jika mengganti API, periksa mata uang harga sumber terlebih dahulu
agar harga yang sudah berupa rupiah tidak dikonversi dua kali.

## Cara kerja asynchronous dan FutureBuilder

1. `HomeScreen.initState()` menjalankan `fetchProducts()` dan menyimpan Future ke
   `_productsFuture`. Permintaan tidak dibuat ulang di dalam `build()`.
2. `ProductService` menjalankan `await _client.get(...)` tanpa memblokir UI,
   memeriksa status HTTP, mendecode JSON, dan memanggil `Product.fromJson`.
3. `FutureBuilder` mendengarkan `_productsFuture` dan mengubah tampilan:

| Kondisi | Tampilan |
| --- | --- |
| `ConnectionState.waiting` | Spinner dan teks sedang memuat produk |
| `snapshot.hasError` | Ikon error, pesan yang jelas, tombol **Coba Lagi** |
| `snapshot.hasData`, daftar terisi | `ListView.builder` berisi kartu produk |
| `snapshot.hasData`, daftar kosong | Pesan belum ada produk dan tombol muat ulang |
| Filter/pencarian tidak cocok | Pesan produk tidak ditemukan dan tombol reset |

4. Retry/refresh membuat Future baru melalui `setState`, sehingga siklus loading
   dimulai kembali. Error refresh ditampilkan oleh `FutureBuilder`.
5. Pencarian, kategori, dan pengurutan mengolah daftar yang sudah dimuat di memori.

## Langkah menjalankan aplikasi

### 1. Siapkan perangkat pengembangan

- Instal Flutter stable **3.38.0 atau lebih baru**, dengan Dart **3.10.0 atau lebih baru**.
- Instal VS Code dengan ekstensi Flutter/Dart atau Android Studio.
- Untuk Android, siapkan Android SDK dan emulator atau aktifkan USB debugging
  pada perangkat fisik. Untuk iOS/macOS, gunakan macOS dengan Xcode.
- Pastikan komputer/perangkat memiliki internet untuk mengunduh package dan
  mengambil produk/gambar dari API.

Periksa instalasi dan selesaikan masalah pada target yang akan digunakan:

```sh
flutter --version
flutter doctor
```

### 2. Buka source project

Instal Git, lalu clone repositori dan masuk ke folder yang berisi `pubspec.yaml`:

```sh
git clone https://github.com/Albaihaqi24/katalogku-uts.git
cd katalogku-uts
flutter pub get
```

### 3. Jalankan pada perangkat

Nyalakan emulator atau hubungkan ponsel, lalu:

```sh
flutter devices
flutter run
```

Jika ada beberapa perangkat, gunakan ID yang tercantum pada `flutter devices`:

```sh
flutter run -d <ID_PERANGKAT>
```

Ganti `<ID_PERANGKAT>` dengan ID sebenarnya. Alternatif untuk browser Chrome:

```sh
flutter run -d chrome
```

API untuk target web harus mengizinkan CORS dari origin aplikasi. Pengaturan CORS
berasal dari server API. Izin `android.permission.INTERNET` sudah ditambahkan pada
manifest utama Android, termasuk untuk build release. Network client entitlement
juga sudah disiapkan untuk macOS debug dan release.

### 4. Analisis dan pengujian

```sh
dart format lib test
flutter analyze
flutter test
```

Jika `flutter analyze` pada Flutter 3.47.1 berhenti dengan error protokol
`FormatException: Unterminated string` ketika lokasi proyek mengandung karakter
Unicode, gunakan pemeriksaan alternatif berikut:

```sh
dart analyze --fatal-infos
```

Pengujian menggunakan `MockClient` agar tidak bergantung pada server publik.
Cakupannya meliputi parsing model/UTF-8, HTTP error, koneksi gagal, timeout,
JSON rusak, daftar kosong, loading ke success, retry, pencarian tanpa fetch ulang,
refresh gagal, navigasi detail, tata letak ponsel, serta format rupiah dan
terjemahan tampilan produk. Jalankan perintah pengujian di atas untuk memeriksa
hasil sesuai versi proyek yang digunakan.

Jika OneDrive mengunci cache `build/unit_test_assets`, pengujian kode dan widget
tanpa pengemasan ulang aset dapat dijalankan dengan `flutter test --no-test-assets`.
Pemeriksaan akhir pada 25 Oktober 2026 menggunakan Flutter 3.47.1 / Dart 3.13.1
meluluskan **26 pengujian**. `dart analyze --fatal-infos` tidak menemukan masalah.
Endpoint nyata merespons HTTP 200 dengan 194 produk. Lima gambar laporan dirender
dari widget asli pada area 390 x 844 piksel; katalog memakai salinan respons API
nyata, sedangkan loading dan HTTP 503 dikendalikan dalam pengujian. Pengujian
pada ponsel Android fisik belum dilakukan.

### 5. Membuat APK Android

Setelah Android toolchain siap:

```sh
flutter build apk --release
```

APK dihasilkan pada `build/app/outputs/flutter-apk/app-release.apk`.

### Catatan build pada folder dengan karakter Unicode

Pada lokasi proyek saat ini, tool pemangkas font Flutter 3.47.1 gagal menulis
`MaterialIcons-Regular.otf` karena karakter Jepang pada path berubah menjadi
`??????`. Jika mengalami masalah ini, nonaktifkan pemangkasan ikon saat build:

```sh
flutter build web --no-tree-shake-icons
flutter build apk --release --no-tree-shake-icons
```

Flag ini menyertakan font ikon secara utuh, sehingga ukuran build dapat bertambah.
Alternatifnya, salin proyek ke folder dengan path ASCII sebelum build release.

## Mengganti API proyek

Jika skema JSON **sama** dengan contoh `products`, URL dapat diganti saat menjalankan:

```sh
flutter run --dart-define=API_URL=https://contoh.ac.id/api/products
```

URL di atas adalah contoh; ganti dengan endpoint proyek yang sebenarnya.
Jika URL mengandung `&`, bungkus seluruh argumen `--dart-define` dengan tanda kutip.
Untuk build APK, tambahkan argumen yang sama pada `flutter build apk --release`.

Jika skema JSON **berbeda**, mengganti URL saja tidak cukup:

1. Sesuaikan atribut dan `Product.fromJson` di `lib/models/product.dart`.
2. Sesuaikan pembacaan `decoded['products']` di service. Misalnya API pengganti
   mungkin menggunakan key `data` atau langsung mengembalikan array.
3. Tambahkan header autentikasi pada service jika API mewajibkannya.
4. Sesuaikan label, mata uang, kartu, dan halaman detail dengan arti data baru.
5. Perbarui contoh respons serta pengujian sesuai skema API tersebut.

## Pengumpulan laporan

Laporan dan berkas pendukungnya disimpan lokal, terpisah dari repositori GitHub.
Laporan PDF dikumpulkan melalui Google Drive dengan akses **Siapa saja yang
memiliki link** sebagai **Pelihat**. Tautan Google Drive belum tersedia.

## Referensi

- [Dokumentasi DummyJSON Products](https://dummyjson.com/docs/products)
- [Package http](https://pub.dev/packages/http)
- [Flutter: Fetch data from the internet](https://docs.flutter.dev/cookbook/networking/fetch-data)
