import 'package:flutter/material.dart';

class TugasSatu extends StatelessWidget {
  const TugasSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff005461),
        title: Text("Profil Saya"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "Nama : Andi Rahmat",
            style: TextStyle(fontSize: 35),
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Text(
                "Jakarta",
              ),
            ],
          ),
          Text(
            "Seorang Pelajar Yang Sedang Belajar Flutter",
            style: TextStyle(fontSize: 15)
          )
        ],
      ),
    );
  }
}