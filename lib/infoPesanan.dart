// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

// Create the InfoPesanan class
class InfoPesanan extends StatelessWidget {
  // Build the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        // Leading icon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Menggunakan Navigator.pop untuk kembali ke layar sebelumnya
          },
        ),
        // Title
        title: const Text('PESANAN DIPROSES'),
      ),
      // Body
      body: SingleChildScrollView( // Menambahkan SingleChildScrollView untuk memastikan konten dapat digulir
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
                '07 Pesanan Sedang Diproses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Cards
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.all(8.0), // Menambahkan padding
                child: Card(
                  // Child
                  child: Column(
                    // MainAxisSize.min untuk menghindari overflow
                    mainAxisSize: MainAxisSize.min,
                    // Children
                    children: [
                      // Image
                      Image.asset(
                        'assets/images/makanan.png',
                        height: 150, // Menentukan tinggi gambar
                        width: double.infinity, // Mengisi lebar gambar dengan lebar Card
                        fit: BoxFit.cover, // Menyesuaikan gambar agar muat dalam container
                      ),
                      // Text
                      const Padding(
                        padding: EdgeInsets.all(8.0), // Menambahkan padding
                        child: Text(
                          'Nama Makanan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      // Text
                      const Padding(
                        padding: EdgeInsets.all(8.0), // Menambahkan padding
                        child: Text(
                          'Harga Makanan',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      // Text
                      const Padding(
                        padding: EdgeInsets.all(8.0), // Menambahkan padding
                        child: Text(
                          'ID Makanan',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
