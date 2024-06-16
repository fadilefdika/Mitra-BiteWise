import 'package:flutter/material.dart';

class InputMenu extends StatefulWidget {
  final String titleInput; 
  final double line;
  const InputMenu({Key? key, required this.titleInput, required this.line}) : super(key: key);

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
              labelStyle: TextStyle(
                fontSize: 12,
              ),
              filled: true,
              fillColor: Colors.white,
               focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(79, 111, 82, 1)),
                ),
              ),
            cursorColor: Color.fromRGBO(79, 111, 82, 1), 
            maxLines: widget.line.toInt(),
          ),
        ),
      ],
    );
  }
}
