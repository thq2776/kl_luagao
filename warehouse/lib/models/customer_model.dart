// To parse this JSON data, do
//
//     final khachHangModel = khachHangModelFromJson(jsonString);

import 'dart:convert';

KhachHangModel khachHangModelFromJson(String str) => KhachHangModel.fromJson(json.decode(str));

String khachHangModelToJson(KhachHangModel data) => json.encode(data.toJson());

class KhachHangModel {
    int khachhangId;
    String ten;
    String diachi;
    int sdt;
    String ghichu;

    KhachHangModel({
        required this.khachhangId,
        required this.ten,
        required this.diachi,
        required this.sdt,
        required this.ghichu,
    });

    factory KhachHangModel.fromJson(Map<String, dynamic> json) => KhachHangModel(
        khachhangId: json["khachhang_id"],
        ten: json["ten"],
        diachi: json["diachi"],
        sdt: json["sdt"],
        ghichu: json["ghichu"],
    );

    Map<String, dynamic> toJson() => {
        "khachhang_id": khachhangId,
        "ten": ten,
        "diachi": diachi,
        "sdt": sdt,
        "ghichu": ghichu,
    };
}
