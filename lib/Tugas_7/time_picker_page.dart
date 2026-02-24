import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now()
             );
             if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
             }
          },
          child: Text("Pilih Waktu Pengingat")
         ),
         if (selectedTime != null)
          Text("Pengingat diatur pukul: ${selectedTime!.format(context)}")
      ],
    );
  }
}