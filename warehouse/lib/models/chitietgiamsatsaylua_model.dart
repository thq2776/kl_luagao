// To parse this JSON data, do
//
//     final chiTietSayLuaModel = chiTietSayLuaModelFromJson(jsonString);

// import 'dart:convert';

// ChiTietSayLuaModel chiTietSayLuaModelFromJson(String str) => ChiTietSayLuaModel.fromJson(json.decode(str));

// String chiTietSayLuaModelToJson(ChiTietSayLuaModel data) => json.encode(data.toJson());

class ChiTietSayLuaModel {
  ChiTietSayLuaModel({
    required this.chitietgiamsatsayluaId,
    required this.thoidiemkiemtra,
    required this.nhietdo,
    required this.doammau1,
    required this.doammau2,
    required this.doammau3,
    required this.doammau4,
    required this.doammau5,
    required this.doammau6,
    required this.doammau7,
    required this.doammau8,
    required this.thongsovanhanh,
    required this.tinhtranglosay,
    required this.nguoivanhanh,
  });

  int chitietgiamsatsayluaId;
  String thoidiemkiemtra;
  String nhietdo;
  String doammau1;
  String doammau2;
  String doammau3;
  String doammau4;
  String doammau5;
  String doammau6;
  String doammau7;
  String doammau8;
  String thongsovanhanh;
  String tinhtranglosay;
  String nguoivanhanh;

  factory ChiTietSayLuaModel.fromJson(Map<String, dynamic> json) =>
      ChiTietSayLuaModel(
        chitietgiamsatsayluaId: json["chitietgiamsatsaylua_id"],
        thoidiemkiemtra: json["thoidiemkiemtra"],
        nhietdo: json["nhietdo"],
        doammau1: json["doammau1"],
        doammau2: json["doammau2"],
        doammau3: json["doammau3"],
        doammau4: json["doammau4"],
        doammau5: json["doammau5"],
        doammau6: json["doammau6"],
        doammau7: json["doammau7"],
        doammau8: json["doammau8"],
        thongsovanhanh: json["thongsovanhanh"],
        tinhtranglosay: json["tinhtranglosay"],
        nguoivanhanh: json["nguoivanhanh"],
      );

  Map<String, dynamic> toJson() => {
        "chitietgiamsatsaylua_id": chitietgiamsatsayluaId,
        "thoidiemkiemtra": thoidiemkiemtra,
        "nhietdo": nhietdo,
        "doammau1": doammau1,
        "doammau2": doammau2,
        "doammau3": doammau3,
        "doammau4": doammau4,
        "doammau5": doammau5,
        "doammau6": doammau6,
        "doammau7": doammau7,
        "doammau8": doammau8,
        "thongsovanhanh": thongsovanhanh,
        "tinhtranglosay": tinhtranglosay,
        "nguoivanhanh": nguoivanhanh,
      };
}
