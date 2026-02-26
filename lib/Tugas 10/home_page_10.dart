import 'package:flutter/material.dart';

class HomePage10 extends StatelessWidget {
  const HomePage10({super.key, required this.nama, required this.kota});
  final String nama;
  final String kota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Terima kasih, $nama dari $kota telah terdaftar"),)],
      ),
    );
  }
}