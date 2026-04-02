import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_15/api/preference.dart';
import 'package:flutter_ppkd/Tugas_15/views/profile_screen.dart';
import 'package:flutter_ppkd/Tugas_15/views/register_screen.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';
import 'package:flutter_ppkd/Tugas_15/api/api_service.dart';

class LoginPage15 extends StatefulWidget {
  const LoginPage15({super.key});

  @override
  State<LoginPage15> createState() => _LoginPageState15();
}

class _LoginPageState15 extends State<LoginPage15> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordSatuController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isVisibility = true;
  bool isLoading = false;

  void visibilityOnOff() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordSatuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Masukkan Email Anda',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              TextFormField(
                obscureText: isVisibility,
                controller: passwordSatuController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Masukkan Password Anda',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: InkWell(
                    onTap: visibilityOnOff,
                    child: Icon(
                      !isVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            try {
                              final result = await ApiService.login(
                                emailController.text,
                                passwordSatuController.text,
                              );

                              print("LOGIN RESULT: $result");

                              final token =
                                  result['token'] ?? result['data']?['token'];

                              if (token != null) {
                                await PreferenceHandler1().storingToken(token);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login Berhasil"),
                                  ),
                                );

                                context.pushReplacement(const ProfilePage15());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      result['message'] ?? "Login gagal",
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error: $e")),
                              );
                            }

                            setState(() => isLoading = false);
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Masuk"),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RegistrasiPage15());
                    // DBHelper.registerUser(
                    //   UserModel(
                    //     email: emailController.text,
                    //     password: passwordSatuController.text,
                    //   ),
                    // );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("Pendaftaran Berhasil")),
                    // );
                  },
                  child: Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
