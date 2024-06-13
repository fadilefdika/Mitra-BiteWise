// Import necessary libraries
import 'package:flutter/material.dart';

// Create the Pesananselesai class
class Pesanandiproses extends StatelessWidget {
  const Pesanandiproses({super.key});

  // Build the widget
  @override
  Widget build(BuildContext context) {
    List<DummyDataPesananDiproses> dataList = generateDummyDataDiproses();

    return Scaffold(
      // App bar
      appBar: AppBar(
        // Leading icon
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Title
        title: const Text(
          'PESANAN DIPROSES',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      // Body
      body: SingleChildScrollView(
        // Menambahkan SingleChildScrollView untuk memastikan konten dapat digulir
        child: Padding(
          padding: const EdgeInsets.only(top: 7.0, left: 25.0, right: 25.0),
          child: Column(
            // MainAxisSize.min untuk menghindari overflow
            mainAxisSize: MainAxisSize.min,
            // CrossAxisAlignment.stretch untuk memastikan setiap widget memenuhi lebar layar
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Children
            children: [
              // Text
              const Padding(
                padding: EdgeInsets.all(8.0), // Menambahkan padding
                child: Text(
                  '05 Pesanan diproses',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.normal
                    ),
                ),
              ),
              // Cards
              for (int i = 0; i < dataList.length; i++)
                CustomCard(
                  statusMakanan: dataList[i].statusMakanan,
                  namaMakanan: dataList[i].namaMakanan,
                  hargaMakanan: dataList[i].hargaMakanan,
                  idMakanan: dataList[i].idMakanan,
                  imagePath: dataList[i].imagePath, 
                  key: UniqueKey(), 
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String statusMakanan;
  final String namaMakanan;
  final String hargaMakanan;
  final String idMakanan;
  final String imagePath;

  const CustomCard({
    required Key key,
    required this.statusMakanan,
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.idMakanan,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Menambahkan padding
      child: Card(
        color: Colors.white,
        // Child
        child: Column(
          // MainAxisSize.min untuk menghindari overflow
          mainAxisSize: MainAxisSize.min,
          // Children
          children: [
            Row(
  children: [
    Expanded(
      child: Image.asset(
        imagePath ?? 'assets/images/makanan.png',
        width: 40,
        height: 40, // Menentukan tinggi gambar
        fit: BoxFit.cover, // Menyesuaikan gambar agar muat dalam container
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Menambahkan padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statusMakanan ?? 'Status Makanan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(79, 111, 82, 1)
              ),
            ),
            Text(
              namaMakanan ?? 'Nama Makanan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              idMakanan ?? 'ID Makanan',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(156, 155, 166, 1)
                ),
            ),
            Text(
              hargaMakanan ?? 'Harga Makanan',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}

class DummyDataPesananDiproses {
  final String statusMakanan;
  final String namaMakanan;
  final String hargaMakanan;
  final String idMakanan;
  final String imagePath;

  DummyDataPesananDiproses({
    required this.statusMakanan,
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.idMakanan,
    required this.imagePath,
  });
}

List<DummyDataPesananDiproses> generateDummyDataDiproses() {
  return List.generate(5, (index) {
    return DummyDataPesananDiproses(
      statusMakanan: 'Pesanan Diproses',
      namaMakanan: 'Makanan ${index + 1}',
      hargaMakanan: 'Harga ${index + 1}',
      idMakanan: 'ID ${index + 1}',
      imagePath: 'assets/images/makanan${index + 1}.png', // Disesuaikan dengan nama file gambar
    );
  });
}
