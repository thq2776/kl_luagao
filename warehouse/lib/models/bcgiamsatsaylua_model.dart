// To parse this JSON data, do
//
//     final bcGiamSatSayLuaModel = bcGiamSatSayLuaModelFromJson(jsonString);

import 'dart:convert';

BcGiamSatSayLuaModel bcGiamSatSayLuaModelFromJson(String str) => BcGiamSatSayLuaModel.fromJson(json.decode(str));

String bcGiamSatSayLuaModelToJson(BcGiamSatSayLuaModel data) => json.encode(data.toJson());

class BcGiamSatSayLuaModel {
    int baocaogiamsatsayluaId;
    int masoloId;
    DateTime ngay;
    int khoiluong;
    String losaylua;
    String doambandau;
    String dodaymelua;
    String noibaoquansaukhisay;
    DateTime thoigianbatdau;
    DateTime thoigianketthuc;
    String khoiluongluakho;
    String masolosaukhisay;

    BcGiamSatSayLuaModel({
        required this.baocaogiamsatsayluaId,
        required this.masoloId,
        required this.ngay,
        required this.khoiluong,
        required this.losaylua,
        required this.doambandau,
        required this.dodaymelua,
        required this.noibaoquansaukhisay,
        required this.thoigianbatdau,
        required this.thoigianketthuc,
        required this.khoiluongluakho,
        required this.masolosaukhisay,
    });

    factory BcGiamSatSayLuaModel.fromJson(Map<String, dynamic> json) => BcGiamSatSayLuaModel(
        baocaogiamsatsayluaId: json["baocaogiamsatsaylua_id"],
        masoloId: json["masolo_id"],
        ngay: DateTime.parse(json["ngay"]),
        khoiluong: json["khoiluong"],
        losaylua: json["losaylua"],
        doambandau: json["doambandau"],
        dodaymelua: json["dodaymelua"],
        noibaoquansaukhisay: json["noibaoquansaukhisay"],
        thoigianbatdau: DateTime.parse(json["thoigianbatdau"]),
        thoigianketthuc: DateTime.parse(json["thoigianketthuc"]),
        khoiluongluakho: json["khoiluongluakho"],
        masolosaukhisay: json["masolosaukhisay"],
    );

    Map<String, dynamic> toJson() => {
        "baocaogiamsatsaylua_id": baocaogiamsatsayluaId,
        "masolo_id": masoloId,
        "ngay": ngay.toIso8601String(),
        "khoiluong": khoiluong,
        "losaylua": losaylua,
        "doambandau": doambandau,
        "dodaymelua": dodaymelua,
        "noibaoquansaukhisay": noibaoquansaukhisay,
        "thoigianbatdau": thoigianbatdau.toIso8601String(),
        "thoigianketthuc": thoigianketthuc.toIso8601String(),
        "khoiluongluakho": khoiluongluakho,
        "masolosaukhisay": masolosaukhisay,
    };
}
