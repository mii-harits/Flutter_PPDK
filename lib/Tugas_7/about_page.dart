import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Tentang Aplikasi",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 26,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Solutis - Untuk Kesehatan",
                    style: TextStyle(
                    fontSize: 20
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Ini adalah aplikasi kesehatan sebagai syarat untuk memenuhi sertifikasi BNSP "
                    "yang dibuat sebagus mungkin oleh developernya.",
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Text(
                    "Dibuat Oleh: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Muhammad Harits",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.verified),
                  SizedBox(width: 10,),
                  Text(
                    "Versi Aplikasi: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Versi 1.0.0",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}