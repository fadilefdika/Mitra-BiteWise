import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(245, 239, 230, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(245, 239, 230, 1),
        ),
      ),
      home: const MyHomePage(
        title: 'BiteWise',
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const imageUrl = '/home/user/myapp/src/mitra.png';

    return Scaffold(
     appBar: AppBar(
          title: const Row(
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContainer(07, "PESANAN DIPROSES"),
                SizedBox(width: 13), // Memberikan jarak antara dua kotak
                _buildContainer(11, "PERMINTAAN PESANAN"),
              ],
            ),
            SizedBox(height: 13), // Memberikan jarak antara dua baris
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContainer(23, "PESANAN SELESAI"),
                SizedBox(width: 13), // Memberikan jarak antara dua kotak
                _buildContainer(03, "PESANAN DIBATALKAN"),
              ],
            ),
            const SizedBox(height: 13), // Memberikan jarak antara baris terakhir dan Card
            // Card untuk ulasan
            _cardUlasan(),
            const SizedBox(height: 13),
            // Card untuk menu populer
            _cardMenuPopuler(),

           ],
        ),
      ),
      );
    }
  }

// style untuk card pesanan
Widget _buildContainer(int total, String pesanan) {
  return Container(
    width: 156,
    height: 155,
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
            total.toString().padLeft(2, '0'), // Mengonversi nilai total ke String
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
  );
}

// Card untuk ulasan
Widget _cardUlasan() {
  return SizedBox(
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
          const Padding(
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
                  "20 Ulasan",
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
  );
}

// Card untuk menu populer
Widget _cardMenuPopuler() {
  return SizedBox(
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
                    "Menu Populer Minggu Ini",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 13, 0),
                  child: Text(
                    "Lihat Semua Menu",
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
          const Padding(
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
                  "20 Ulasan",
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
  );
}
