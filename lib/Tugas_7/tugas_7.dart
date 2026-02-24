import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_7/checkbox_page.dart';
import 'package:flutter_ppkd/Tugas_7/date_picker_page.dart';
import 'package:flutter_ppkd/Tugas_7/dropdown_page.dart';
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
    CheckboxPage(),
    SwitchPage(),
    DropdownPage(),
    DatePickerPage(),
    TimePickerPage()
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
      drawer: Drawer(
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
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_list),
              title: const Text('Pilih Kategori Produk'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Pilih Tanggal Lahir'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Atur Pengingat'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}