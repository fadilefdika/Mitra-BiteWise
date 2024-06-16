import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TambahMenu extends StatefulWidget {
  const TambahMenu({Key? key}) : super(key: key);

  @override
  _TambahMenuState createState() => _TambahMenuState();
}

class _TambahMenuState extends State<TambahMenu> {
  TextEditingController _namaMenuController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  List<File> imageInputImages = []; // List to store selected images as Files
  TextEditingController _bahanController = TextEditingController();
  List<String> bahan = [];

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
        title: Text(
          'TAMBAH MAKANAN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                imageInputImages.clear(); // Clear the image list
              });
            },
            child: Text(
              "RESET",
              style: TextStyle(
                color: Color.fromRGBO(79, 111, 82, 1),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NAMA MENU",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: TextField(
                controller: _namaMenuController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Menu',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UNGGAH FOTO/VIDEO",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                ImageInputWidget(
                  images: imageInputImages,
                  allowEdit: true, // Allow editing images
                  allowMaxImage: 5, // Maximum images allowed
                  onImageSelected: (image) {
                    setState(() {
                      if (imageInputImages.length < 5) {
                        imageInputImages.add(image);
                      } else {
                        // Implement a max images reached feedback here
                      }
                    });
                  },
                  onImageRemoved: (image, index) {
                    setState(() {
                      imageInputImages.remove(image);
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "HARGA",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 150,
              child: TextField(
                controller: _hargaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Harga',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "BAHAN-BAHAN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: _bahanController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Masukkan bahan...',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        bahan.add(value);
                        _bahanController.clear();
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: bahan.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(bahan[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageInputWidget extends StatelessWidget {
  final List<File> images;
  final bool allowEdit;
  final int allowMaxImage;
  final Function(File) onImageSelected;
  final Function(File, int) onImageRemoved;

  ImageInputWidget({
    required this.images,
    required this.allowEdit,
    required this.allowMaxImage,
    required this.onImageSelected,
    required this.onImageRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length + 1, // Plus one for add button
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == images.length) {
            return Container(
              width: 110,
              height: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Menambahkan border dengan warna abu-abu
                borderRadius: BorderRadius.circular(20), // Membuat sudut rounded dengan radius 20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      if (images.length < allowMaxImage) {
                        final picker = ImagePicker();
                        final pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedFile != null) {
                          onImageSelected(File(pickedFile.path));
                        }
                      } else {
                        // Implement a max images reached feedback here
                      }
                    },
                  ),
                  Text(
                    "Tambah",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }
          return Stack(
            children: [
              Image.file(images[index]),
              if (allowEdit)
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      onImageRemoved(images[index], index);
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
