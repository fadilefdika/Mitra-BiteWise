import 'package:flutter/material.dart';

class TambahMenu extends StatelessWidget{
  const TambahMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 239, 230, 1),
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
        title:Row(
          children: [
            Text(
              'TAMBAH MAKANAN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Spacer(), // Spacer digunakan untuk membuat jarak antara dua widget
            Text(
              "RESET",
              style: TextStyle(
                color: Color.fromRGBO(79, 111, 82, 1),
                fontSize: 14,
              ),
              
            ),
          ],
        )
      ),
    );
  }
}

