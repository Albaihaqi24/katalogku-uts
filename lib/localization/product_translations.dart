/// Terjemahan lokal untuk data contoh DummyJSON Products.
///
/// Nama asli menjadi kunci agar perubahan urutan atau ID produk tidak membuat
/// terjemahan tertukar. Nama merek dan model tetap mengikuti nama resminya.
abstract final class ProductTranslations {
  static int get count => _products.length;

  static bool containsTitle(String originalTitle) =>
      _products.containsKey(originalTitle);

  static String title(String originalTitle) =>
      _products[originalTitle]?.title ?? originalTitle;

  static String description(String originalTitle, String originalDescription) {
    // API memiliki dua produk Rolex Cellini Moonphase dengan deskripsi berbeda.
    // Cocokkan teks asal agar masing-masing tetap mendapatkan terjemahannya.
    if (originalTitle == "Rolex Cellini Moonphase" &&
        originalDescription == _secondMoonphaseDescription) {
      return "Jam tangan Rolex Cellini Moonphase merupakan mahakarya seni "
          "pembuatan jam. Dengan fitur penunjuk fase bulan, jam ini menampilkan "
          "keahlian pengerjaan dan keanggunan yang menjadi ciri khas Rolex.";
    }
    return _products[originalTitle]?.description ?? originalDescription;
  }

  static String category(String slug) => _categories[slug] ?? "Lainnya";

  static const String _secondMoonphaseDescription =
      "The Rolex Cellini Moonphase watch is a masterpiece of horology. "
      "Featuring a moon phase complication, it showcases the craftsmanship "
      "and elegance that Rolex is renowned for.";

  static const Map<String, String> _categories = {
    "beauty": "Kecantikan",
    "fragrances": "Parfum",
    "furniture": "Furnitur",
    "groceries": "Kebutuhan Harian",
    "home-decoration": "Dekorasi Rumah",
    "kitchen-accessories": "Peralatan Dapur",
    "laptops": "Laptop",
    "mens-shirts": "Kemeja Pria",
    "mens-shoes": "Sepatu Pria",
    "mens-watches": "Jam Tangan Pria",
    "mobile-accessories": "Aksesori Gawai",
    "motorcycle": "Sepeda Motor",
    "skin-care": "Perawatan Kulit",
    "smartphones": "Ponsel",
    "sports-accessories": "Peralatan Olahraga",
    "sunglasses": "Kacamata Hitam",
    "tablets": "Tablet",
    "tops": "Atasan",
    "vehicle": "Kendaraan",
    "womens-bags": "Tas Wanita",
    "womens-dresses": "Busana Wanita",
    "womens-jewellery": "Perhiasan Wanita",
    "womens-shoes": "Sepatu Wanita",
    "womens-watches": "Jam Tangan Wanita",
  };

