// To parse this JSON data, do
//
//     final toKhaiModel = toKhaiModelFromJson(jsonString);

import 'dart:convert';

ToKhaiModel toKhaiModelFromJson(String str) => ToKhaiModel.fromJson(json.decode(str));

String toKhaiModelToJson(ToKhaiModel data) => json.encode(data.toJson());

class ToKhaiModel {
    int tokhaixuatxucamketId;
    int phuongtienId;
    int loaisanphamId;
    int khachhangId;
    String soluong;
    String vungnguyenlieu;
    String chatluongnguyenlieu;
    DateTime ngay;

    ToKhaiModel({
        required this.tokhaixuatxucamketId,
        required this.phuongtienId,
        required this.loaisanphamId,
        required this.khachhangId,
        required this.soluong,
        required this.vungnguyenlieu,
        required this.chatluongnguyenlieu,
        required this.ngay,
    });

    factory ToKhaiModel.fromJson(Map<String, dynamic> json) => ToKhaiModel(
        tokhaixuatxucamketId: json["tokhaixuatxucamket_id"],
        phuongtienId: json["phuongtien_id"],
        loaisanphamId: json["loaisanpham_id"],
        khachhangId: json["khachhang_id"],
        soluong: json["soluong"],
        vungnguyenlieu: json["vungnguyenlieu"],
        chatluongnguyenlieu: json["chatluongnguyenlieu"],
        ngay: DateTime.parse(json["ngay"]),
    );

    Map<String, dynamic> toJson() => {
        "tokhaixuatxucamket_id": tokhaixuatxucamketId,
        "phuongtien_id": phuongtienId,
        "loaisanpham_id": loaisanphamId,
        "khachhang_id": khachhangId,
        "soluong": soluong,
        "vungnguyenlieu": vungnguyenlieu,
        "chatluongnguyenlieu": chatluongnguyenlieu,
        "ngay": ngay.toIso8601String(),
    };
}
