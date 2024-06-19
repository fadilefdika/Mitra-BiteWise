import 'package:flutter/material.dart';
import 'package:mitrabitewise/infoPesanan.dart';
import 'package:mitrabitewise/dashboard/cardUlasan.dart';
import 'package:mitrabitewise/dashboard/cardInfoPesanan.dart';
import 'package:mitrabitewise/dashboard/cardMenuTerlaris.dart';
import 'package:mitrabitewise/daftarMenu/dummyDaftarMenu.dart';
import 'package:mitrabitewise/ulasan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi data dummy di luar build method
    final List<InfoPesanan> dummyDataList =
        generateInfoPesanan(9, "Pesanan Diproses");
    final List<InfoPesanan> dummyDataList2 =
        generateInfoPesanan(13, "Permintaan Pesanan");
    final List<InfoPesanan> dummyDataList3 =
        generateInfoPesanan(21, "Pesanan Selesai");
    final List<InfoPesanan> dummyDataList4 =
        generateInfoPesanan(4, "Pesanan Dibatalkan");

    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(245, 239, 230, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(245, 239, 230, 1),
        ),
      ),
      home: dataInfoPesanan(
        title: 'BiteWise',
        dummyDataList: dummyDataList,
        dummyDataList2: dummyDataList2,
        dummyDataList3: dummyDataList3,
        dummyDataList4: dummyDataList4,
      ),
    );
  }
}

class dataInfoPesanan extends StatefulWidget {
  const dataInfoPesanan({
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
  State<dataInfoPesanan> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<dataInfoPesanan> {
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
                  cardInfoPesanan(
                      context,
                      widget.dummyDataList.length,
                      "PESANAN DIPROSES",
                      InfoPesananWidget(
                          titlePesanan: "PESANAN DIPROSES",
                          jmlhPesanan: 7,
                          statusPesanan: "Pesanan Diproses")),
                  const SizedBox(width: 5),
                  cardInfoPesanan(
                      context,
                      widget.dummyDataList2.length,
                      "PERMINTAAN PESANAN",
                      InfoPesananWidget(
                          titlePesanan: "PERMINTAAN PESANAN",
                          jmlhPesanan: 13,
                          statusPesanan: "Permintaan Pesanan")),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cardInfoPesanan(
                      context,
                      widget.dummyDataList3.length,
                      "PESANAN SELESAI",
                      InfoPesananWidget(
                          titlePesanan: "PESANAN SELESAI",
                          jmlhPesanan: 21,
                          statusPesanan: "Pesanan Selesai")),
                  const SizedBox(width: 5),
                  cardInfoPesanan(
                      context,
                      widget.dummyDataList4.length,
                      "PESANAN DIBATALKAN",
                      InfoPesananWidget(
                          titlePesanan: "PESANAN DIBATALKAN",
                          jmlhPesanan: 4,
                          statusPesanan: "Pesanan Dibatalkan")),
                ],
              ),
              const SizedBox(height: 12),
              cardUlasan(context, dummyReviews),
              const SizedBox(height: 14),
              cardMenuTerlaris(context, dummyDaftarMenu),
            ],
          ),
        ),
      ),
    );
  }
}
