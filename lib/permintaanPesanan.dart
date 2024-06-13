import 'package:flutter/material.dart';

class PermintaanPesanan extends StatelessWidget {
  const PermintaanPesanan({super.key});

  @override
  Widget build(BuildContext context) {
    List<DummyDataPermintaanPesanan> dataList = generateDummyDataPermintaan();

    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          'PERMINTAAN PESANAN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 7.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '11 Permintaan Pesanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              for (int i = 0; i < dataList.length; i++)
                CustomCard(
                  statusMakanan: dataList[i].statusMakanan,
                  namaMakanan: dataList[i].namaMakanan,
                  hargaMakanan: dataList[i].hargaMakanan,
                  idMakanan: dataList[i].idMakanan,
                  imagePath: dataList[i].imagePath,
                  key: ValueKey(dataList[i].idMakanan), // Kunci berdasarkan data
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusMakanan,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(255, 165, 0, 1),
                          ),
                        ),
                        Text(
                          namaMakanan,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          idMakanan,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(156, 155, 166, 1),
                          ),
                        ),
                        Text(
                          hargaMakanan,
                          style: const TextStyle(fontSize: 18),
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

class DummyDataPermintaanPesanan {
  final String statusMakanan;
  final String namaMakanan;
  final String hargaMakanan;
  final String idMakanan;
  final String imagePath;

  DummyDataPermintaanPesanan({
    required this.statusMakanan,
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.idMakanan,
    required this.imagePath,
  });
}

List<DummyDataPermintaanPesanan> generateDummyDataPermintaan() {
  return List.generate(11, (index) {
    return DummyDataPermintaanPesanan(
      statusMakanan: 'Permintaan Pesanan',
      namaMakanan: 'Makanan ${index + 1}',
      hargaMakanan: 'Harga ${index + 1}',
      idMakanan: 'ID ${index + 1}',
      imagePath: 'assets/images/makanan${index + 1}.png',
    );
  });
}
