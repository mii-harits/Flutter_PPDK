import 'package:flutter/material.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';
import 'package:flutter_ppkd/Tugas_15/api/api_service.dart';

class RegistrasiPage15 extends StatefulWidget {
  const RegistrasiPage15({super.key});

  @override
  State<RegistrasiPage15> createState() => _RegistrasiPageState15();
}

class _RegistrasiPageState15 extends State<RegistrasiPage15> {
  final TextEditingController nameController = TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    passwordSatuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Masukkan Nama Lengkap Anda',
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Lengkap Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

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
                    return "Email Tidak Boleh Kosong";
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
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              final result = await ApiService.register(
                                nameController.text,
                                emailController.text,
                                passwordSatuController.text,
                              );

                              print("HASIL REGISTER: $result");

                              if (result['errors'] == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Register Berhasil")),
                                );

                                context.pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      result['message'] ?? "Register gagal",
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error: $e")),
                              );
                            }

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
