import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
    bool showText = false;
    bool showTextDua = false;
    bool showIcon = false;
    bool showIconDua = false;
    bool showTextButton = false;
    bool showInkWell = false;
    int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tugas Lima - Flutter"),
            centerTitle: true,
            backgroundColor: Colors.teal,
        ),
        // Tombol Aksi Mengambang (FloatingActionButton)
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
                setState(() {});
                _counter--;
                print("Angka Sudah Dikurangi");
            },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                // Tombol Aksi Utama (ElevatedButton)
                Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            ElevatedButton(
                                onPressed: () {
                                    setState(() {});
                                    showText = !showText;
                                    print("Tombol ditekan");
                                }, 
                                child: Text("Tampilkan Nama")
                            ),
                        
                            if (showText)
                                Text("Nama Saya Muhammad Harits"),
                          
                            SizedBox(height: 20,),
                            ElevatedButton(
                                onPressed: () {
                                    setState(() {});
                                    showTextDua = !showTextDua;
                                    print("Tombol ditekan");
                                }, 
                                child: Text("Buka Profil")
                            ),
                          
                            if (showTextDua)
                                Text(
                                    "Umur saya 18 Tahun. "
                                    "Saya seorang mahasiswa Semester 2 di Universitas Terbuka jurusan Sistem Informasi"
                                )
                      ],
                    ),
                ),

                // Tombol Ikon Interaktif (IconButton)
                Container(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                        children: [
                            IconButton(
                                onPressed: () {
                                    setState(() {});
                                    showIcon = !showIcon;
                                    print("Icon Diklik");
                                }, 
                                icon: Icon(
                                    Icons.favorite,
                                    color: showIcon ? Colors.red : Colors.grey,
                                )
                            ),

                            if (showIcon)
                                Text("Disukai"),

                            IconButton(
                                onPressed: () {
                                    setState(() {});
                                    showIconDua = !showIconDua;
                                    print("Icon Diklik");
                                }, 
                                icon: Icon(
                                    Icons.bookmark,
                                    color: showIconDua ? Colors.black : Colors.grey,
                                )
                            ),

                            if (showIconDua)
                                Text("Disimpan")
                        ],
                    ),
                ),

                // Tombol Teks Sederhana (TextButton)
                Container(
                    padding: EdgeInsets.all(4.0),
                    child: 
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                                setState(() {});
                                showTextButton = !showTextButton;
                                print("Tombol Teks Ditekan");
                            }, 
                            child: Text("Lihat Selengkapnya")
                        ),

                        if (showTextButton)
                            Text(
                                "Sebagai individu yang ambisius dan visioner, Harits tidak hanya belajar untuk menyelesaikan tugas, "
                                "tetapi juga untuk memahami konsep secara mendalam — mulai dari logika pemrograman, struktur layout Flutter."
                            )
                      ],
                    ),
                ),

                // Area Sentuh dengan Efek Visual (InkWell)
                Center(
                  child: InkWell(
                      onTap: () {
                        setState(() {});
                        showInkWell = !showInkWell;
                        print("Kotak Berhasil Disentuh");
                      },
                      child: Container(
                          padding: EdgeInsets.all(0),
                          height: 100,
                          width: 100,
                          color: Colors.teal,
                      ),
                  ),
                ),

                if (showInkWell)
                    Center(
                        child: 
                        Text(
                            "Kotak Berhasil Disentuh"
                        ),
                    ),
                
                // Sensor Gestur Tingkat Lanjut (GestureDetector)
                Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        children: [
                            GestureDetector(
                                onTap: () {
                                    setState(() {});
                                  _counter++;
                                  print("Ditekan Sekali");
                                },
                                onDoubleTap: () {
                                    setState(() {});
                                  _counter += 2;
                                  print("Ditekan Dua Kali");
                                },
                                onLongPress: () {
                                    setState(() {});
                                  _counter += 3;
                                  print("Tahan Lama");
                                },
                                
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text("$_counter"),
                                      Container(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text("Tekan Saya"),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                        ],
                    ),
                ),            
            ],
        ),
    );
  }
}