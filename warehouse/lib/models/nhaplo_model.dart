// To parse this JSON data, do
//
//     final nhapLoModel = nhapLoModelFromJson(jsonString);

import 'dart:convert';

NhapLoModel nhapLoModelFromJson(String str) => NhapLoModel.fromJson(json.decode(str));

String nhapLoModelToJson(NhapLoModel data) => json.encode(data.toJson());

class NhapLoModel {
    int baocaogiamsatnhaploId;
    int masoloId;
    DateTime ngay;
    String thoidiemkiemtra;
    String phantramtamnl;
    int khoiluongnl;
    String noibaoquannl;
    String masolotp;
    String phantramtamtp;
    int khoiluongtp;
    String noibaoquantp;

    NhapLoModel({
        required this.baocaogiamsatnhaploId,
        required this.masoloId,
        required this.ngay,
        required this.thoidiemkiemtra,
        required this.phantramtamnl,
        required this.khoiluongnl,
        required this.noibaoquannl,
        required this.masolotp,
        required this.phantramtamtp,
        required this.khoiluongtp,
        required this.noibaoquantp,
    });

    factory NhapLoModel.fromJson(Map<String, dynamic> json) => NhapLoModel(
        baocaogiamsatnhaploId: json["baocaogiamsatnhaplo_id"],
        masoloId: json["masolo_id"],
        ngay: DateTime.parse(json["ngay"]),
        thoidiemkiemtra: json["thoidiemkiemtra"],
        phantramtamnl: json["phantramtamnl"],
        khoiluongnl: json["khoiluongnl"],
        noibaoquannl: json["noibaoquannl"],
        masolotp: json["masolotp"],
        phantramtamtp: json["phantramtamtp"],
        khoiluongtp: json["khoiluongtp"],
        noibaoquantp: json["noibaoquantp"],
    );

    Map<String, dynamic> toJson() => {
        "baocaogiamsatnhaplo_id": baocaogiamsatnhaploId,
        "masolo_id": masoloId,
        "ngay": ngay.toIso8601String(),
        "thoidiemkiemtra": thoidiemkiemtra,
        "phantramtamnl": phantramtamnl,
        "khoiluongnl": khoiluongnl,
        "noibaoquannl": noibaoquannl,
        "masolotp": masolotp,
        "phantramtamtp": phantramtamtp,
        "khoiluongtp": khoiluongtp,
        "noibaoquantp": noibaoquantp,
    };
}

