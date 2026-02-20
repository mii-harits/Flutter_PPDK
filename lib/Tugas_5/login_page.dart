import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo/Salutis_logo_2.png",
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    "Silahkan Login Untuk Mengakses Akunmu",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}