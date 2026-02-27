import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas%2010/registrasi_page.dart';
import 'package:flutter_ppkd/Tugas%209/drawer_global.dart';
import 'package:flutter_ppkd/Tugas_11/database/preference.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    if (data==true) {
      context.pushAndRemoveAll(DrawerGlobal());
    } else {
      context.pushAndRemoveAll(RegistrasiPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo/Salutis_logo_3.png")
        ],
      ),
    );
  }
}