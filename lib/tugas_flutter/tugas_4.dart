import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 4 Flutter"
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Biodata - Pasien",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            )
          ),

          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap'
                  ),
                ),
                
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Alamat Email',
                  ),
                ),
                
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'no. Handphone',
                  ),
                ),
                
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Keluhan',
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "List Obat - Obatan",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            )
          ),

          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    "assets/images/medicine/Paracetamol.png",
                    height: 50,
                    width: 50,
                  ),
                  title: Text("Paracetamol"),
                  subtitle: Text("Pereda nyeri dan penurun demam"),
                ),
                
                SizedBox(height: 5,),
                ListTile(
                  leading: Image.asset(
                    "assets/images/medicine/Ibuprofen.png",
                    height: 50,
                    width: 50,
                  ),
                  title: Text("Ibuprofen"),
                  subtitle: Text("Anti-inflamasi dan pereda nyeri"),
                ),

                SizedBox(height: 5,),
                ListTile(
                  leading: Image.asset(
                    "assets/images/medicine/Amoxicillin.jpg",
                    height: 50,
                    width: 50,
                  ),
                  title: Text("Amoxicillin"),
                  subtitle: Text("Antibiotik untuk infeksi bakteri"),
                ),

                SizedBox(height: 5,),
                ListTile(
                  leading: Image.asset(
                    "assets/images/medicine/Cetirizine.jpg",
                    height: 50,
                    width: 50,
                  ),
                  title: Text("Cetirizine"),
                  subtitle: Text("Obat alergi (antihistamin)"),
                ),

                SizedBox(height: 5,),
                ListTile(
                  leading: Image.asset(
                    "assets/images/medicine/Omeprazole.jpg",
                    height: 50,
                    width: 50,
                  ),
                  title: Text("Omeprazole"),
                  subtitle: Text("Mengurangi asam lambung"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}