import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PasienModel {
  final int? id;
  final String namaPasien;
  final String keluhanPenyakit;
  final String diagnosisDokter;
  PasienModel({
    this.id,
    required this.namaPasien,
    required this.keluhanPenyakit,
    required this.diagnosisDokter,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_pasien': namaPasien,
      'keluhan_penyakit': keluhanPenyakit,
      'diagnosis_dokter': diagnosisDokter,
    };
  }

  factory PasienModel.fromMap(Map<String, dynamic> map) {
    return PasienModel(
      id: map['id'] != null ? map['id'] as int : null,
      namaPasien: map['nama_pasien'] as String,
      keluhanPenyakit: map['keluhan_penyakit'] as String,
      diagnosisDokter: map['diagnosis_dokter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PasienModel.fromJson(String source) =>
      PasienModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
