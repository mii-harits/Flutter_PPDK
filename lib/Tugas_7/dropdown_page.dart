import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        DropdownButton(
          value: selected,
          hint: Text("Pilih Kategori Produk"),
          items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((String val) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (val) {
            setState(() {
              selected = val;
            });
          }
        ),
        if (selected != null)
          Text("Anda Telah Memilih Kategori $selected")
      ],
    );
  }
}