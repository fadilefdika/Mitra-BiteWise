import 'package:flutter/material.dart';
import 'package:myapp/daftarMenu/mainDaftarMenu.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget cardMenuTerlaris(BuildContext context, List<Map<String, dynamic>> menuList) {
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
                    "Menu Terlaris Minggu Ini",
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
                child: FoodCarousel(menuList: menuList),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class FoodCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> menuList;

  FoodCarousel({required this.menuList});

  @override
  Widget build(BuildContext context) {
     menuList.sort((a, b) => b['purchase'].compareTo(a['purchase']));

    // Mengambil hanya 3 menu teratas setelah sorting
    List<Map<String, dynamic>> topThreeMenus = menuList.take(3).toList();

    return CarouselSlider(
      options: CarouselOptions(
        height: 160, // Adjusted height for the images and text
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 2.0,
      ),
      items: topThreeMenus.map((food) {
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
                      food['image'],
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    food['menu'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${food['purchase']} pembelian',
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
