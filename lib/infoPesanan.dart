import 'package:flutter/material.dart';

class InfoPesananWidget extends StatelessWidget {
  final String titlePesanan;
  final int jmlhPesanan;
  final String statusPesanan;

  const InfoPesananWidget({
    Key? key,
    required this.titlePesanan,
    required this.jmlhPesanan,
    required this.statusPesanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<InfoPesanan> dataList = generateInfoPesanan(jmlhPesanan, statusPesanan);

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
        title: Text(
          titlePesanan,
          style: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$jmlhPesanan Permintaan Pesanan',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              for (int i = 0; i < dataList.length; i++)
                CustomCard(
                  key: ValueKey(dataList[i].idMakanan),
                  statusMakanan: dataList[i].statusMakanan,
                  namaMakanan: dataList[i].namaMakanan,
                  hargaMakanan: dataList[i].hargaMakanan,
                  idMakanan: dataList[i].idMakanan,
                  imagePath: dataList[i].imagePath,
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: getStatusColor(statusMakanan),
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

Color getStatusColor(String status) {
                          if (status == "Pesanan Diproses") {
                            return Color.fromRGBO(255, 165, 0, 1);
                          } else if (status == "Permintaan Pesanan") {
                            return Color.fromRGBO(79, 111, 82, 1);
                          } else if (status == "Pesanan Selesai") {
                            return Color.fromRGBO(76, 175, 80, 1);
                          } else if (status == "Pesanan Dibatalkan") {
                            return Color.fromRGBO(255, 13, 13, 1);
                          } else {
                            return Colors.black; // Default color if none of the conditions match
                          }
                        }

class InfoPesanan {
  final String statusMakanan;
  final String namaMakanan;
  final String hargaMakanan;
  final String idMakanan;
  final String imagePath;

  InfoPesanan({
    required this.statusMakanan,
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.idMakanan,
    required this.imagePath,
  });
}

List<InfoPesanan> generateInfoPesanan(int jmlhPesanan, String statusPesanan) {
  return List.generate(jmlhPesanan, (index) {
    return InfoPesanan(
      statusMakanan: statusPesanan,
      namaMakanan: 'Makanan ${index + 1}',
      hargaMakanan: 'Harga ${index + 1}',
      idMakanan: 'ID ${index + 1}',
      imagePath: 'assets/images/makanan${index + 1}.png',
    );
  });
}
