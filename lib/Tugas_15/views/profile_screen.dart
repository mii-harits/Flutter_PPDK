import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_11/database/preference.dart';
import 'package:flutter_ppkd/Tugas_15/views/edit_profile_screen.dart';
import 'package:flutter_ppkd/Tugas_15/views/login_screen.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';
import 'package:flutter_ppkd/Tugas_15/api/api_service.dart';

class ProfilePage15 extends StatefulWidget {
  const ProfilePage15({super.key});

  @override
  State<ProfilePage15> createState() => _ProfilePage15State();
}

class _ProfilePage15State extends State<ProfilePage15> {
  late Future profileFuture;

  @override
  void initState() {
    super.initState();
    profileFuture = ApiService.getProfile();
  }

  void refreshProfile() {
    setState(() {
      profileFuture = ApiService.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: FutureBuilder(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Terjadi error"));
          }

          final data = snapshot.data;

          if (data['data'] == null) {
            return Center(child: Text(data['message'] ?? "Gagal ambil data"));
          }

          final user = data['data'];

          return Column(
            children: [
              const SizedBox(height: 30),

              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person, size: 50),
              ),

              const SizedBox(height: 16),

              Text(
                user['name'] ?? "-",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(user['email'] ?? "-"),

              const SizedBox(height: 30),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  final changed = await context.push(
                    EditProfilePage15(
                      name: user['name'] ?? "",
                      email: user['email'] ?? "",
                    ),
                  );

                  if (changed == true) {
                    refreshProfile(); // <-- reload data dari server
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  await PreferenceHandler().storingIsLogin(false);

                  context.pushReplacement(const LoginPage15());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