  static const Map<String, ({String title, String description})> _products = {
    "Essence Mascara Lash Princess": (
      title: "Maskara Essence Lash Princess",
      description:
          "Maskara Essence Lash Princess populer berkat kemampuannya menebalkan dan memanjangkan bulu mata. Dapatkan tampilan bulu mata yang dramatis dengan formula tahan lama yang tidak diuji pada hewan.",
    ),
    "Eyeshadow Palette with Mirror": (
      title: "Palet Perona Mata dengan Cermin",
      description:
          "Palet perona mata dengan cermin menawarkan berbagai pilihan warna untuk menciptakan riasan mata yang memukau. Cermin bawaannya memudahkan Anda merias wajah saat bepergian.",
    ),
    "Powder Canister": (
      title: "Bedak Tabur Pengunci Riasan",
      description:
          "Bedak tabur bertekstur halus ini dirancang untuk mengunci riasan dan mengendalikan kilap. Formulanya ringan dan transparan, menghasilkan tampilan kulit yang halus tanpa kilap.",
    ),
    "Red Lipstick": (
      title: "Lipstik Merah",
      description:
          "Lipstik merah menjadi pilihan klasik dan berani untuk memberi warna pada bibir. Formula bertekstur lembut dengan pigmen pekat menghasilkan warna cerah yang tahan lama.",
    ),
    "Red Nail Polish": (
      title: "Kuteks Merah",
      description:
          "Kuteks merah menghadirkan warna merah pekat yang berkilau agar kuku tampak cerah dan terawat. Formulanya cepat kering dan memberikan hasil setara perawatan salon di rumah.",
    ),
    "Calvin Klein CK One": (
      title: "Calvin Klein CK One",
      description:
          "CK One dari Calvin Klein adalah parfum uniseks klasik yang dikenal dengan aroma segar dan bersih. Parfum serbaguna ini cocok digunakan sehari-hari.",
    ),
    "Chanel Coco Noir Eau De": (
      title: "Chanel Coco Noir Eau De",
      description:
          "Coco Noir dari Chanel adalah parfum elegan dan misterius dengan perpaduan aroma jeruk limau gedang, mawar, dan kayu cendana. Cocok digunakan untuk acara malam hari.",
    ),
    "Dior J'adore": (
      title: "Dior J'adore",
      description:
          "J'adore dari Dior adalah parfum mewah beraroma bunga yang dikenal melalui perpaduan kenanga, mawar, dan melati. Aromanya mencerminkan kesan feminin dan berkelas.",
    ),
    "Dolce Shine Eau de": (
      title: "Dolce Shine Eau de",
      description:
          "Dolce Shine dari Dolce & Gabbana adalah parfum cerah beraroma buah dengan sentuhan mangga, melati, dan kayu ringan. Aromanya menghadirkan kesan ceria dan muda.",
    ),
    "Gucci Bloom Eau de": (
      title: "Gucci Bloom Eau de",
      description:
          "Gucci Bloom dari Gucci adalah parfum bunga yang memikat dengan perpaduan aroma sedap malam, melati, dan bunga melati belanda. Wanginya memberi kesan modern dan romantis.",
    ),
    "Annibale Colombo Bed": (
      title: "Tempat Tidur Annibale Colombo",
      description:
          "Tempat tidur Annibale Colombo memiliki rangka yang mewah dan elegan, dibuat menggunakan bahan berkualitas tinggi untuk menghadirkan kamar tidur yang nyaman dan bergaya.",
    ),
    "Annibale Colombo Sofa": (
      title: "Sofa Annibale Colombo",
      description:
          "Sofa Annibale Colombo merupakan pilihan tempat duduk yang berkelas dan nyaman. Desainnya yang indah dipadukan dengan pelapis premium untuk melengkapi ruang tamu Anda.",
    ),
    "Bedside Table African Cherry": (
      title: "Meja Samping Tempat Tidur Kayu Ceri Afrika",
      description:
          "Meja samping tempat tidur dari kayu ceri Afrika melengkapi kamar tidur dengan tampilan menarik dan fungsi praktis. Meja ini menyediakan ruang penyimpanan yang mudah dijangkau sekaligus sentuhan elegan.",
    ),
    "Knoll Saarinen Executive Conference Chair": (
      title: "Kursi Rapat Eksekutif Knoll Saarinen",
      description:
          "Kursi rapat eksekutif Knoll Saarinen memiliki desain modern dan ergonomis. Desainnya yang tak lekang oleh waktu cocok untuk kantor maupun ruang rapat Anda.",
    ),
    "Wooden Bathroom Sink With Mirror": (
      title: "Wastafel Kamar Mandi Kayu dengan Cermin",
      description:
          "Wastafel kamar mandi kayu dengan cermin menghadirkan tampilan yang unik dan menarik. Produk ini dilengkapi meja wastafel berbahan kayu serta cermin dengan desain senada.",
    ),
    "Apple": (
      title: "Apel",
      description:
          "Apel segar dan renyah, cocok untuk camilan atau diolah menjadi berbagai hidangan.",
    ),
    "Beef Steak": (
      title: "Steik Daging Sapi",
      description:
          "Steik daging sapi berkualitas tinggi, cocok dipanggang atau dimasak sesuai tingkat kematangan yang Anda sukai.",
    ),
    "Cat Food": (
      title: "Makanan Kucing",
      description:
          "Makanan kucing bergizi yang diformulasikan untuk memenuhi kebutuhan nutrisi kucing kesayangan Anda.",
    ),
    "Chicken Meat": (
      title: "Daging Ayam",
      description:
          "Daging ayam segar dan empuk yang cocok diolah menjadi berbagai masakan.",
    ),
    "Cooking Oil": (
      title: "Minyak Goreng",
      description:
          "Minyak goreng serbaguna untuk menggoreng, menumis, dan berbagai kebutuhan memasak lainnya.",
    ),
    "Cucumber": (
      title: "Mentimun",
      description:
          "Mentimun renyah dengan kandungan air yang menyegarkan, cocok untuk salad, camilan, atau hidangan pendamping.",
    ),
    "Dog Food": (
      title: "Makanan Anjing",
      description:
          "Makanan anjing yang diformulasikan secara khusus untuk menyediakan nutrisi penting bagi anjing kesayangan Anda.",
    ),
    "Eggs": (
      title: "Telur",
      description:
          "Telur segar, bahan serbaguna untuk membuat kue, memasak, atau menyiapkan sarapan.",
    ),
    "Fish Steak": (
      title: "Potongan Ikan untuk Steik",
      description:
          "Potongan ikan berkualitas yang cocok dipanggang di atas pemanggang, dimasak dalam oven, atau dimasak cepat di wajan panas.",
    ),
    "Green Bell Pepper": (
      title: "Paprika Hijau",
      description:
          "Paprika hijau segar dengan warna cerah, cocok untuk menambah warna dan cita rasa pada masakan Anda.",
    ),
    "Green Chili Pepper": (
      title: "Cabai Hijau",
      description:
          "Cabai hijau pedas yang cocok untuk menambah rasa pedas pada resep favorit Anda.",
    ),
    "Honey Jar": (
      title: "Madu dalam Stoples",
      description:
          "Madu murni dan alami dalam stoples praktis, cocok sebagai pemanis minuman atau dituangkan di atas makanan.",
    ),
    "Ice Cream": (
      title: "Es Krim",
      description:
          "Es krim lembut dan lezat, tersedia dalam berbagai rasa untuk dinikmati sebagai hidangan manis.",
    ),
    "Juice": (
      title: "Jus Buah",
      description:
          "Jus buah menyegarkan yang kaya vitamin dan membantu memenuhi kebutuhan cairan tubuh.",
    ),
    "Kiwi": (
      title: "Kiwi",
      description:
          "Kiwi kaya nutrisi, cocok sebagai camilan atau untuk menambahkan sentuhan rasa tropis pada hidangan Anda.",
    ),
    "Lemon": (
      title: "Lemon",
      description:
          "Lemon beraroma segar dan bercita rasa asam, serbaguna untuk memasak, membuat kue, atau meracik minuman menyegarkan.",
    ),
    "Milk": (
      title: "Susu",
      description:
          "Susu segar dan bergizi, bahan utama untuk berbagai resep serta konsumsi sehari-hari.",
    ),
    "Mulberry": (
      title: "Buah Murbei",
      description:
          "Buah murbei manis dan berair, cocok untuk camilan atau tambahan pada hidangan penutup dan sereal.",
    ),
    "Nescafe Coffee": (
      title: "Kopi Nescafe",
      description:
          "Kopi berkualitas dari Nescafe, tersedia dalam berbagai racikan untuk menghasilkan secangkir kopi yang kaya rasa dan memuaskan.",
    ),
    "Potatoes": (
      title: "Kentang",
      description:
          "Kentang kaya pati dan serbaguna, cocok dipanggang, dihaluskan, atau disajikan sebagai hidangan pendamping.",
    ),
    "Protein Powder": (
      title: "Bubuk Protein",
      description:
          "Bubuk protein kaya nutrisi yang cocok untuk melengkapi pola makan dengan asupan protein penting.",
    ),
    "Red Onions": (
      title: "Bawang Bombay Merah",
      description:
          "Bawang bombay merah dengan rasa dan aroma khas, cocok untuk memperkaya cita rasa masakan gurih Anda.",
    ),
    "Rice": (
      title: "Beras",
      description:
          "Beras berkualitas tinggi, bahan pokok berbagai tradisi kuliner dan dasar yang serbaguna untuk banyak hidangan.",
    ),
    "Soft Drinks": (
      title: "Minuman Ringan",
      description:
          "Aneka minuman ringan dalam berbagai rasa, cocok dinikmati sebagai minuman penyegar.",
    ),
    "Strawberry": (
      title: "Stroberi",
      description:
          "Stroberi manis dan berair, cocok untuk camilan, hidangan penutup, atau dihaluskan menjadi minuman buah.",
    ),
    "Tissue Paper Box": (
      title: "Tisu Kotak",
      description:
          "Tisu dalam kotak praktis untuk kebutuhan sehari-hari, dengan lembaran yang lembut dan mudah menyerap cairan.",
    ),
    "Water": (
      title: "Air Minum",
      description:
          "Air minum kemasan yang murni dan menyegarkan, penting untuk memenuhi kebutuhan cairan sepanjang hari.",
    ),
    "Decoration Swing": (
      title: "Ayunan Hias",
      description:
          "Ayunan hias menjadi pelengkap dekorasi rumah yang menawan. Dibuat dengan detail yang rumit, dekorasi ini memberi sentuhan elegan dan ceria pada berbagai ruangan.",
    ),
    "Family Tree Photo Frame": (
      title: "Bingkai Foto Pohon Keluarga",
      description:
          "Bingkai foto pohon keluarga merupakan cara yang hangat dan menarik untuk memajang kenangan berharga bersama keluarga. Beberapa tempat foto di dalamnya membantu menceritakan kisah orang-orang terkasih.",
    ),
    "House Showpiece Plant": (
      title: "Tanaman Hias Artifisial",
      description:
          "Tanaman hias artifisial membawa sentuhan alam ke rumah Anda tanpa memerlukan perawatan. Tanaman ini menambah nuansa hijau dan mempercantik berbagai ruang.",
    ),
    "Plant Pot": (
      title: "Pot Tanaman",
      description:
          "Pot tanaman dengan tampilan menarik untuk tanaman favorit Anda. Desainnya yang rapi melengkapi taman di dalam maupun luar ruangan dan memberi sentuhan modern pada pajangan tanaman.",
    ),
    "Table Lamp": (
      title: "Lampu Meja",
      description:
          "Lampu meja merupakan pencahayaan yang fungsional sekaligus dekoratif untuk ruang Anda. Desain modernnya menyediakan penerangan suasana maupun penerangan aktivitas untuk memperindah suasana ruangan.",
    ),
    "Bamboo Spatula": (
      title: "Spatula Bambu",
      description:
          "Spatula bambu adalah alat dapur serbaguna yang dibuat dari bambu ramah lingkungan. Cocok untuk membalik, mengaduk, dan menyajikan berbagai hidangan.",
    ),
    "Black Aluminium Cup": (
      title: "Cangkir Aluminium Hitam",
      description:
          "Cangkir aluminium hitam tampil menarik dan tahan lama untuk minuman panas maupun dingin. Desain hitamnya yang rapi memberi sentuhan modern pada koleksi perlengkapan minum Anda.",
    ),
    "Black Whisk": (
      title: "Pengocok Adonan Hitam",
      description:
          "Pengocok adonan hitam merupakan perlengkapan dapur untuk mengocok dan mencampur bahan. Pegangan ergonomis dan desainnya yang rapi membuat alat ini praktis sekaligus menarik.",
    ),
    "Boxed Blender": (
      title: "Blender dalam Kemasan Kotak",
      description:
          "Blender dalam kemasan kotak ini bertenaga dan ringkas, cocok untuk membuat minuman buah, susu kocok, dan lainnya. Desain praktis serta beragam fungsinya menjadikannya peralatan dapur serbaguna.",
    ),
    "Carbon Steel Wok": (
      title: "Wajan Baja Karbon",
      description:
          "Wajan baja karbon serbaguna untuk menumis cepat, menumis biasa, maupun menggoreng dengan banyak minyak. Konstruksinya yang kokoh meratakan panas untuk menghasilkan masakan lezat.",
    ),
    "Chopping Board": (
      title: "Talenan",
      description:
          "Talenan merupakan perlengkapan dapur penting untuk menyiapkan bahan makanan. Dibuat dari bahan tahan lama, permukaannya aman dan higienis untuk memotong serta mencincang.",
    ),
    "Citrus Squeezer Yellow": (
      title: "Pemeras Jeruk Kuning",
      description:
          "Pemeras jeruk kuning adalah alat praktis untuk mengambil sari buah jeruk. Warnanya yang cerah menambah suasana ceria pada koleksi peralatan dapur Anda.",
    ),
    "Egg Slicer": (
      title: "Pengiris Telur",
      description:
          "Pengiris telur memudahkan Anda memotong telur rebus menjadi irisan yang rata. Cocok untuk salad, roti lapis, dan hidangan lain yang menggunakan irisan telur.",
    ),
    "Electric Stove": (
      title: "Kompor Listrik",
      description:
          "Kompor listrik menyediakan sarana memasak yang mudah dipindahkan dan efisien. Cocok untuk dapur kecil atau sebagai tempat memasak tambahan untuk berbagai kebutuhan.",
    ),
    "Fine Mesh Strainer": (
      title: "Saringan Halus",
      description:
          "Saringan halus adalah alat serbaguna untuk menyaring cairan dan mengayak bahan kering. Jaring halusnya menyaring secara efektif agar proses memasak dan membuat kue berjalan lancar.",
    ),
    "Fork": (
      title: "Garpu",
      description:
          "Garpu klasik untuk berbagai kebutuhan makan dan menyajikan hidangan. Desain yang tahan lama dan ergonomis menjadikannya pilihan andal untuk penggunaan sehari-hari.",
    ),
    "Glass": (
      title: "Gelas",
      description:
          "Gelas minum yang serbaguna dan elegan untuk berbagai jenis minuman. Desain beningnya memungkinkan Anda menikmati warna dan tekstur minuman.",
    ),
    "Grater Black": (
      title: "Parutan Hitam",
      description:
          "Parutan hitam adalah alat dapur praktis untuk memarut keju, sayuran, dan bahan lainnya. Desain yang rapi dan mata parut tajam membuat persiapan makanan lebih mudah dan efisien.",
    ),
    "Hand Blender": (
      title: "Blender Genggam",
      description:
          "Blender genggam merupakan peralatan dapur serbaguna untuk memblender, menghaluskan, dan mencampur bahan. Desain ringkas dan motor bertenaga membuatnya praktis untuk berbagai resep.",
    ),
    "Ice Cube Tray": (
      title: "Cetakan Es Batu",
      description:
          "Cetakan es batu merupakan perlengkapan praktis untuk membuat es dengan berbagai bentuk. Cocok untuk mendinginkan minuman sekaligus menambah tampilan yang menyenangkan.",
    ),
    "Kitchen Sieve": (
      title: "Ayakan Dapur",
      description:
          "Ayakan dapur adalah alat serbaguna untuk mengayak dan menyaring bahan kering maupun basah. Jaring halusnya membantu menghasilkan tekstur lembut pada masakan dan kue.",
    ),
    "Knife": (
      title: "Pisau Dapur",
      description:
          "Pisau dapur merupakan alat penting untuk mencincang, mengiris, dan memotong dadu. Bilah tajam serta pegangan ergonomis menjadikannya pilihan andal untuk menyiapkan makanan.",
    ),
    "Lunch Box": (
      title: "Kotak Bekal",
      description:
          "Kotak bekal adalah wadah praktis yang mudah dibawa untuk mengemas makanan Anda. Sekat untuk berbagai jenis makanan menjadikannya cocok untuk makan saat bepergian.",
    ),
    "Microwave Oven": (
      title: "Oven Gelombang Mikro",
      description:
          "Oven gelombang mikro adalah peralatan dapur serbaguna untuk memasak, menghangatkan, dan mencairkan makanan dengan cepat dan efisien. Ukurannya yang ringkas cocok untuk berbagai tata ruang dapur.",
    ),
    "Mug Tree Stand": (
      title: "Rak Gantung Cangkir",
      description:
          "Rak gantung cangkir merupakan tempat penyimpanan yang menarik dan hemat ruang. Cangkir favorit Anda tetap mudah dijangkau sekaligus tertata rapi di dapur.",
    ),
    "Pan": (
      title: "Wajan Antilengket",
      description:
          "Wajan merupakan peralatan masak penting dan serbaguna untuk menggoreng, menumis, serta memasak berbagai hidangan. Lapisan antilengket memudahkan pengangkatan makanan dan pembersihan.",
    ),
    "Plate": (
      title: "Piring",
      description:
          "Piring klasik yang penting untuk menyajikan makanan. Desainnya yang tahan lama dan menarik cocok untuk penggunaan sehari-hari maupun acara khusus.",
    ),
    "Red Tongs": (
      title: "Penjepit Makanan Merah",
      description:
          "Penjepit makanan merah serbaguna untuk berbagai kegiatan memasak dan menyajikan hidangan. Warnanya yang cerah menambah semangat pada koleksi peralatan dapur Anda.",
    ),
    "Silver Pot With Glass Cap": (
      title: "Panci Perak dengan Tutup Kaca",
      description:
          "Panci perak dengan tutup kaca tampil menarik dan fungsional untuk merebus, memasak dengan api kecil, serta menyiapkan hidangan lezat. Tutup kacanya memudahkan Anda memantau proses memasak.",
    ),
    "Slotted Turner": (
      title: "Spatula Berlubang",
      description:
          "Spatula berlubang dirancang untuk membalik makanan. Lubangnya meniriskan cairan berlebih sehingga cocok digunakan saat menggoreng dan menumis.",
    ),
    "Spice Rack": (
      title: "Rak Bumbu",
      description:
          "Rak bumbu merupakan tempat praktis untuk mengatur rempah dan bumbu masakan. Rak dengan desain menarik ini membuat bahan penting di dapur tetap terjangkau dan tersusun rapi.",
    ),
    "Spoon": (
      title: "Sendok",
      description:
          "Sendok merupakan peralatan dapur serbaguna untuk mengaduk, menyajikan, dan mencicipi makanan. Desain ergonomis serta konstruksi yang tahan lama menjadikannya perlengkapan penting di setiap dapur.",
    ),
    "Tray": (
      title: "Nampan",
      description:
          "Nampan berfungsi sebagai perlengkapan penyajian sekaligus dekorasi untuk camilan, hidangan pembuka, atau minuman. Desainnya yang menarik menjadikannya serbaguna saat menjamu tamu.",
    ),
    "Wooden Rolling Pin": (
      title: "Penggilas Adonan Kayu",
      description:
          "Penggilas adonan kayu adalah alat dapur klasik untuk meratakan adonan sebelum dipanggang. Permukaan halus dan pegangan kokohnya membantu menghasilkan ketebalan adonan yang merata.",
    ),
    "Yellow Peeler": (
      title: "Pengupas Kuning",
      description:
          "Pengupas kuning memudahkan pengupasan buah dan sayuran. Warna kuningnya yang cerah menambah suasana ceria pada perlengkapan dapur Anda.",
    ),
    "Apple MacBook Pro 14 Inch Space Grey": (
      title: "Apple MacBook Pro 14 Inci Abu-abu Antariksa",
      description:
          "MacBook Pro 14 inci berwarna abu-abu antariksa merupakan laptop bertenaga dengan desain ramping. Cip M1 Pro dari Apple menghadirkan kinerja istimewa, didukung layar Retina yang memukau.",
    ),
    "Asus Zenbook Pro Dual Screen Laptop": (
      title: "Laptop Asus Zenbook Pro Layar Ganda",
      description:
          "Laptop Asus Zenbook Pro layar ganda merupakan perangkat berkinerja tinggi dengan dua layar. Kombinasi tersebut mendukung produktivitas dan beragam kebutuhan para profesional kreatif.",
    ),
    "Huawei Matebook X Pro": (
      title: "Huawei Matebook X Pro",
      description:
          "Huawei Matebook X Pro merupakan laptop tipis dan bergaya dengan layar sentuh beresolusi tinggi. Laptop ini menghadirkan pengalaman premium bagi pengguna yang sering bepergian.",
    ),
    "Lenovo Yoga 920": (
      title: "Lenovo Yoga 920",
      description:
          "Lenovo Yoga 920 merupakan laptop konvertibel 2-in-1 dengan engsel fleksibel. Anda dapat menggunakannya sebagai laptop atau tablet untuk kemudahan penggunaan dan mobilitas.",
    ),
    "New DELL XPS 13 9300 Laptop": (
      title: "Laptop DELL XPS 13 9300 Baru",
      description:
          "Laptop DELL XPS 13 9300 baru merupakan perangkat ringkas dan bertenaga. Layar InfinityEdge dengan bingkai yang sangat tipis serta kinerja kelas atasnya mendukung berbagai pekerjaan.",
    ),
    "Blue & Black Check Shirt": (
      title: "Kemeja Kotak-kotak Biru dan Hitam",
      description:
          "Kemeja pria kotak-kotak biru dan hitam memadukan tampilan menarik, kenyamanan, dan motif kotak klasik. Bahan berkualitas tingginya cocok untuk acara santai maupun semiformal.",
    ),
    "Gigabyte Aorus Men Tshirt": (
      title: "Kaus Pria Gigabyte Aorus",
      description:
          "Kaus pria Gigabyte Aorus hadir dengan gaya keren dan santai bagi penggemar permainan video. Logo Aorus dan desain yang rapi cocok untuk mengekspresikan gaya Anda sebagai pemain.",
    ),
    "Man Plaid Shirt": (
      title: "Kemeja Pria Motif Tartan",
      description:
          "Kemeja pria bermotif tartan klasik ini serbaguna dan tidak lekang oleh waktu. Potongan nyaman serta gaya santainya menjadikannya pakaian andalan untuk berbagai kesempatan.",
    ),
    "Man Short Sleeve Shirt": (
      title: "Kemeja Pria Lengan Pendek",
      description:
          "Kemeja pria lengan pendek merupakan pilihan sejuk dan bergaya untuk cuaca hangat. Potongan yang nyaman dan lengan pendeknya menghasilkan tampilan santai yang tetap rapi.",
    ),
    "Men Check Shirt": (
      title: "Kemeja Pria Kotak-kotak",
      description:
          "Kemeja pria klasik dan serbaguna dengan motif kotak-kotak yang menarik. Cocok untuk berbagai kesempatan dan menambah kesan rapi pada koleksi pakaian Anda.",
    ),
    "Nike Air Jordan 1 Red And Black": (
      title: "Nike Air Jordan 1 Merah dan Hitam",
      description:
          "Nike Air Jordan 1 merah dan hitam adalah sepatu basket ikonis yang dikenal melalui desain menarik dan fitur berkinerja tinggi. Sepatu ini menjadi favorit para penggemar sepatu olahraga dan atlet.",
    ),
    "Nike Baseball Cleats": (
      title: "Sepatu Bisbol Berpul Nike",
      description:
          "Sepatu bisbol berpul Nike dirancang untuk memberikan daya cengkeram dan kinerja maksimal di lapangan bisbol. Sepatu ini membantu menjaga kestabilan dan menopang pemain saat bertanding maupun berlatih.",
    ),
    "Puma Future Rider Trainers": (
      title: "Sepatu Olahraga Puma Future Rider",
      description:
          "Sepatu Puma Future Rider memadukan gaya retro dengan kenyamanan modern. Cocok untuk busana santai, sepatu ini menjadi pilihan modis dan nyaman untuk penggunaan sehari-hari.",
    ),
    "Sports Sneakers Off White & Red": (
      title: "Sepatu Olahraga Putih Gading dan Merah",
      description:
          "Sepatu olahraga putih gading dan merah memadukan gaya dengan fungsi sehingga menjadi pilihan modis bagi penggemar olahraga. Perpaduan warnanya memberi kesan berani dan penuh energi.",
    ),
    "Sports Sneakers Off White Red": (
      title: "Sepatu Olahraga Putih Gading Merah",
      description:
          "Varian lain dari sepatu olahraga putih gading merah dengan desain yang unik. Sepatu ini menawarkan gaya dan kenyamanan untuk berbagai kegiatan santai.",
    ),
    "Brown Leather Belt Watch": (
      title: "Jam Tangan Tali Kulit Cokelat",
      description:
          "Jam tangan tali kulit cokelat hadir dengan tampilan menarik dan desain klasik. Tali kulit asli serta muka jam yang rapi memberi sentuhan berkelas pada penampilan Anda.",
    ),
    "Longines Master Collection": (
      title: "Longines Master Collection",
      description:
          "Longines Master Collection adalah jam tangan elegan dan berkelas yang dikenal karena ketepatan serta kualitas pengerjaannya. Desainnya yang tak lekang oleh waktu melambangkan kemewahan dan keanggunan.",
    ),
    "Rolex Cellini Date Black Dial": (
      title: "Rolex Cellini Date dengan Muka Hitam",
      description:
          "Rolex Cellini Date dengan muka hitam merupakan jam tangan klasik dan bergengsi. Muka jam hitam serta fitur tanggalnya memancarkan keanggunan dan melambangkan warisan Rolex.",
    ),
    "Rolex Cellini Moonphase": (
      title: "Rolex Cellini Moonphase",
      description:
          "Rolex Cellini Moonphase merupakan mahakarya seni pembuatan jam dengan fitur penunjuk fase bulan dan desain yang indah. Jam ini mencerminkan komitmen Rolex terhadap ketepatan dan keanggunan.",
    ),
    "Rolex Datejust": (
      title: "Rolex Datejust",
      description:
          "Rolex Datejust merupakan jam tangan ikonis dan serbaguna dengan jendela tanggal. Desain yang tak lekang oleh waktu serta keandalannya melambangkan keunggulan Rolex dalam pembuatan jam.",
    ),
    "Rolex Submariner Watch": (
      title: "Jam Tangan Rolex Submariner",
      description:
          "Rolex Submariner adalah jam tangan selam legendaris dengan sejarah panjang. Dikenal karena ketangguhan dan ketahanan airnya, jam ini melambangkan petualangan dan penjelajahan.",
    ),
    "Amazon Echo Plus": (
      title: "Amazon Echo Plus",
      description:
          "Amazon Echo Plus adalah pengeras suara pintar dengan kendali suara Alexa bawaan. Produk ini menghadirkan kualitas suara premium dan berfungsi sebagai pusat kendali perangkat rumah pintar.",
    ),
    "Apple Airpods": (
      title: "Apple Airpods",
      description:
          "Apple Airpods menghadirkan pengalaman mendengarkan audio nirkabel yang praktis. Penyandingan mudah, suara berkualitas tinggi, dan integrasi Siri membuatnya cocok digunakan saat bepergian.",
    ),
    "Apple AirPods Max Silver": (
      title: "Apple AirPods Max Perak",
      description:
          "Apple AirPods Max berwarna perak merupakan headphone premium yang menutupi telinga, dengan audio berketepatan tinggi, penyetaraan suara adaptif, dan peredam bising aktif. Nikmati suara yang mendalam dengan penampilan bergaya.",
    ),
    "Apple Airpower Wireless Charger": (
      title: "Pengisi Daya Nirkabel Apple AirPower",
      description:
          "Pengisi daya nirkabel Apple AirPower menawarkan cara praktis untuk mengisi daya perangkat Apple yang kompatibel. Cukup letakkan perangkat di atas alas pengisian untuk mengisi daya dengan mudah.",
    ),
    "Apple HomePod Mini Cosmic Grey": (
      title: "Apple HomePod Mini Abu-abu Kosmik",
      description:
          "Apple HomePod Mini berwarna abu-abu kosmik adalah pengeras suara pintar berukuran ringkas dengan kualitas audio mengesankan. Integrasinya dengan ekosistem Apple mendukung pengalaman rumah pintar yang praktis.",
    ),
    "Apple iPhone Charger": (
      title: "Pengisi Daya Apple iPhone",
      description:
          "Pengisi daya Apple iPhone berkualitas tinggi dirancang untuk mengisi daya iPhone dengan cepat dan efisien. Pastikan perangkat Anda tetap memiliki daya dan siap digunakan.",
    ),
    "Apple MagSafe Battery Pack": (
      title: "Baterai Tambahan Apple MagSafe",
      description:
          "Baterai tambahan Apple MagSafe menawarkan cara praktis dan mudah dibawa untuk menambah daya iPhone yang mendukung MagSafe. Tempelkan secara magnetis agar baterai terpasang dengan aman.",
    ),
    "Apple Watch Series 4 Gold": (
      title: "Apple Watch Series 4 Emas",
      description:
          "Apple Watch Series 4 berwarna emas merupakan jam tangan pintar yang bergaya dan canggih. Fiturnya mencakup pemantauan detak jantung, pelacakan kebugaran, dan layar Retina yang indah.",
    ),
    "Beats Flex Wireless Earphones": (
      title: "Earphone Nirkabel Beats Flex",
      description:
          "Earphone nirkabel Beats Flex memberikan pengalaman audio yang nyaman dan serbaguna. Bagian telinga bermagnet dan daya tahan baterai hingga 12 jam menjadikannya cocok untuk penggunaan sehari-hari.",
    ),
    "iPhone 12 Silicone Case with MagSafe Plum": (
      title: "Casing Silikon iPhone 12 dengan MagSafe Ungu Prem",
      description:
          "Casing silikon iPhone 12 dengan MagSafe berwarna ungu prem melindungi iPhone 12 sekaligus mempercantik tampilannya. Teknologi MagSafe memudahkan pemasangan aksesori.",
    ),
    "Monopod": (
      title: "Penyangga Kamera Berkaki Tunggal",
      description:
          "Penyangga kamera berkaki tunggal adalah aksesori serbaguna untuk pengambilan gambar yang stabil dan dapat diatur. Cocok untuk memotret swafoto, foto bersama, dan merekam video dengan mudah.",
    ),
    "Selfie Lamp with iPhone": (
      title: "Lampu Swafoto untuk iPhone",
      description:
          "Lampu swafoto untuk iPhone merupakan lampu LED portabel yang dapat disesuaikan untuk memperbaiki pencahayaan swafoto dan panggilan video. Pasang pada iPhone untuk menghasilkan foto dengan pencahayaan yang baik.",
    ),
    "Selfie Stick Monopod": (
      title: "Tongkat Swafoto Berkaki Tunggal",
      description:
          "Tongkat swafoto berkaki tunggal dapat dipanjangkan dan dilipat untuk mengambil swafoto atau foto bersama yang tepat. Perangkat ini kompatibel dengan ponsel dan kamera.",
    ),
    "TV Studio Camera Pedestal": (
      title: "Penyangga Kamera Studio Televisi",
      description:
          "Penyangga kamera studio televisi merupakan sistem penopang kamera kelas profesional untuk menghasilkan gerakan kamera yang halus dan presisi di studio. Cocok untuk penyiaran dan produksi.",
    ),
    "Generic Motorcycle": (
      title: "Sepeda Motor Serbaguna",
      description:
          "Sepeda motor serbaguna ini andal untuk berbagai kebutuhan berkendara. Desainnya yang seimbang memberikan pengalaman berkendara yang nyaman dan efisien.",
    ),
    "Kawasaki Z800": (
      title: "Kawasaki Z800",
      description:
          "Kawasaki Z800 adalah motor sport bertenaga dan lincah yang dikenal melalui desain mencolok serta kinerjanya. Dilengkapi fitur canggih, motor ini menjadi salah satu favorit penggemar sepeda motor.",
    ),
    "MotoGP CI.H1": (
      title: "MotoGP CI.H1",
      description:
          "MotoGP CI.H1 adalah sepeda motor berkinerja tinggi yang terinspirasi teknologi balap MotoGP. Fitur mutakhir dan rekayasa presisinya menghadirkan pengalaman berkendara yang memacu adrenalin.",
    ),
    "Scooter Motorcycle": (
      title: "Sepeda Motor Skuter",
      description:
          "Sepeda motor skuter merupakan kendaraan praktis dan hemat bahan bakar untuk perjalanan sehari-hari di perkotaan. Desain pijakan terbuka dan kendali yang mudah digunakan memudahkan pengendalian kendaraan.",
    ),
    "Sportbike Motorcycle": (
      title: "Sepeda Motor Sport",
      description:
          "Sepeda motor sport dirancang untuk kecepatan dan kelincahan dengan bentuk ramping yang aerodinamis. Cocok bagi pengendara yang menginginkan pengalaman berkendara dinamis dan mendebarkan.",
    ),
    "Attitude Super Leaves Hand Soap": (
      title: "Sabun Cuci Tangan Attitude Super Leaves",
      description:
          "Sabun cuci tangan Attitude Super Leaves menggunakan bahan alami yang menutrisi dan diperkaya manfaat ekstrak dedaunan. Sabun ini membersihkan serta melembapkan tangan sehingga terasa segar dan lembut.",
    ),
    "Olay Ultra Moisture Shea Butter Body Wash": (
      title: "Sabun Mandi Olay Ultra Moisture Shea Butter",
      description:
          "Sabun mandi Olay Ultra Moisture Shea Butter menghadirkan perawatan mewah yang menghidrasi dan menutrisi kulit dengan kelembapan dari mentega shea. Nikmati busa melimpah serta kulit selembut sutra.",
    ),
    "Vaseline Men Body and Face Lotion": (
      title: "Losion Tubuh dan Wajah Vaseline Men",
      description:
          "Losion tubuh dan wajah Vaseline Men diformulasikan secara khusus untuk memberikan kelembapan tahan lama bagi kulit pria. Losion ini cepat meresap dan membantu menjaga kulit tetap terhidrasi serta sehat.",
    ),
    "iPhone 5s": (
      title: "iPhone 5s",
      description:
          "iPhone 5s merupakan ponsel klasik yang dikenal karena desain ringkas dan fitur canggih pada masa peluncurannya. Walaupun merupakan model lama, ponsel ini tetap memberikan pengalaman penggunaan yang andal.",
    ),
    "iPhone 6": (
      title: "iPhone 6",
      description:
          "iPhone 6 merupakan ponsel bergaya dan mumpuni dengan layar lebih besar serta kinerja yang ditingkatkan. Fitur dan unsur desain baru yang diperkenalkannya membuat ponsel ini populer pada masanya.",
    ),
    "iPhone 13 Pro": (
      title: "iPhone 13 Pro",
      description:
          "iPhone 13 Pro merupakan ponsel canggih dengan sistem kamera bertenaga, cip berkinerja tinggi, dan layar yang memukau. Ponsel ini menawarkan fitur tingkat lanjut bagi pengguna yang menginginkan teknologi kelas atas.",
    ),
    "iPhone X": (
      title: "iPhone X",
      description:
          "iPhone X merupakan ponsel unggulan dengan layar OLED tanpa bingkai, teknologi pengenalan wajah Face ID, dan kinerja yang mengesankan. Ponsel ini menjadi tonggak dalam desain dan inovasi iPhone.",
    ),
    "Oppo A57": (
      title: "Oppo A57",
      description:
          "Oppo A57 merupakan ponsel kelas menengah yang dikenal dengan desain ramping dan fitur mumpuni. Keseimbangan antara kinerja dan harga terjangkau menjadikannya pilihan yang populer.",
    ),
    "Oppo F19 Pro Plus": (
      title: "Oppo F19 Pro Plus",
      description:
          "Oppo F19 Pro Plus merupakan ponsel kaya fitur yang berfokus pada kemampuan kamera. Fitur fotografi canggih dan kinerja bertenaga menghadirkan pengalaman penggunaan premium.",
    ),
    "Oppo K1": (
      title: "Oppo K1",
      description:
          "Seri Oppo K1 menawarkan ponsel dengan beragam fitur dan spesifikasi. Dikenal karena desain menarik dan kinerja andal, seri ini memenuhi berbagai preferensi pengguna.",
    ),
    "Realme C35": (
      title: "Realme C35",
      description:
          "Realme C35 merupakan ponsel terjangkau yang berfokus pada fitur penting untuk kebutuhan sehari-hari. Ponsel ini menawarkan kinerja andal dan pengalaman yang mudah digunakan.",
    ),
    "Realme X": (
      title: "Realme X",
      description:
          "Realme X merupakan ponsel kelas menengah yang dikenal dengan desain ramping dan layar mengesankan. Perpaduan kinerja dan kemampuan kameranya sesuai untuk pengguna yang mencari perangkat berkualitas.",
    ),
    "Realme XT": (
      title: "Realme XT",
      description:
          "Realme XT merupakan ponsel kaya fitur yang berfokus pada teknologi kamera. Sensor kamera canggihnya menghasilkan foto dan video berkualitas tinggi bagi penggemar fotografi.",
    ),
    "Samsung Galaxy S7": (
      title: "Samsung Galaxy S7",
      description:
          "Samsung Galaxy S7 merupakan ponsel unggulan yang dikenal karena desain ramping dan fitur canggih. Ponsel ini memiliki layar beresolusi tinggi, kamera bertenaga, dan kinerja tangguh.",
    ),
    "Samsung Galaxy S8": (
      title: "Samsung Galaxy S8",
      description:
          "Samsung Galaxy S8 merupakan ponsel premium dengan Infinity Display yang menghadirkan pengalaman visual memukau. Ponsel ini menawarkan kemampuan kamera canggih dan teknologi mutakhir.",
    ),
    "Samsung Galaxy S10": (
      title: "Samsung Galaxy S10",
      description:
          "Samsung Galaxy S10 merupakan perangkat unggulan dengan layar Dynamic AMOLED, sistem kamera serbaguna, dan kinerja bertenaga. Ponsel ini mencerminkan inovasi serta keunggulan teknologi ponsel pintar.",
    ),
    "Vivo S1": (
      title: "Vivo S1",
      description:
          "Vivo S1 merupakan ponsel kelas menengah bergaya yang memadukan desain dan kinerja. Ponsel ini dilengkapi layar berwarna cerah, sistem kamera mumpuni, dan fungsi yang andal.",
    ),
    "Vivo V9": (
      title: "Vivo V9",
      description:
          "Vivo V9 merupakan ponsel yang dikenal dengan desain ramping dan fokus pada swafoto berkualitas tinggi. Ponsel ini memiliki layar berponi, dua kamera, dan desain modern.",
    ),
    "Vivo X21": (
      title: "Vivo X21",
      description:
          "Vivo X21 merupakan ponsel premium yang berfokus pada teknologi mutakhir. Fiturnya mencakup sensor sidik jari di dalam layar, layar beresolusi tinggi, dan kemampuan kamera canggih.",
    ),
    "American Football": (
      title: "Bola Sepak Amerika",
      description:
          "Bola sepak Amerika merupakan bola klasik yang digunakan dalam pertandingan sepak bola Amerika. Dirancang untuk dilempar dan ditangkap, bola ini merupakan perlengkapan penting dalam olahraga tersebut.",
    ),
    "Baseball Ball": (
      title: "Bola Bisbol",
      description:
          "Bola bisbol standar untuk pertandingan bisbol. Lapisan kulitnya tahan lama dan dirancang untuk kegiatan melempar, memukul, serta menangkap bola dalam permainan bisbol.",
    ),
    "Baseball Glove": (
      title: "Sarung Tangan Bisbol",
      description:
          "Sarung tangan bisbol merupakan perlengkapan pelindung yang dipakai pemain bisbol. Dirancang untuk menangkap dan menguasai bola, sarung tangan ini memberi kenyamanan serta kendali selama pertandingan.",
    ),
    "Basketball": (
      title: "Bola Basket",
      description:
          "Bola basket standar yang digunakan dalam pertandingan basket. Dirancang untuk menggiring, menembak, dan mengoper bola, serta cocok digunakan di dalam maupun luar ruangan.",
    ),
    "Basketball Rim": (
      title: "Ring Basket",
      description:
          "Ring basket merupakan rangkaian lingkaran dan jaring yang kokoh untuk dipasang pada papan pantul. Ring ini menjadi sasaran tembakan untuk mencetak angka dalam permainan basket.",
    ),
    "Cricket Ball": (
      title: "Bola Kriket",
      description:
          "Bola kriket merupakan bola keras berlapis kulit yang digunakan dalam olahraga kriket. Bola dilempar dan dipukul selama permainan; kekerasan serta jahitannya memengaruhi dinamika permainan kriket.",
    ),
    "Cricket Bat": (
      title: "Pemukul Kriket",
      description:
          "Pemukul kriket merupakan perlengkapan penting yang digunakan pemain untuk memukul bola kriket. Terbuat dari kayu dan tersedia dalam berbagai ukuran serta desain.",
    ),
    "Cricket Helmet": (
      title: "Helm Kriket",
      description:
          "Helm kriket adalah pelindung kepala yang digunakan pemain kriket, khususnya pemukul dan penjaga gawang. Helm ini melindungi kepala dari lemparan cepat dan bola yang memantul tinggi.",
    ),
    "Cricket Wicket": (
      title: "Gawang Kriket",
      description:
          "Gawang kriket terdiri atas tiga tonggak dan dua bilah kecil yang digunakan dalam olahraga kriket. Pemukul berusaha melindungi gawang sambil mengumpulkan angka melalui lari.",
    ),
    "Feather Shuttlecock": (
      title: "Kok Bulu Alami",
      description:
          "Kok berbulu alami digunakan dalam olahraga bulu tangkis. Dirancang untuk permainan berkecepatan tinggi, kok ini memberikan kestabilan dan ketepatan selama pertandingan.",
    ),
    "Football": (
      title: "Bola Sepak",
      description:
          "Bola sepak merupakan bola standar yang digunakan dalam olahraga sepak bola. Bola ini dirancang untuk ditendang dan dioper selama permainan.",
    ),
    "Golf Ball": (
      title: "Bola Golf",
      description:
          "Bola golf merupakan bola kecil yang digunakan dalam olahraga golf. Lekukan di permukaannya membantu menghasilkan daya angkat aerodinamis dan jarak tempuh ketika dipukul dengan stik golf.",
    ),
    "Iron Golf": (
      title: "Stik Golf Besi",
      description:
          "Stik golf besi dirancang untuk berbagai jenis pukulan golf. Kepala logam padatnya digunakan untuk pukulan mendekati lubang, pukulan pendek, dan teknik golf lainnya.",
    ),
    "Metal Baseball Bat": (
      title: "Pemukul Bisbol Logam",
      description:
          "Pemukul bisbol logam terbuat dari paduan logam yang tahan lama dan ringan. Umumnya digunakan dalam pertandingan bisbol untuk memukul bola serta latihan memukul.",
    ),
    "Tennis Ball": (
      title: "Bola Tenis",
      description:
          "Bola tenis standar yang digunakan dalam olahraga tenis. Dirancang untuk dipantulkan dan dipukul menggunakan raket selama pertandingan maupun sesi latihan.",
    ),
    "Tennis Racket": (
      title: "Raket Tenis",
      description:
          "Raket tenis merupakan perlengkapan penting dalam olahraga tenis. Raket memiliki bingkai bersenar dan pegangan yang memungkinkan pemain memukul bola tenis.",
    ),
    "Volleyball": (
      title: "Bola Voli",
      description:
          "Bola voli standar yang digunakan dalam olahraga bola voli. Dirancang untuk menerima bola, mengumpan, dan melakukan smes melewati net selama pertandingan.",
    ),
    "Black Sun Glasses": (
      title: "Kacamata Hitam Bingkai Hitam",
      description:
          "Kacamata hitam ini menawarkan gaya klasik dengan bingkai hitam yang rapi dan lensa berwarna gelap. Kacamata memberikan perlindungan dari sinar UV sekaligus penampilan modis.",
    ),
    "Classic Sun Glasses": (
      title: "Kacamata Hitam Klasik",
      description:
          "Kacamata hitam klasik memiliki desain yang tak lekang oleh waktu dengan bingkai berwarna netral dan lensa pelindung UV. Kacamata ini serbaguna dan cocok untuk berbagai kesempatan.",
    ),
    "Green and Black Glasses": (
      title: "Kacamata Hijau dan Hitam",
      description:
          "Kacamata hijau dan hitam menghadirkan perpaduan warna berani untuk menambah keceriaan pada koleksi kacamata Anda. Desainnya bergaya sekaligus menarik perhatian.",
    ),
    "Party Glasses": (
      title: "Kacamata Pesta",
      description:
          "Kacamata pesta dirancang untuk mempercantik busana pesta Anda. Bentuk unik atau bingkai warna-warninya cocok untuk memberi sentuhan ceria pada penampilan saat perayaan.",
    ),
    "Sunglasses": (
      title: "Kacamata Hitam",
      description:
          "Kacamata hitam ini menawarkan desain klasik dan sederhana yang mengutamakan fungsi. Kacamata memberikan perlindungan penting dari sinar UV sambil mempertahankan tampilan yang tak lekang oleh waktu.",
    ),
    "iPad Mini 2021 Starlight": (
      title: "iPad Mini 2021 Starlight",
      description:
          "iPad Mini 2021 berwarna Starlight merupakan tablet ringkas dan bertenaga dari Apple. Layar Retina yang memukau, cip seri A yang bertenaga, dan desain ramping menghadirkan pengalaman tablet premium.",
    ),
    "Samsung Galaxy Tab S8 Plus Grey": (
      title: "Samsung Galaxy Tab S8 Plus Abu-abu",
      description:
          "Samsung Galaxy Tab S8 Plus berwarna abu-abu merupakan tablet Android berkinerja tinggi dari Samsung. Layar AMOLED besar, prosesor bertenaga, dan dukungan S Pen menjadikannya cocok untuk produktivitas maupun hiburan.",
    ),
    "Samsung Galaxy Tab White": (
      title: "Samsung Galaxy Tab Putih",
      description:
          "Samsung Galaxy Tab berwarna putih merupakan tablet Android yang ramping dan serbaguna. Layar dengan warna cerah, baterai tahan lama, dan beragam fitur memberikan pengalaman penggunaan yang baik untuk berbagai aktivitas.",
    ),
    "Blue Frock": (
      title: "Gaun Biru",
      description:
          "Gaun biru merupakan busana menawan dan bergaya untuk berbagai kesempatan. Warna biru yang cerah serta desain nyaman memberi sentuhan elegan pada koleksi pakaian Anda.",
    ),
    "Girl Summer Dress": (
      title: "Gaun Musim Panas Anak Perempuan",
      description:
          "Gaun musim panas anak perempuan hadir dengan desain manis dan sejuk untuk cuaca hangat. Motif ceria serta bahan ringan menjaga kenyamanan dan penampilan selama musim panas.",
    ),
    "Gray Dress": (
      title: "Gaun Abu-abu",
      description:
          "Gaun abu-abu merupakan pilihan serbaguna dan anggun untuk berbagai acara. Warna abu-abu netral mudah dipadukan untuk tampilan resmi maupun santai, menjadikannya pakaian andalan bagi pencinta mode.",
    ),
    "Short Frock": (
      title: "Gaun Pendek",
      description:
          "Gaun pendek menghadirkan tampilan ceria dan trendi dengan potongan yang lebih pendek. Cocok untuk kegiatan santai maupun acara khusus, memadukan gaya dan kenyamanan untuk penampilan modis.",
    ),
    "Tartan Dress": (
      title: "Gaun Motif Tartan",
      description:
          "Gaun ini menggunakan motif tartan klasik untuk memberi sentuhan berkelas yang tak lekang oleh waktu pada koleksi pakaian Anda. Cocok untuk musim gugur dan dingin dengan pesona tradisional.",
    ),
    "300 Touring": (
      title: "300 Touring",
      description:
          "300 Touring adalah sedan bergaya dan nyaman yang dikenal dengan fitur mewah serta kinerja yang halus.",
    ),
    "Charger SXT RWD": (
      title: "Charger SXT RWD",
      description:
          "Charger SXT RWD adalah sedan bertenaga dan sporty dengan penggerak roda belakang yang memadukan kinerja dengan kepraktisan.",
    ),
    "Dodge Hornet GT Plus": (
      title: "Dodge Hornet GT Plus",
      description:
          "Dodge Hornet GT Plus adalah mobil hatchback ringkas dan lincah yang cocok untuk berkendara di perkotaan dengan sentuhan sporty.",
    ),
    "Durango SXT RWD": (
      title: "Durango SXT RWD",
      description:
          "Durango SXT RWD adalah SUV lapang dan serbaguna yang dikenal dengan kinerja tangguh serta fitur yang cocok untuk keluarga.",
    ),
    "Pacifica Touring": (
      title: "Pacifica Touring",
      description:
          "Pacifica Touring adalah minivan bergaya dengan perlengkapan lengkap yang menawarkan kenyamanan dan kemudahan untuk perjalanan keluarga.",
    ),
    "Blue Women's Handbag": (
      title: "Tas Tangan Wanita Biru",
      description:
          "Tas tangan wanita biru merupakan aksesori menarik dan lapang untuk penggunaan sehari-hari. Warna biru cerah serta beberapa kompartemen memadukan gaya dengan fungsi.",
    ),
    "Heshe Women's Leather Bag": (
      title: "Tas Kulit Wanita Heshe",
      description:
          "Tas kulit wanita Heshe menghadirkan kemewahan dan bahan kulit berkualitas tinggi untuk wanita bergaya anggun. Desain yang tak lekang oleh waktu serta pengerjaan tahan lama menjadikannya aksesori serbaguna.",
    ),
    "Prada Women Bag": (
      title: "Tas Wanita Prada",
      description:
          "Tas wanita Prada merupakan tas desainer ikonis yang memancarkan keanggunan dan kemewahan. Dibuat secara presisi dan dilengkapi logo Prada, tas ini menjadi pusat perhatian bagi penggemar mode.",
    ),
    "White Faux Leather Backpack": (
      title: "Ransel Kulit Sintetis Putih",
      description:
          "Ransel kulit sintetis putih merupakan pilihan trendi dan praktis untuk wanita modern. Desain putih yang rapi dan ruang penyimpanan luas cocok untuk gaya santai maupun aktivitas saat bepergian.",
    ),
    "Women Handbag Black": (
      title: "Tas Tangan Wanita Hitam",
      description:
          "Tas tangan wanita hitam merupakan aksesori klasik dan serbaguna yang melengkapi berbagai busana. Warna hitam yang tak lekang oleh waktu serta desain fungsional menjadikannya pelengkap penting koleksi tas wanita.",
    ),
    "Black Women's Gown": (
      title: "Gaun Malam Wanita Hitam",
      description:
          "Gaun malam wanita hitam menghadirkan keanggunan yang tak lekang oleh waktu. Desain hitam yang rapi cocok untuk acara resmi dan istimewa, memancarkan kesan berkelas serta bergaya.",
    ),
    "Corset Leather With Skirt": (
      title: "Korset Kulit dengan Rok",
      description:
          "Korset kulit dengan rok merupakan set busana berani dan tegas yang memadukan korset bergaya dengan rok senada. Cocok untuk pencinta mode yang ingin tampil menonjol di berbagai acara.",
    ),
    "Corset With Black Skirt": (
      title: "Korset dengan Rok Hitam",
      description:
          "Korset dengan rok hitam merupakan set busana anggun dan serbaguna yang memadukan korset modis dengan rok hitam klasik. Set ini menawarkan tampilan trendi dan serasi untuk berbagai acara.",
    ),
    "Dress Pea": (
      title: "Gaun Motif Kacang Polong",
      description:
          "Gaun bermotif kacang polong ini tampil menarik dan nyaman. Cocok untuk kegiatan santai, motifnya menambah unsur ceria pada koleksi pakaian sehingga sesuai untuk penggunaan sehari-hari.",
    ),
    "Marni Red & Black Suit": (
      title: "Setelan Marni Merah dan Hitam",
      description:
          "Setelan Marni merah dan hitam menghadirkan busana berkelas yang mengikuti perkembangan mode. Perpaduan warna merah dan hitam menampilkan desain modern untuk kesan berani serta percaya diri.",
    ),
    "Green Crystal Earring": (
      title: "Anting Kristal Hijau",
      description:
          "Anting kristal hijau merupakan aksesori berkilau dengan kristal hijau cerah. Desain klasiknya memberi sentuhan elegan pada busana Anda, cocok untuk acara resmi atau istimewa.",
    ),
    "Green Oval Earring": (
      title: "Anting Oval Hijau",
      description:
          "Anting oval hijau merupakan aksesori bergaya dan serbaguna dengan bentuk oval yang unik. Warna hijau serta desain modernnya menarik perhatian pada acara santai maupun resmi.",
    ),
    "Tropical Earring": (
      title: "Anting Tropis",
      description:
          "Anting tropis merupakan aksesori ceria yang terinspirasi unsur tropis. Warna cerah dan desain yang hidup cocok untuk menambah nuansa musim panas pada penampilan Anda.",
    ),
    "Black & Brown Slipper": (
      title: "Sandal Hitam dan Cokelat",
      description:
          "Sandal hitam dan cokelat merupakan pilihan nyaman dan menarik untuk penggunaan santai. Perpaduan kedua warnanya menambah sentuhan berkelas saat Anda beristirahat.",
    ),
    "Calvin Klein Heel Shoes": (
      title: "Sepatu Hak Tinggi Calvin Klein",
      description:
          "Sepatu hak tinggi Calvin Klein hadir dengan tampilan elegan dan berkelas untuk acara resmi. Desain klasik serta bahan berkualitas tinggi melengkapi busana Anda yang bergaya.",
    ),
    "Golden Shoes Woman": (
      title: "Sepatu Wanita Emas",
      description:
          "Sepatu wanita emas merupakan pilihan glamor untuk acara istimewa. Warna emas dan desainnya yang menarik memberi sentuhan mewah pada busana Anda.",
    ),
    "Pampi Shoes": (
      title: "Sepatu Pampi",
      description:
          "Sepatu Pampi memadukan kenyamanan dan gaya untuk penggunaan sehari-hari. Desain serbagunanya cocok untuk berbagai kegiatan santai dengan tampilan trendi dan rileks.",
    ),
    "Red Shoes": (
      title: "Sepatu Merah",
      description:
          "Sepatu merah menghadirkan kesan berani melalui warna merah cerah. Untuk pesta maupun kegiatan santai, sepatu ini menambah warna dan gaya pada koleksi pakaian Anda.",
    ),
    "IWC Ingenieur Automatic Steel": (
      title: "IWC Ingenieur Automatic Steel",
      description:
          "Jam tangan IWC Ingenieur Automatic Steel merupakan penunjuk waktu yang tahan lama dan berkelas. Cangkang baja tahan karat serta mesin otomatisnya memadukan ketepatan dan gaya bagi penggemar jam tangan.",
    ),
    "Rolex Datejust Women": (
      title: "Rolex Datejust Wanita",
      description:
          "Jam tangan Rolex Datejust wanita merupakan penunjuk waktu ikonis yang dirancang untuk wanita. Desain yang tak lekang oleh waktu serta fitur tanggal menawarkan keanggunan dan fungsi sekaligus.",
    ),
    "Watch Gold for Women": (
      title: "Jam Tangan Emas Wanita",
      description:
          "Jam tangan emas wanita merupakan aksesori memukau yang memadukan kemewahan dan gaya. Cangkang berlapis emas serta desain anggun menambah sentuhan glamor pada berbagai busana.",
    ),
    "Women's Wrist Watch": (
      title: "Jam Tangan Wanita",
      description:
          "Jam tangan wanita merupakan penunjuk waktu serbaguna dan modis untuk penggunaan sehari-hari. Tali yang nyaman serta desain sederhana namun elegan melengkapi berbagai gaya.",
    ),
  };
}
