import 'package:flutter/material.dart';

Widget cardInfoPesanan(BuildContext context, int total, String pesanan, Widget page) {
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
