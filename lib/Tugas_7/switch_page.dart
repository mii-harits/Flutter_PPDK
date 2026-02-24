import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isOn ? Colors.black : Colors.white,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                  value: _isOn, 
                  onChanged: (value) {
                    setState(() {
                      _isOn = value;
                    });
                  },
                ),
                Text("Aktifkan Mode Gelap")
              ],
            ),
            Text(
              _isOn ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
              style: TextStyle(
                color: _isOn ? Colors.white : Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}