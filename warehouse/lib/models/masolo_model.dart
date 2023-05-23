// To parse this JSON data, do
//
//     final maSoLoModel = maSoLoModelFromJson(jsonString);

import 'dart:convert';

MaSoLoModel maSoLoModelFromJson(String str) => MaSoLoModel.fromJson(json.decode(str));

String maSoLoModelToJson(MaSoLoModel data) => json.encode(data.toJson());

class MaSoLoModel {
    int masoloId;
    int loaisanphamId;
    String trangthai;
    String ten;
    String masolo;
    int khoiluong;
    int khoiluongdadung;
    String mota;

    MaSoLoModel({
        required this.masoloId,
        required this.loaisanphamId,
        required this.trangthai,
        required this.ten,
        required this.masolo,
        required this.khoiluong,
        required this.khoiluongdadung,
        required this.mota,
    });

    factory MaSoLoModel.fromJson(Map<String, dynamic> json) => MaSoLoModel(
        masoloId: json["masolo_id"],
        loaisanphamId: json["loaisanpham_id"],
        trangthai: json["trangthai"],
        ten: json["ten"],
        masolo: json["masolo"],
        khoiluong: json["khoiluong"],
        khoiluongdadung: json["khoiluongdadung"],
        mota: json["mota"],
    );

    Map<String, dynamic> toJson() => {
        "masolo_id": masoloId,
        "loaisanpham_id": loaisanphamId,
        "trangthai": trangthai,
        "ten": ten,
        "masolo": masolo,
        "khoiluong": khoiluong,
        "khoiluongdadung": khoiluongdadung,
        "mota": mota,
    };
}
