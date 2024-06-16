
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

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
