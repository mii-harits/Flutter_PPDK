import 'package:flutter/material.dart';

class TugasDua extends StatelessWidget {
  const TugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salutis"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(

        // ========== Identitas Utama (Baris 1) ==========
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: 
              Text(
                "Muhammad Harits - Founder",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // ========== Detail Kontak / Informasi (Baris 2) ==========
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal,
                    Color(0xff3BC1A8),
                    Color(0xffBDE8F5),
                  ] 
                ),
                borderRadius: BorderRadius.circular(20)
              ), 
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 15),
                      Text(
                        "harits4work@gmail.com",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height:7,),

                  Row(
                    children: [
                      Icon(Icons.badge),
                      SizedBox(width: 15),
                      Text(
                        "31652936623",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),


                  // ========== Aksi / Informasi Pendukung (Baris 3) ==========
                  SizedBox(height:7,),

                  Row(
                    children: [
                      Icon(Icons.phone_android),
                      SizedBox(width: 15),
                      Spacer(),
                      Text(
                        "+62-896-1152-4939",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height:7,),

                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 15),
                      Spacer(),
                      Text(
                        "Jakarta, Indonesia",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
          ),

          // ========== Area Statistik Horizontal (Baris 4) ==========
          Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Center(
              child: Text(
                    "Kombinasi Warna Inti Aplikasi Salutis",
                    style: TextStyle(fontSize: 20),
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height:70,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Teal",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Container(
                    height:70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "White",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Container(
                    height:70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Grey",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),

          //========== Deskripsi Naratif (Baris 5) ==========
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffBDE8F5)
              ),
              child: Text(
                "Kombinasi warna pada aplikasi Salutis dirancang untuk mencerminkan kepercayaan, ketenangan, dan profesionalisme dalam layanan kesehatan digital. "
                "Perpaduan warna yang harmonis ini bertujuan memberikan kenyamanan visual serta meningkatkan pengalaman pengguna.",
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),

          //========== Visual Branding (Baris 6 ) ==========
          Center(
            child: Image.asset(
              "assets/images/Silabus New Logo.png",
              width: 200,
              height: 200,
              
            ),
          )

        ],
      ),
    );
  }
}