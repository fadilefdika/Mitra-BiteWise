import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: DaftarMenu()));

class DaftarMenu extends StatelessWidget {
  const DaftarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter menu berdasarkan stok
    List<Map<String, dynamic>> menuTersedia = dummyDaftarMenu.where((menu) => menu['stock'] > 0).toList();
    List<Map<String, dynamic>> menuStokHabis = dummyDaftarMenu.where((menu) => menu['stock'] == 0).toList();

    return DefaultTabController(
      length: 4, // Jumlah tab navigasi
      child: Scaffold(
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
          title: const Text(
            'DAFTAR MENU',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Popular Minggu Ini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tersedia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Stok Habis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Semua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                ),
              ),
            ],
            indicatorColor: Color.fromRGBO(79, 111, 82, 1),
          ),
        ),
        body: TabBarView(
          children: [
            // Konten untuk setiap tab
            Container(
              child: Center(
                child: Text('Popular Minggu Ini Content'),
              ),
            ),
            Container(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 230,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: menuTersedia.length,
                itemBuilder: (context, index) {
                  return DaftarMenuCard(
                    image: menuTersedia[index]['image'],
                    menu: menuTersedia[index]['menu'],
                    rating: menuTersedia[index]['rating'],
                    price: menuTersedia[index]['price'],
                    stock: menuTersedia[index]['stock'],
                  );
                },
              ),
            ),
            Container(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 230,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: menuStokHabis.length,
                itemBuilder: (context, index) {
                  return DaftarMenuCard(
                    image: menuStokHabis[index]['image'],
                    menu: menuStokHabis[index]['menu'],
                    rating: menuStokHabis[index]['rating'],
                    price: menuStokHabis[index]['price'],
                    stock: menuStokHabis[index]['stock'],
                  );
                },
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 150 / 230,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: dummyDaftarMenu.length,
              itemBuilder: (context, index) {
                return DaftarMenuCard(
                  image: dummyDaftarMenu[index]['image'],
                  menu: dummyDaftarMenu[index]['menu'],
                  rating: dummyDaftarMenu[index]['rating'],
                  price: dummyDaftarMenu[index]['price'],
                  stock: dummyDaftarMenu[index]['stock'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DaftarMenuCard extends StatelessWidget {
  final String image;
  final String menu;
  final double rating;
  final double price;
  final double stock;

  const DaftarMenuCard({
    required this.image,
    required this.menu,
    required this.rating,
    required this.price,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 230,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                truncateText(menu, 2),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(79, 111, 82, 1),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(79, 111, 82, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Rp$price',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Stok: $stock',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String truncateText(String text, int maxWords) {
    List<String> words = text.split(' ');
    if (words.length > maxWords) {
      return words.sublist(0, maxWords).join(' ') + '...';
    } else {
      return text;
    }
  }
}

List<Map<String, dynamic>> dummyDaftarMenu = [
  {
    'image': 'assets/images/your_image_1.jpg',
    'menu': 'Sayur Asem',
    'rating': 4.5,
    'price': 12000.0,
    'stock': 14,
  },
  {
    'image': 'assets/images/your_image_2.jpg',
    'menu': 'Salad Ayam Panggang',
    'rating': 5.0,
    'price': 23000.0,
    'stock': 10,
  },
  {
    'image': 'assets/images/your_image_3.jpg',
    'menu': 'Smoothie',
    'rating': 4.0,
    'price': 10000.0,
    'stock': 14,
  },
  {
    'image': 'assets/images/your_image_3.jpg',
    'menu': 'Quaker',
    'rating': 3.0,
    'price': 9000.0,
    'stock': 0,
  },
  // Tambahkan lebih banyak item di sini jika diperlukan
];
