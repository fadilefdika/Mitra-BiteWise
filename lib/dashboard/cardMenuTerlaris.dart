import 'package:flutter/material.dart';
import 'package:myapp/daftarMenu/mainDaftarMenu.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget cardMenuTerlaris(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DaftarMenu()),
      );
    },
    child: SizedBox(
      width: 327,
      height: 250,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menu Populer Minggu Ini",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaftarMenu()),
                      );
                    },
                    child: Text(
                      "Lihat Semua Menu",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        color: Color.fromRGBO(79, 111, 82, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Spacing between title and carousel
              Expanded(
                child: FoodCarousel(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class FoodCarousel extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Sayur Asem',
      'purchases': '20'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Kukus Waluh',
      'purchases': '15'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Salad Ayam Panggang',
      'purchases': '25'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Smoothie',
      'purchases': '30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160, // Adjusted height for the images and text
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 2.0,
      ),
      items: foodItems.map((food) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      food['image']!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    food['name']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${food['purchases']} pembelian',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

