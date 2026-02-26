import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas%2010/home_page_10.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordSatuController = TextEditingController();
  final TextEditingController passwordDuaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = true;
  bool _isVisibility = true;

  void visibilityOnOff() {
    isVisibility = !isVisibility;
    // _isVisibility = !_isVisibility;
    setState(() {});
  }

  void _visibilityOnOff() {
    // isVisibility = !isVisibility;
    _isVisibility = !_isVisibility;
    setState(() {});
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
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Nama Lengkap Anda',
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person_outline)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Lengkap Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                controller: kotaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Kota Asal Anda',
                  labelText: 'Kota Asal',
                  prefixIcon: Icon(Icons.location_on)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota Asal Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),
          
              SizedBox(height: 20,),
          
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: teleponController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Nomor Telepon Anda',
                  labelText: 'Nomor Telepon',
                  prefixIcon: Icon(Icons.phone_android_outlined)
                ),
                // validator: (value) {
                //   final phone = (value ?? '').trim();
                //   if (!RegExp(r'^\d+$').hasMatch(phone)) {
                //     return 'Nomor telefon hanya dapat diisi angka';
                //   }
                //   if (phone.length < 9) {
                //     return 'Nomor telepon minimal 9 digit';
                //   }
                //   if (phone.length > 15) {
                //     return 'Nomor telepon maksimal 15 digit';
                //   }
                //   return null;
                // },
              ),
          
              SizedBox(height: 20,),
          
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Email Anda',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib diisi';
                  } else if (!value.contains("@")) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
          
              SizedBox(height: 20,),
          
              TextFormField(
                obscureText: isVisibility,
                controller: passwordSatuController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Password Anda',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: InkWell(
                    onTap: visibilityOnOff,
                    child: Icon(
                      !isVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined
                    )
                  )
                ),
                validator: (value) {
                  final password = value ?? "";
                  final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
                  final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
                  final hasNumber = RegExp(r'\d').hasMatch(password);
                  if (password.isEmpty) {
                    return 'Password wajib diisi';
                  }
                  if (password.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  if (!hasUppercase) {
                    return "Password harus mengandung minimal 1 huruf besar";
                  }
                  if (!hasLowercase) {
                    return "Password harus mengandung minimal 1 huruf kecil";
                  }
                  if (!hasNumber) {
                    return "Password harus mengandung minimal 1 angka";
                  }
                  return null;
                },
              ),
          
              SizedBox(height: 20,),
          
              TextFormField(
                obscureText: _isVisibility,
                controller: passwordDuaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Masukkan Password Kembali',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: InkWell(
                    onTap: () {
                      _visibilityOnOff();
                    },
                    child: Icon(
                      !_isVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined
                    )
                  )
                ),
                validator: (value) {
                  final password = value ?? "";
                  if (password.isEmpty) {
                    return 'Password wajib diisi';
                  }
                  if (value != passwordSatuController.text) {
                    return 'Password harus sama';
                  }
                  return null;
                },
              ),
          
              SizedBox(height: 24,),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      dialogError(context);
                    } else {
                      print("Tidak Berhasil Tervalidasi");
                    }
                    print(emailController.text);
                    print(passwordSatuController.text);
                    print(passwordDuaController.text);
                  },
                  child: Text("Masuk")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "Verifikasi Data",
            style: TextStyle(fontSize: 24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama : ${namaController.text}"),
              SizedBox(height: 8,),

              Text("Kota : ${kotaController.text}"),
              SizedBox(height: 8,),

              if (teleponController.text.trim().isNotEmpty) ...[
              Text("Telepon : ${teleponController.text}"),
              SizedBox(height: 8,),
              ],

              Text("Email : ${emailController.text}"),
              SizedBox(height: 8,),

              Text("Password : ${passwordSatuController.text}"),
              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        context.push(HomePage10(
                          nama: namaController.text,
                          kota: kotaController.text
                        ));
                      },
                      child: Text("Lanjutkan")
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Batal",
                        style: TextStyle(color: Colors.red),
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
} 