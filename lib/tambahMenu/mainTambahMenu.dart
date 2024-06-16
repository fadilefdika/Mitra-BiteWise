import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:myapp/tambahMenu/inputMenu.dart'; 
import 'package:myapp/tambahMenu/inputBahan.dart'; 
import 'package:myapp/tambahMenu/tambahGambar.dart';


class TambahMenu extends StatefulWidget {
  const TambahMenu({Key? key}) : super(key: key);

  @override
  _TambahMenuState createState() => _TambahMenuState();
}

class _TambahMenuState extends State<TambahMenu> {
  List<File> imageInputImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 239, 230, 1),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
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
      body:SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputMenu(titleInput: 'NAMA MENU'),
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
                        // Implement max images reached feedback
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Maximum images reached'),
                            duration: Duration(seconds: 2),
                          ),
                        );
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
            InputMenu(titleInput: 'HARGA'),
            SizedBox(height: 20),
            Text(
              "BAHAN-BAHAN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            //InputBahan(),
            SizedBox(height: 20), // Add space at the end to prevent overlapping
          ],
        ),
      )
    );
  }
}