// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  HistoryModel({
    required this.id,
    required this.waktu,
    required this.nama,
    required this.tipe,
  });

  final String id;
  final String waktu;
  final String nama;
  final String tipe;

  factory HistoryModel.fromJson(dynamic json) => HistoryModel(
        id: json["id"],
        waktu: json["waktu"],
        nama: json["nama"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waktu": waktu,
        "nama": nama,
        "tipe": tipe,
      };
}
