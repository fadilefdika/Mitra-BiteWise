import 'package:flutter/material.dart';

class InputMenu extends StatefulWidget {
  final String titleInput; // Ubah menjadi camelCase untuk sesuai konvensi Dart
  const InputMenu({Key? key, required this.titleInput}) : super(key: key);

  @override
  _InputMenuState createState() => _InputMenuState();
}

class _InputMenuState extends State<InputMenu> {
  TextEditingController _inputMenuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleInput, 
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 8),
        Container(
          child: TextField(
            controller: _inputMenuController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.titleInput,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
