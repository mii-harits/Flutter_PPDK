// To parse this JSON data, do
//
//     final gameOfThrones = gameOfThronesFromJson(jsonString);

import 'dart:convert';

List<GameOfThrones> gameOfThronesFromJson(String str) =>
    List<GameOfThrones>.from(
      json.decode(str).map((x) => GameOfThrones.fromJson(x)),
    );

String gameOfThronesToJson(List<GameOfThrones> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameOfThrones {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  GameOfThrones({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
  });

  factory GameOfThrones.fromJson(Map<String, dynamic> json) => GameOfThrones(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    title: json["title"],
    family: json["family"],
    image: json["image"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "title": title,
    "family": family,
    "image": image,
    "imageUrl": imageUrl,
  };
}
