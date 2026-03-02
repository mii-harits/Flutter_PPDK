import 'package:flutter/material.dart';

InputDecoration decorationConstant({
  required String hintText,
  required String labelText,
}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    hintStyle: TextStyle(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
  );
}
