import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/detailMakanan.dart';
import 'package:myapp/daftarMenu/dummyDaftarMenu.dart';

void main() => runApp(MaterialApp(home: DaftarMenu()));

class DaftarMenu extends StatelessWidget {
  const DaftarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter menu berdasarkan stok
    List<Map<String,dynamic>> menuTerlaris = dummyDaftarMenu.where((menu) => menu['purchase'] > 0).toList();
    menuTerlaris.sort((a, b) => b['purchase'].compareTo(a['purchase']));
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
              child: Center(
                child: Text(
                  'Terlaris',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  'Tersedia',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  'Stok\nHabis',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  'Semua',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          indicatorColor: Color.fromRGBO(79, 111, 82, 1),
          labelColor: Color.fromRGBO(79, 111, 82, 1),
        ),
        ),
        body: TabBarView(
          children: [
            buildMenuGrid(menuTerlaris),
            buildMenuGrid(menuTersedia),
            buildMenuGrid(menuStokHabis),
            buildMenuGrid(dummyDaftarMenu),
          ],
        ),
      ),
    );
  }

  Widget buildMenuGrid(List<Map<String, dynamic>> menuList) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 150 / 230,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        return DaftarMenuCard(
          image: menuList[index]['image'],
          menu: menuList[index]['menu'],
          rating: menuList[index]['rating'],
          price: menuList[index]['price'],
          stock: menuList[index]['stock'],
          ingredients: menuList[index]['ingredients'],
          description: menuList[index]['description'],
          totalReviews: menuList[index]['totalReviews'],
        );
      },
    );
  }
}
