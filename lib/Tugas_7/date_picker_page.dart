import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2027)
            );
            if (picked != null) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          child: Text("Pilih Tanggal Lahir")
        ),
        if (selectedDate != null)
          Text(
            "tanggal Lahir : ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
          )
      ],
    );
  }
}