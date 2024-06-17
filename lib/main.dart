import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/infoPesanan.dart';
import 'package:myapp/ulasan.dart';
import 'package:myapp/daftarMenu/mainDaftarMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi data dummy di luar build method
    final List<InfoPesanan> dummyDataList = generateInfoPesanan(5, "Pesanan Diproses");
    final List<InfoPesanan> dummyDataList2 = generateInfoPesanan(11, "Permintaan Pesanan");
    final List<InfoPesanan> dummyDataList3 = generateInfoPesanan(23, "Pesanan Selesai");
    final List<InfoPesanan> dummyDataList4 = generateInfoPesanan(4, "Pesanan Dibatalkan");

    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(245, 239, 230, 1),
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
  final List<InfoPesanan> dummyDataList;
  final List<InfoPesanan> dummyDataList2;
  final List<InfoPesanan> dummyDataList3;
  final List<InfoPesanan> dummyDataList4;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                  _cardPesanan(context, widget.dummyDataList.length, 'PESANAN DIPROSES', InfoPesananWidget(titlePesanan: "PESANAN DIPROSES", jmlhPesanan: 5, statusPesanan: "Pesanan Diproses")),
                  const SizedBox(width: 11),
                  _cardPesanan(context, widget.dummyDataList2.length, "PERMINTAAN PESANAN", InfoPesananWidget(titlePesanan: "PERMINTAAN PESANAN", jmlhPesanan: 11, statusPesanan: "Permintaan pesanan")),
                ],
              ),
              const SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cardPesanan(context, widget.dummyDataList3.length, "PESANAN SELESAI", InfoPesananWidget(titlePesanan: "PESANAN SELESAI", jmlhPesanan: 23, statusPesanan: "Pesanan Selesai")),
                  const SizedBox(width: 11),
                  _cardPesanan(context, widget.dummyDataList4.length, "PESANAN DIBATALKAN", InfoPesananWidget(titlePesanan: "PESANAN DIBATALKAN", jmlhPesanan: 4, statusPesanan: "Pesanan Dibatalkan")),
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
  // Gunakan data ulasan dummy untuk jumlah ulasan
  final int dummyReviews = 50; // Misalnya ada 50 ulasan

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
            const Row(
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromRGBO(79, 111, 82, 1),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "$dummyReviews Ulasan",
                    style: const TextStyle(
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

