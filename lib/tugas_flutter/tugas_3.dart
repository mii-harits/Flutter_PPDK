import 'package:flutter/material.dart';

class TugasTiga extends StatelessWidget {
  const TugasTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Tugas 3 Flutter"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
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
                      labelText: 'Password Email',
                    ),
                  ),
                  SizedBox(height: 5,),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'no. Handphone',
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                // childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.teal,
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text(
                              "Teal",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        color: Colors.grey,
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text(
                              "Grey",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text(
                              "White",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        color: Colors.teal,
                      ),

                      Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          padding: EdgeInsets.all(0),
                          child: Image.asset("assets/images/logo/Salutis_logo_1.png"),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        color: Colors.grey,
                      ),
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(0),
                          child: Image.asset("assets/images/logo/Salutis_logo_2.png")
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                      ),

                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(0),
                          child: Image.asset("assets/images/logo/Salutis_logo_3.png")
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}