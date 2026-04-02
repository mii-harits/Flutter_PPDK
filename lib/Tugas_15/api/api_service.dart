import 'dart:convert';
import 'package:flutter_ppkd/Tugas_15/api/preference.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://absensib1.mobileprojp.com/api";

  // REGISTER
  static Future register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );

    return jsonDecode(response.body);
  }

  // LOGIN
  static Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    return jsonDecode(response.body);
  }

  // PROFILE
  static Future getProfile() async {
    final token = await PreferenceHandler1().getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/profile"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    return jsonDecode(response.body);
  }

  // UPDATE PROFILE
  static Future updateProfile(String name, String email) async {
    final token = await PreferenceHandler1().getToken();

    final response = await http.put(
      Uri.parse("$baseUrl/profile"), // samakan dengan getProfile
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"name": name, "email": email},
    );

    return jsonDecode(response.body);
  }
}
