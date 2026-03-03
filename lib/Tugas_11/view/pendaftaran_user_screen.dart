import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_11/database/pasien_controller.dart';
import 'package:flutter_ppkd/Tugas_11/models/pasien_model.dart';
import 'package:flutter_ppkd/Tugas_11/utils/decoration_form.dart';
import 'package:flutter_ppkd/extentions/navigator.dart';

class PendaftaranUserScreen extends StatefulWidget {
  const PendaftaranUserScreen({super.key});

  @override
  State<PendaftaranUserScreen> createState() => _PendaftaranUserScreenState();
}

class _PendaftaranUserScreenState extends State<PendaftaranUserScreen> {
  final TextEditingController namaPasienController = TextEditingController();
  final TextEditingController keluhanPasienController = TextEditingController();
  final TextEditingController diagnosisDokterController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0F9D9D), Color(0xFF0AC5A8)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: namaPasienController,
                        style: TextStyle(color: Colors.white),
                        decoration: decorationConstant(
                          hintText: "Masukkkan Nama Pasien",
                          labelText: "Nama Pasien",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          borderSide: BorderSide(color: Colors.white),
                          borderSideFocused: BorderSide(color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: keluhanPasienController,
                        style: TextStyle(color: Colors.white),
                        maxLines: null,
                        decoration: decorationConstant(
                          hintText: "Masukkan Gejala Yang Pasien Rasakan...",
                          labelText: "Keluhan Penyakit",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          borderSide: BorderSide(color: Colors.white),
                          borderSideFocused: BorderSide(color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: diagnosisDokterController,
                        style: TextStyle(color: Colors.white),
                        maxLines: null,
                        decoration: decorationConstant(
                          hintText: "Masukkkan Diagnosismu Sebagai Dokter...",
                          labelText: "Diagnosis Dokter",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          borderSide: BorderSide(color: Colors.white),
                          borderSideFocused: BorderSide(color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed: () {
                            if (namaPasienController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Data nama pasien wajib diisi!",
                                  ),
                                ),
                              );
                              return;
                            }
                            if (keluhanPasienController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Data keluhan pasien wajib diisi!",
                                  ),
                                ),
                              );
                              return;
                            }
                            if (diagnosisDokterController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Data diagnosis dokter wajib diisi!",
                                  ),
                                ),
                              );
                              return;
                            }
                            PasienController.identifikasiPenyakit(
                              PasienModel(
                                namaPasien: namaPasienController.text,
                                keluhanPenyakit: keluhanPasienController.text,
                                diagnosisDokter: diagnosisDokterController.text,
                              ),
                            );
                            namaPasienController.clear();
                            keluhanPasienController.clear();
                            diagnosisDokterController.clear();
                            setState(() {});
                          },
                          child: Text(
                            "Daftar",
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.09),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: PasienWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<PasienModel>> PasienWidget() {
    return FutureBuilder<List<PasienModel>>(
      future: PasienController.getAllPasien(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final dataPasien = snapshot.data as List<PasienModel>;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dataPasien.length,
          itemBuilder: (BuildContext context, int index) {
            final items = dataPasien[index];
            return ListTile(
              title: Text(items.namaPasien),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items.keluhanPenyakit),
                  Text(items.diagnosisDokter),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      await showEditDialog(context, items);
                      // dataPasien = await PasienController.getAllPasien();
                      setState(() {});
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () async {
                      await showDeleteDialog(context, items.id!);
                      // dataPasien = await PasienController.getAllPasien();
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> showEditDialog(BuildContext context, PasienModel items) async {
    final namaPasienController = TextEditingController(text: items.namaPasien);
    final keluhanPasienController = TextEditingController(
      text: items.keluhanPenyakit,
    );
    final diagnosisDokterController = TextEditingController(
      text: items.diagnosisDokter,
    );

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Pasien"),
          content: Column(
            children: [
              TextFormField(
                controller: namaPasienController,
                decoration: decorationConstant(
                  hintText: "Nama Pasien",
                  labelText: "Nama Pasien",
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: keluhanPasienController,
                maxLines: null,
                decoration: decorationConstant(
                  hintText: "Masukkan Gejala Yang Pasien Rasakan...",
                  labelText: "Keluhan Pasien",
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: diagnosisDokterController,
                maxLines: null,
                decoration: decorationConstant(
                  hintText: "Masukkkan Diagnosismu Sebagai Dokter...",
                  labelText: "Diagnosis Dokter",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await PasienController.updatePasien(
                  PasienModel(
                    id: items.id,
                    namaPasien: namaPasienController.text,
                    keluhanPenyakit: keluhanPasienController.text,
                    diagnosisDokter: diagnosisDokterController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Data Telah Terupdate")));
              },
              child: Text("Simpan Perubahan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda Yakin Ingin Menghapus Data Ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await PasienController.deletePasien(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data Berhasil Dihapus")));
      setState(() {});
    }
  }
}
