import 'package:flutter/material.dart';

class InputBahan extends StatefulWidget {
  final String titleInput;
  const InputBahan({Key? key, required this.titleInput}) : super(key: key);

  @override
  _InputMenuState createState() => _InputMenuState();
}

class _InputMenuState extends State<InputBahan> {
  TextEditingController _inputMenuController = TextEditingController();
  List<String> _bahanList = [];

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
              labelText: "Tambahkan bahan",
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
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _bahanList.add(value);
                });
                _inputMenuController.clear();
              }
            },
          ),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _bahanList.map((bahan) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "- $bahan",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
