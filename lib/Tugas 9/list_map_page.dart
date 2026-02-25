import 'package:flutter/material.dart';

class ListMapPageDay14 extends StatelessWidget {
  ListMapPageDay14({super.key});
  final List<Map<String, dynamic>> kategori = [
    {
      'title': 'Kesehatan Umum',
      'icon': Icons.health_and_safety,
      "color": Colors.blue,
      "description": "Edukasi pola hidup sehat sehari-hari",
    },
    {
      'title': 'Kesehatan Mental',
      'icon': Icons.psychology,
      "color": Colors.purple,
      "description": "Kelola stres dan kesehatan emosional",
    },
    {
      'title': 'Gizi & Nutrisi',
      'icon': Icons.restaurant,
      "color": Colors.orange,
      "description": "Panduan makanan sehat dan gizi seimbang",
    },
    {
      'title': 'Penyakit & Pencegahan',
      'icon': Icons.coronavirus,
      "color": Colors.red,
      "description": "Kenali penyakit umum dan cara mencegahnya",
    },
    {
      'title': 'Pertolongan Pertama',
      'icon': Icons.medical_services,
      "color": Colors.white,
      "description": "Panduan penanganan kondisi darurat",
    },
    {
      'title': 'Kesehatan Ibu & Anak',
      'icon': Icons.child_care,
      "color": Colors.pink,
      "description": "Informasi kehamilan dan tumbuh kembang anak",
    },
    {
      'title': 'Kebugaran & Olahraga',
      'icon': Icons.fitness_center,
      "color": Colors.green,
      "description": "Latihan dan aktivitas fisik untuk kebugaran",
    },
    {
      'title': 'Kesehatan Remaja',
      'icon': Icons.groups,
      "color": Colors.indigo,
      "description": "Edukasi kesehatan untuk usia remaja",
    },
    {
      'title': 'Kesehatan Lansia',
      'icon': Icons.elderly,
      "color": Colors.brown,
      "description": "Perawatan dan kesehatan usia lanjut",
    },
    {
      'title': 'Kesehatan Lingkungan',
      'icon': Icons.eco,
      "color": Colors.lightGreen,
      "description": "Menjaga lingkungan untuk hidup yang lebih sehat",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (BuildContext context, int index) {
        final data = kategori[index];
        return Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              data['title'],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              data['icon'],
              color: data['color'],
            ),
            subtitle: Text(
              data['description'],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}