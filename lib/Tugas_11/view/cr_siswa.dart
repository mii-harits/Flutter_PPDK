import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_11/database/pasien_controller.dart';
import 'package:flutter_ppkd/Tugas_11/database/siswa_controller.dart';
import 'package:flutter_ppkd/Tugas_11/models/pasien_model.dart';
import 'package:flutter_ppkd/Tugas_11/models/siswa_model.dart';
import 'package:flutter_ppkd/Tugas_11/utils/decoration_form.dart';

class CrSiswaScreen extends StatefulWidget {
  const CrSiswaScreen({super.key});

  @override
  State<CrSiswaScreen> createState() => _CrSiswaScreenState();
}

class _CrSiswaScreenState extends State<CrSiswaScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: decorationConstant(
                hintText: "Masukkan Nama Siswa",
                labelText: "Nama",
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: kelasController,
              decoration: decorationConstant(
                hintText: "Masukkan Kelas Siswa",
                labelText: "Kelas",
              ),
            ),

            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (namaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nama belum di isi")),
                    );
                    return;
                  }
                  if (kelasController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("kelas belum di isi")),
                    );
                    return;
                  }
                  SiswaController.registerSiswa(
                    SiswaModel(
                      nama: namaController.text,
                      kelas: kelasController.text,
                    ),
                  );
                  namaController.clear();
                  kelasController.clear();
                  setState(() {});
                },
                child: Text("Tambah Siswa"),
              ),
            ),

            FutureBuilder(
              future: SiswaController.getAllSiswa(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final dataSiswa = snapshot.data as List<SiswaModel>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataSiswa.length,
                  itemBuilder: (BuildContext context, int index) {
                    final items = dataSiswa[index];
                    return ListTile(
                      title: Text(items.nama),
                      subtitle: Text(items.kelas),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// FutureBuilder<List<PasienModel>> PasienWidget() {
//   return FutureBuilder<List<PasienModel>>(
//     future: PasienController.getAllPasien(),
//     builder: (BuildContext context, AsyncSnapshot snapshot) {

//     },
//   );
// }
