import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff740A03),
        title: Text("PPKD Batch 5 - Muhammad Harits"),
        centerTitle: true,
      ),
      body: Text("Halo semuanya"),
      backgroundColor: Color(0xffE5D9B6), 
    );
  }
}