import 'package:flutter/material.dart';
import 'package:myapp/ulasan.dart';

Widget cardUlasan(BuildContext context,List<Map<String, dynamic>> dummyReviews) {
  // Gunakan data ulasan dummy untuk jumlah ulasan // Misalnya ada 50 ulasan

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
                    "${dummyReviews.length.toString()} Ulasan",
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
