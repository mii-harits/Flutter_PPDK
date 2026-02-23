import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_6/background_login.dart';
import 'package:flutter_ppkd/Tugas_6/home_page.dart';
import 'package:flutter_ppkd/Tugas_6/register.dart';
import 'package:flutter_ppkd/Tugas_6/with_google.dart';
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
                  SizedBox(height: 50,),
                  Image.asset(
                    "assets/images/logo/Salutis_logo_2 2.png",
                    height: 110,
                    width: 110,
                  ),
                  
                  SizedBox(height: 10,),

                  Text(
                    "Silahkan Login Untuk Mengakses Akunmu",
                    style: TextStyle(
                      color: Color(0xff575252),
                      fontSize: 15
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(36.0),
                    margin: EdgeInsets.all(16.0),
                    // height: 100,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: Offset(0, 10)
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Masuk Ke Akun Anda",
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
              
                        SizedBox(height: 20,),

                        Text(
                          "Email / Username",
                          textAlign: TextAlign.start,
                        ),

                        SizedBox(height: 10,),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 5)
                              )
                            ]
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14
                            ),
                            decoration: InputDecoration(
                              hintText: 'Masukkan Email / Username',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                )
                              )
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
              
                        Text(
                          "Password",
                        ),

                        SizedBox(height: 10,),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 5)
                              )
                            ]
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14
                            ),
                            decoration: InputDecoration(
                              hintText: 'Masukkan Email / Username',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color: Colors.grey,
                                size: 20,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                )
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 15,),
              
                        Align(
                          alignment: Alignment.centerRight,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                Navigator.pushNamed(context, '/halamanBaru');
                              },
                              child: Text(
                                "Lupa Password?",
                                style: TextStyle(color: Color(0xff008080)),
                                textAlign: TextAlign.end,
                              ),
                              splashColor: Colors.teal.withOpacity(0.3),
                            ),
                          ),
                        ),
              
                        SizedBox(height: 5,),

                        Container(
                          height: 50,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors:[
                              Color(0xff0CA2A2).withOpacity(1),
                              Color(0xff0CA2A2).withOpacity(0.6),
                              Color(0xff0CA2A2).withOpacity(1)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff16BEBE).withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 5)
                              )
                            ]
                          ),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context, 
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                  (Route) => false,
                                );
                              },
                              splashColor: Colors.white.withOpacity(0.3),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "Masuk",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  
                                  Positioned(
                                    right: 10,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
              
                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.black87,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
              
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Atau Masuk Dengan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87
                                ),
                              ),
                            ),
              
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.black87,
                                indent: 10,
                                endIndent: 10,
                              )
                            )
                          ],
                        ),
              
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Container(
                              height: 45,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                    offset: Offset(0, 5)
                                  )
                                ]
                              ),

                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => WithGoogle()),
                                    );
                                  },
                                  splashColor: Colors.grey.withOpacity(0.3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/google.svg",
                                        height: 22,
                                        width: 22,
                                      ),
                                      SizedBox(width: 13,),
                                      Text(
                                        "Login Dengan Google",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
            
                            SizedBox(height: 18,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Belum Memiliki Akun? "
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context, 
                                      MaterialPageRoute(builder: (_) => RegisterPage())
                                    );
                                  },
                                  child: Text(
                                    "Daftar Sekarang",
                                    style: TextStyle(
                                      color: Color(0xff008080)
                                    ),
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