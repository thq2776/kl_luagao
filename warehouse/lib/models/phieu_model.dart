// To parse this JSON data, do
//
//     final phieuModel = phieuModelFromJson(jsonString);

import 'dart:convert';

PhieuModel phieuModelFromJson(String str) =>
    PhieuModel.fromJson(json.decode(str));

String phieuModelToJson(PhieuModel data) => json.encode(data.toJson());

class PhieuModel {
  int phieudieuphuongtienId;
  int phuongtienId;
  int sanphamId;
  int masoloId;
  int customerId;
  DateTime ngayxuatben;
  String diachivung;
  String daidienphuongtien;
  String soluong;

  PhieuModel({
    required this.phieudieuphuongtienId,
    required this.phuongtienId,
    required this.sanphamId,
    required this.masoloId,
    required this.customerId,
    required this.ngayxuatben,
    required this.diachivung,
    required this.daidienphuongtien,
    required this.soluong,
  });

  factory PhieuModel.fromJson(Map<String, dynamic> json) => PhieuModel(
        phieudieuphuongtienId: json["phieudieuphuongtien_id"],
        phuongtienId: json["phuongtien_id"],
        sanphamId: json["sanpham_id"],
        masoloId: json["masolo_id"],
        customerId: json["customer_id"],
        ngayxuatben: DateTime.parse(json["ngayxuatben"]),
        diachivung: json["diachivung"],
        daidienphuongtien: json["daidienphuongtien"],
        soluong: json["soluong"],
      );

  Map<String, dynamic> toJson() => {
        "phieudieuphuongtien_id": phieudieuphuongtienId,
        "phuongtien_id": phuongtienId,
        "sanpham_id": sanphamId,
        "masolo_id": masoloId,
        "customer_id": customerId,
        "ngayxuatben":
            "${ngayxuatben.year.toString().padLeft(4, '0')}-${ngayxuatben.month.toString().padLeft(2, '0')}-${ngayxuatben.day.toString().padLeft(2, '0')}",
        "diachivung": diachivung,
        "daidienphuongtien": daidienphuongtien,
        "soluong": soluong,
      };
}
