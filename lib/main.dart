import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/permintaanPesanan.dart';
import 'package:myapp/pesananSelesai.dart';
import 'package:myapp/pesananDibatalkan.dart';
import 'package:myapp/pesananDiproses.dart';
import 'package:myapp/ulasan.dart';
import 'package:myapp/daftarMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi data dummy di luar build method
    final List<DummyDataPermintaanPesanan> dummyDataList = generateDummyDataPermintaan();
    final List<DummyDataPesananDiproses> dummyDataList2 = generateDummyDataDiproses();
    final List<DummyDataPesananSelesai> dummyDataList3 = generateDummyDataSelesai();
    final List<DummyDataPesananDibatalkan> dummyDataList4 = generateDummyDataDibatalkan();

    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(245, 239, 230, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(245, 239, 230, 1),
        ),
      ),
      home: MyHomePage(
        title: 'BiteWise',
        dummyDataList: dummyDataList,
        dummyDataList2: dummyDataList2,
        dummyDataList3: dummyDataList3,
        dummyDataList4: dummyDataList4,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.dummyDataList,
    required this.dummyDataList2,
    required this.dummyDataList3,
    required this.dummyDataList4,
  });

  final String title;
  final List<DummyDataPermintaanPesanan> dummyDataList;
  final List<DummyDataPesananDiproses> dummyDataList2;
  final List<DummyDataPesananSelesai> dummyDataList3;
  final List<DummyDataPesananDibatalkan> dummyDataList4;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //const imageUrl = '/home/user/myapp/src/mitra.png';

    return Scaffold(
      appBar: AppBar(
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Lokasi",
                    style: TextStyle(
                      color: Color.fromRGBO(79, 111, 82, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Nama Mitra",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cardPesanan(context, widget.dummyDataList2.length, 'PESANAN DIPROSES', Pesanandiproses()),
                  const SizedBox(width: 11),
                  _cardPesanan(context, widget.dummyDataList.length, "PERMINTAAN PESANAN", PermintaanPesanan()),
                ],
              ),
              const SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cardPesanan(context, widget.dummyDataList3.length, "PESANAN SELESAI", Pesananselesai()),
                  const SizedBox(width: 11),
                  _cardPesanan(context, widget.dummyDataList4.length, "PESANAN DIBATALKAN", Pesanandibatalkan()),
                ],
              ),
              const SizedBox(height: 12),
              _cardUlasan(context),
              const SizedBox(height: 12),
              _cardMenuPopuler(context),
            ],
          ),
        ),
      ),
    );
  }
}

// style untuk card pesanan
Widget _cardPesanan(BuildContext context, int total, String pesanan, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(13.0),
      width: 156,
      height: 156,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              total.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pesanan,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Card untuk ulasan
Widget _cardUlasan(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ulasan()),
      );
    },
    child: SizedBox(
      width: 327,
      height: 95,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      "Ulasan",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: Text(
                      "Lihat Semua Ulasan",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 11,
                        color: Color.fromRGBO(79, 111, 82, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star, // Menetapkan ikon bintang
                    color: Color.fromRGBO(79, 111, 82, 1), // Warna yang sama dengan teks "4.9"
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                  SizedBox(width: 5), // Menambahkan jarak kecil antara dua teks
                  Text(
                    dummyReviews.length.toString() + " Ulasan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
// Card untuk menu populer
Widget _cardMenuPopuler(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DaftarMenu()),
      );
    },
    child: SizedBox(
      width: 327,
      height: 250,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menu Populer Minggu Ini",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaftarMenu()),
                      );
                    },
                    child: Text(
                      "Lihat Semua Menu",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        color: Color.fromRGBO(79, 111, 82, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Spacing between title and carousel
              Expanded(
                child: FoodCarousel(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class FoodCarousel extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Sayur Asem',
      'purchases': '20'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Kukus Waluh',
      'purchases': '15'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Salad Ayam Panggang',
      'purchases': '25'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Smoothie',
      'purchases': '30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160, // Adjusted height for the images and text
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 2.0,
      ),
      items: foodItems.map((food) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      food['image']!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    food['name']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${food['purchases']} pembelian',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

