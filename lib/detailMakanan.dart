import 'package:flutter/material.dart';
import 'package:mitrabitewise/tambahMenu/mainTambahMenu.dart';

class DetailMakanan extends StatelessWidget {
  final Map<String, dynamic> menuData;

  const DetailMakanan({Key? key, required this.menuData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = menuData['image'];
    String menu = menuData['menu'];
    double rating = menuData['rating'];
    double totalReviews = menuData['totalReviews'];
    double price = menuData['price'];
    double stock = menuData['stock'];
    List<String> ingredients = menuData['ingredients'] != null
        ? List<String>.from(menuData['ingredients'])
        : [];
    String description = menuData['description'] ?? '';

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
        title: Row(
          children: [
            Text(
              'DETAIL MAKANAN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TambahMenu()), // Ganti dengan TambahMenu
                );
              },
              child: Text(
                "EDIT",
                style: TextStyle(
                  color: Color.fromRGBO(79, 111, 82, 1),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  menu,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp' + price.toStringAsFixed(0),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromRGBO(79, 111, 82, 1),
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(79, 111, 82, 1),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '($totalReviews ulasan)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(156, 155, 166, 1),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Stok: $stock',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Bahan-bahan:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingredients
                    .map((ingredient) => Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text('- $ingredient'),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
