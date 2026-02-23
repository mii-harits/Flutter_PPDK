import 'package:flutter/material.dart';

class WithGoogle extends StatelessWidget {
  const WithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Dengan Google"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
    );
  }
}