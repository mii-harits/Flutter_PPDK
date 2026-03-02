import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas%2010/registrasi_page.dart';
import 'package:flutter_ppkd/Tugas%209/list_map_page.dart';
import 'package:flutter_ppkd/Tugas%209/list_page.dart';
import 'package:flutter_ppkd/Tugas%209/modul_page.dart';
import 'package:flutter_ppkd/Tugas_11/database/preference.dart';
import 'package:flutter_ppkd/Tugas_11/view/cr_siswa.dart';
import 'package:flutter_ppkd/Tugas_11/view/pendaftaran_user_screen.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';

class DrawerGlobal extends StatefulWidget {
  const DrawerGlobal({super.key});

  @override
  State<DrawerGlobal> createState() => _DrawerGlobalState();
}

class _DrawerGlobalState extends State<DrawerGlobal> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  static List<Widget> listwidget = [
    ListPageDay14(),
    ListMapPageDay14(),
    ModulPage(),
    CrSiswaScreen(),
    PendaftaranUserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("ListView.builder - List"),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text("ListView.builder - List<Map>"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter_list),
              title: const Text("ListView.builder - Model"),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Cr Siswa"),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration_rounded),
              title: const Text("Pendaftaran User"),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                PreferenceHandler().deleteIsLogin();
                context.pushAndRemoveAll(RegistrasiPage());
              },
            ),
          ],
        ),
      ),
      body: Center(child: listwidget.elementAt(_selectedIndex)),
    );
  }
}
