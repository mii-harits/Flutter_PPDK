import 'package:flutter/material.dart';

InputDecoration decorationConstant({
  required String hintText,
  required String labelText,
  TextStyle? hintStyle,
  TextStyle? labelStyle,
  BorderSide borderSide = const BorderSide(),
  BorderSide borderSideFocused = const BorderSide(),
}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    hintStyle: hintStyle,
    labelStyle: labelStyle,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: borderSide,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: borderSideFocused,
    ),
  );
}
