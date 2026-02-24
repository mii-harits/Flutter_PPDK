import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_6/home_page.dart';
import 'package:flutter_ppkd/Tugas_7/about_page.dart';
import 'package:flutter_ppkd/Tugas_7/checkbox_page.dart';
import 'package:flutter_ppkd/Tugas_7/date_picker_page.dart';
import 'package:flutter_ppkd/Tugas_7/dropdown_page.dart';
import 'package:flutter_ppkd/Tugas_7/home_page.dart';
import 'package:flutter_ppkd/Tugas_7/switch_page.dart';
import 'package:flutter_ppkd/Tugas_7/time_picker_page.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  int _selectedIndex = 0 ;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CheckboxPage(),
    SwitchPage(),
    DropdownPage(),
    DatePickerPage(),
    TimePickerPage(),
    AboutPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;      
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Text"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: _selectedIndex == 6 ? null : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                
              ),
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Syarat Dan Ketentuan'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_list),
              title: const Text('Pilih Kategori Produk'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Pilih Tanggal Lahir'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Atur Pengingat'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex == 6 ? 1 : 0,
        selectedItemColor: Colors.teal,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _selectedIndex = 0;
            } else if (index == 1) {
              _selectedIndex = 6;
            }
          });
        },
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About' 
          )
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}