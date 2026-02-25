import 'package:flutter/material.dart';

class ListPageDay14 extends StatelessWidget {
  ListPageDay14({super.key});
  final List<String> kategori = [
    'Kesehatan Umum',
    'Kesehatan Mental',
    'Gizi & Nutrisi',
    'Penyakit & Pencegahannya',
    'Pertolongan Pertama',
    'Kesehatan Ibu & Anak',
    'Kebugaran & Olahraga',
    'Kesehatan Remaja',
    'Kesehatan Lansia',
    'Kesehatan Lingkungan',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Color(0xff006064)
              ]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: ListTile(
            title: Text(
              kategori[index],
              style: TextStyle(color: Colors.white),
            ),
          )
        );
      },
    );
  }
}