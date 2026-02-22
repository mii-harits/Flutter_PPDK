import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_5/background_login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          BackgroundLogin(),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/logo/Salutis_logo_2 2.png",
                        height: 160,
                        width: 160,
                      ),
                      
                      Text(
                        "Silahkan Login Untuk Mengakses Akunmu",
                        style: TextStyle(
                          color: Color(0xff575252),
                          fontSize: 13
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.all(16.0),
                    // height: 100,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Masuk Ke Akun Anda",
                            style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
              
                        Text(
                          "Email / Username",
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(width: 10,),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan Email / Username'
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
              
                        Text(
                          "Password",
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(width: 10,),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan Password'
                                  ),
                                ),
                              ),
                              Icon(Icons.visibility)
                            ],
                          ),
                        ),
              
                        Text(
                          "Lupa Password"
                        ),
              
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff0CA2A2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Masuk"
                              ),
              
                              Spacer(),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
              
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color(0xff808080),
                              ),
                            ),
              
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Atau Masuk Dengan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff808080)
                                ),
                              ),
                            ),
              
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color(0xff808080),
                              )
                            )
                          ],
                        ),
              
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffffffff)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/google.svg",
                                    height: 22,
                                    width: 22,
                                  ),
                                  Text(
                                    "Login Dengan Google"
                                  )
                                ],
                              ),
                            ),
            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Belum Memiliki Akun?"
                                ),
                                Text(
                                  "Daftar Sekarang",
                                  style: TextStyle(
                                    color: Color(0xff008080)
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}