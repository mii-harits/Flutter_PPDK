import 'dart:convert';
import 'dart:developer';
import 'package:flutter_ppkd/Tugas_14/models/got_models.dart';
import 'package:http/http.dart' as http;

Future<List<GameOfThrones>> getUser() async {
  final response = await http.get(
    Uri.parse("https://thronesapi.com/api/v2/Characters"),
  );

  log(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => GameOfThrones.fromJson(json)).toList();
  } else {
    throw Exception("Gagal Memuat Data");
  }
}
