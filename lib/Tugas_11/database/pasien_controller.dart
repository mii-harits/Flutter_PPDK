import 'package:flutter_ppkd/Tugas_11/database/sqflite.dart';
import 'package:flutter_ppkd/Tugas_11/models/pasien_model.dart';

class PasienController {
  static Future<void> identifikasiPenyakit(PasienModel pasien) async {
    final dbs = await DBHelper.db();
    await dbs.insert('pasien', pasien.toMap());
    print(pasien.toMap);
  }

  static Future<List<PasienModel>> getAllPasien() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("pasien");
    print(results.map((e) => PasienModel.fromMap(e)).toList());
    return results.map((e) => PasienModel.fromMap(e)).toList();
  }
}
