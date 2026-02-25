// To parse this JSON data, do
//
//     final dataKesehatan = dataKesehatanFromJson(jsonString);

import 'dart:convert';

List<DataKesehatan> dataKesehatanFromJson(String str) => List<DataKesehatan>.from(json.decode(str).map((x) => DataKesehatan.fromJson(x)));

String dataKesehatanToJson(List<DataKesehatan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataKesehatan {
    int? id;
    String? title;
    String? description;
    String? image;
    List<Medication>? medications;

    DataKesehatan({
        this.id,
        this.title,
        this.description,
        this.image,
        this.medications,
    });

    factory DataKesehatan.fromJson(Map<String, dynamic> json) => DataKesehatan(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        medications: json["medications"] == null ? [] : List<Medication>.from(json["medications"]!.map((x) => Medication.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "medications": medications == null ? [] : List<dynamic>.from(medications!.map((x) => x.toJson())),
    };
}

class Medication {
    String? name;
    String? type;
    String? description;
    String? dosage;
    bool? isPrescription;

    Medication({
        this.name,
        this.type,
        this.description,
        this.dosage,
        this.isPrescription,
    });

    factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        dosage: json["dosage"],
        isPrescription: json["isPrescription"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "dosage": dosage,
        "isPrescription": isPrescription,
    };
}
