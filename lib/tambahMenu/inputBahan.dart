import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class InputBahan extends StatefulWidget {
  const InputBahan({Key? key}) : super(key: key);

  @override
  _InputBahanState createState() => _InputBahanState();
}

class _InputBahanState extends State<InputBahan> {
  TextEditingController _bahanController = TextEditingController();
  List<String> bahan = [];
  final _stringTagController = StringTagController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tambah Bahan Makanan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        // Bagian untuk TextFieldTags
        TextFieldTags<String>(
          textfieldTagsController: _stringTagController,
          textSeparators: const [' ', ','],
          validator: (String tag) {
            // Contoh validasi tag
            if (tag == 'php') {
              return 'PHP tidak diizinkan';
            }
            return null;
          },
          inputFieldBuilder: (context, inputFieldValues) {
            return TextField(
              controller: inputFieldValues.textEditingController,
              focusNode: inputFieldValues.focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tambah Tag',
                filled: true,
                fillColor: Colors.white,
              ),
            );
          },
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: bahan.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(bahan[index]),
              );
            },
          ),
        ),
        SizedBox(height: 12),
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
      ],
    );
  }
}
