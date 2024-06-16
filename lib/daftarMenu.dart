import 'package:flutter/material.dart';
import 'package:myapp/detailMakanan.dart';

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
                  ingredients: dummyDaftarMenu[index]['ingredients'],
                  description: dummyDaftarMenu[index]['description'], 
                  totalReviews: dummyDaftarMenu[index]['totalReviews'],                 
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
                  ingredients: dummyDaftarMenu[index]['ingredients'],
                  description: dummyDaftarMenu[index]['description'],
                  totalReviews: dummyDaftarMenu[index]['totalReviews'],                 
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
                  ingredients: dummyDaftarMenu[index]['ingredients'],
                  description: dummyDaftarMenu[index]['description'],
                  totalReviews: dummyDaftarMenu[index]['totalReviews'],
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
  final double totalReviews;
  final double price;
  final double stock;
  final List<String> ingredients;
  final String description;

  const DaftarMenuCard({
    required this.image,
    required this.menu,
    required this.rating,
    required this.totalReviews,
    required this.price,
    required this.stock,
    required this.ingredients,
    required this.description
  });

  @override
 Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailMakanan(
          menuData: {
            'image': image,
            'menu': menu,
            'rating': rating,
            'totalReviews' : totalReviews,
            'price': price,
            'stock': stock,
            'ingredients': ingredients,
            'description': description
          },
        )),
      );
    },
    child: Container(
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
                style: TextStyle(
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
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Stok: $stock',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
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
    'totalReviews' : 12,
    'price': 12000.0,
    'stock': 14,
    'ingredients': [
      "1 ikat kacang panjang",
      "1 buah labu siam",
      "50 gr melinjo",
      "3 buah jagung manis",
      "1,5 liter air",
      "1 sendok makan air asam jawa",
      "4 siung bawah putih",
      "8 siung bawang merah",
      "3 cm lengkuas",
      "3 buah cabai merah",
      "2 sdt gula pasir (sesuai selera)",
      "1/4 sdt garam (sesuai selera)"
    ],
    "description": "Sayur Asem adalah sup sayuran tradisional Indonesia yang memiliki rasa asam segar. Dibuat dengan bahan utama seperti asam Jawa, jagung, kacang panjang, daun melinjo, labu siam, dan berbagai sayuran segar lainnya. Rasanya yang khas dan menyegarkan menjadikannya hidangan favorit di banyak rumah tangga"
  },
  {
    'image': 'assets/images/your_image_2.jpg',
    'menu': 'Salad Ayam Panggang',
    'rating': 5.0,
    'totalReviews' : 22,
    'price': 23000.0,
    'stock': 10,
    'ingredients': [
      "2 potong dada ayam tanpa tulang dan kulit",
      "2 sendok makan minyak zaitun",
      "Garam secukupnya",
      "Lada hitam secukupnya",
      "1 sendok teh bubuk paprika (opsional)",
      "1 ikat selada romaine atau campuran selada",
      "1 buah tomat besar, dipotong dadu",
      "1 buah mentimun, diiris tipis",
      "1 buah paprika merah atau kuning, diiris tipis",
      "1/2 buah bawang merah, diiris tipis",
      "1 buah alpukat, dipotong dadu (opsional)",
      "1/4 cangkir jagung manis (opsional)",
      "1/4 cangkir kacang merah atau kacang hitam (opsional)",
      "1/4 cangkir keju feta atau keju lainnya, dipotong kecil-kecil (opsional)",
      "Crouton (opsional)",
      "1/4 cangkir kacang almond atau kacang lainnya, dipanggang ringan (opsional)"
    ],
    "description": "Salad Ayam Panggang adalah hidangan sehat dan lezat yang terdiri dari potongan dada ayam panggang yang juicy, disajikan di atas campuran segar selada, tomat, mentimun, paprika, dan bawang merah. Ditambah dengan bahan opsional seperti alpukat, jagung manis, kacang merah, dan keju feta, salad ini menawarkan berbagai tekstur dan rasa yang menyegarkan. Disempurnakan dengan dressing balsamic yang ringan, salad ini sempurna untuk makan siang atau makan malam yang sehat."
  },
  {
    'image': 'assets/images/your_image_3.jpg',
    'menu': 'Smoothie',
    'rating': 4.0,
    'totalReviews' : 7,
    'price': 10000.0,
    'stock': 14,
    'ingredients': [
      "200 g blueberry",
      "2 buah pisang",
      "500 ml susu segar rendah lemak",
      "2 sdm madu",
      "es batu secukupnya",
      "Strawberry, kiwi, blueberry, mangga (untuk topping)",
      "Kacang cincang, granola, kismis (untuk topping)"
    ],
    "description": "Smoothie bowl ini menggabungkan rasa segar blueberry, pisang, dan susu rendah lemak yang sehat. Ditambah dengan sentuhan madu dan es batu untuk kesegaran, serta topping beragam buah seperti strawberry, kiwi, mangga, serta kacang cincang, granola, dan kismis untuk menambah tekstur dan cita rasa. Sangat cocok dinikmati sebagai sarapan atau camilan sehat di siang hari."
  },
  {
    'image': 'assets/images/your_image_3.jpg',
    'menu': 'Quaker',
    'rating': 3.0,
    'totalReviews' : 2,
    'price': 9000.0,
    'stock': 0,
    'ingredients': [
      "1 cup Quaker oats",
      "2 cups air atau susu",
      "1 pisang matang, diiris tipis",
      "1/2 cangkir blueberry segar",
      "1 sendok makan madu",
      "1 sendok teh ekstrak vanila",
      "Segenggam almond cincang (opsional)",
      "Potongan buah segar lainnya (opsional)",
      "Granola untuk taburan (opsional)"
    ],
    "description": "Nikmati kelezatan dan kesehatan dalam satu mangkuk smoothie bowl yang menggabungkan Quaker oats dengan pisang matang, blueberry segar, dan sentuhan madu serta ekstrak vanila untuk cita rasa yang menyegarkan. Tambahkan almond cincang dan buah-buahan lainnya untuk variasi tekstur dan rasa yang lebih kaya. Ideal sebagai pilihan sarapan yang bergizi atau camilan sehat di waktu istirahat."
  },
  // Tambahkan lebih banyak item di sini jika diperlukan
];
