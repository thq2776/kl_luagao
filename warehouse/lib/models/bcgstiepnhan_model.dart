// To parse this JSON data, do
//
//     final bcGsTiepNhanModel = bcGsTiepNhanModelFromJson(jsonString);

import 'dart:convert';

BcGsTiepNhanModel bcGsTiepNhanModelFromJson(String str) => BcGsTiepNhanModel.fromJson(json.decode(str));

String bcGsTiepNhanModelToJson(BcGsTiepNhanModel data) => json.encode(data.toJson());

class BcGsTiepNhanModel {
    int bcgiamsattiepnhannguyenlieuId;
    int khachhangId;
    int loaisanphamId;
    int masoloId;
    DateTime ngay;
    String diachi;
    int khoiluong;
    String kiemtraphuongtien;
    String hosotrongtrot;
    String hosocamket;
    String chungnhan;
    int doam;
    int tam;
    int tapchat;
    int hatnguyen;
    int hathu;
    int hatvang;
    int hatbacphan;
    String ketluan;
    String thoigiantiepnhan;

    BcGsTiepNhanModel({
        required this.bcgiamsattiepnhannguyenlieuId,
        required this.khachhangId,
        required this.loaisanphamId,
        required this.masoloId,
        required this.ngay,
        required this.diachi,
        required this.khoiluong,
        required this.kiemtraphuongtien,
        required this.hosotrongtrot,
        required this.hosocamket,
        required this.chungnhan,
        required this.doam,
        required this.tam,
        required this.tapchat,
        required this.hatnguyen,
        required this.hathu,
        required this.hatvang,
        required this.hatbacphan,
        required this.ketluan,
        required this.thoigiantiepnhan,
    });

    factory BcGsTiepNhanModel.fromJson(Map<String, dynamic> json) => BcGsTiepNhanModel(
        bcgiamsattiepnhannguyenlieuId: json["bcgiamsattiepnhannguyenlieu_id"],
        khachhangId: json["khachhang_id"],
        loaisanphamId: json["loaisanpham_id"],
        masoloId: json["masolo_id"],
        ngay: DateTime.parse(json["ngay"]),
        diachi: json["diachi"],
        khoiluong: json["khoiluong"],
        kiemtraphuongtien: json["kiemtraphuongtien"],
        hosotrongtrot: json["hosotrongtrot"],
        hosocamket: json["hosocamket"],
        chungnhan: json["chungnhan"],
        doam: json["doam"],
        tam: json["tam"],
        tapchat: json["tapchat"],
        hatnguyen: json["hatnguyen"],
        hathu: json["hathu"],
        hatvang: json["hatvang"],
        hatbacphan: json["hatbacphan"],
        ketluan: json["ketluan"],
        thoigiantiepnhan: json["thoigiantiepnhan"],
    );

    Map<String, dynamic> toJson() => {
        "bcgiamsattiepnhannguyenlieu_id": bcgiamsattiepnhannguyenlieuId,
        "khachhang_id": khachhangId,
        "loaisanpham_id": loaisanphamId,
        "masolo_id": masoloId,
        "ngay": ngay.toIso8601String(),
        "diachi": diachi,
        "khoiluong": khoiluong,
        "kiemtraphuongtien": kiemtraphuongtien,
        "hosotrongtrot": hosotrongtrot,
        "hosocamket": hosocamket,
        "chungnhan": chungnhan,
        "doam": doam,
        "tam": tam,
        "tapchat": tapchat,
        "hatnguyen": hatnguyen,
        "hathu": hathu,
        "hatvang": hatvang,
        "hatbacphan": hatbacphan,
        "ketluan": ketluan,
        "thoigiantiepnhan": thoigiantiepnhan,
    };
}
