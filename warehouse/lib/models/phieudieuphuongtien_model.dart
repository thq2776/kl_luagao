// To parse this JSON data, do
//
//     final phieuDieuPhuongTienModel = phieuDieuPhuongTienModelFromJson(jsonString);

import 'dart:convert';

PhieuDieuPhuongTienModel phieuDieuPhuongTienModelFromJson(String str) =>
    PhieuDieuPhuongTienModel.fromJson(json.decode(str));

String phieuDieuPhuongTienModelToJson(PhieuDieuPhuongTienModel data) =>
    json.encode(data.toJson());

class PhieuDieuPhuongTienModel {
  int phieudieuphuongtienId;
  int phuongtienId;
  int sanphamId;
  int masoloId;
  int khachhangId;
  DateTime ngayxuatben;
  String diachivung;
  String daidienphuongtien;
  String soluong;
  String tinhtrang;
  String baoquan;

  PhieuDieuPhuongTienModel({
    required this.phieudieuphuongtienId,
    required this.phuongtienId,
    required this.sanphamId,
    required this.masoloId,
    required this.khachhangId,
    required this.ngayxuatben,
    required this.diachivung,
    required this.daidienphuongtien,
    required this.soluong,
    required this.tinhtrang,
    required this.baoquan,
  });

  factory PhieuDieuPhuongTienModel.fromJson(Map<String, dynamic> json) =>
      PhieuDieuPhuongTienModel(
        phieudieuphuongtienId: json["phieudieuphuongtien_id"],
        phuongtienId: json["phuongtien_id"],
        sanphamId: json["sanpham_id"],
        masoloId: json["masolo_id"],
        khachhangId: json["khachhang_id"],
        ngayxuatben: DateTime.parse(json["ngayxuatben"]),
        diachivung: json["diachivung"],
        daidienphuongtien: json["daidienphuongtien"],
        soluong: json["soluong"],
        tinhtrang: json["tinhtrang"],
        baoquan: json["baoquan"],
      );

  Map<String, dynamic> toJson() => {
        "phieudieuphuongtien_id": phieudieuphuongtienId,
        "phuongtien_id": phuongtienId,
        "sanpham_id": sanphamId,
        "masolo_id": masoloId,
        "khachhang_id": khachhangId,
        "ngayxuatben":
            "${ngayxuatben.year.toString().padLeft(4, '0')}-${ngayxuatben.month.toString().padLeft(2, '0')}-${ngayxuatben.day.toString().padLeft(2, '0')}",
        "diachivung": diachivung,
        "daidienphuongtien": daidienphuongtien,
        "soluong": soluong,
        "tinhtrang": tinhtrang,
        "baoquan": baoquan,
      };
}
