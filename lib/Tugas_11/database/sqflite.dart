import 'package:flutter_ppkd/Tugas_11/models/user_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'salutis.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY , email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE siswa (id INTEGER PRIMARY KEY , nama TEXT, kelas TEXT)',
        );
        await db.execute(
          'CREATE TABLE pasien (id INTEGER PRIMARY KEY , nama_pasien TEXT, keluhan_penyakit TEXT, diagnosis_dokter TEXT)',
        );
      },
      version: 3,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE siswa (id INTEGER PRIMARY KEY , nama_pasien TEXT,  TEXT)',
          );
        }
        if (oldVersion < 3) {
          await db.execute(
            'CREATE TABLE pasien (id INTEGER PRIMARY KEY , nama_pasien TEXT, keluhan_penyakit TEXT, diagnosis_dokter TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
