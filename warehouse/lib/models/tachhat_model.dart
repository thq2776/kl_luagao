// // To parse this JSON data, do
// //
// //     final rakimloaiModel = rakimloaiModelFromJson(jsonString);

// import 'dart:convert';

// RakimloaiModel rakimloaiModelFromJson(String str) =>
//     RakimloaiModel.fromJson(json.decode(str));

// String rakimloaiModelToJson(RakimloaiModel data) => json.encode(data.toJson());

// class RakimloaiModel {
//   int chitietgiamsatbocvotachhatId;
//   int masoloId;
//   DateTime ngay;
//   String thoidiemkiemtra;
//   String apsuat;
//   String masologaoxo;
//   String khoiluonggaoxo;
//   String phantramhatbocvo;
//   String phantramgao;
//   String phantramtam;
//   String sangtapchat;
//   String gangbatthocphanly;
//   String khoiluongtrau;
//   String nguoivanhanh;
//   String noibaoquan;

//   RakimloaiModel({
//     required this.chitietgiamsatbocvotachhatId,
//     required this.masoloId,
//     required this.ngay,
//     required this.thoidiemkiemtra,
//     required this.apsuat,
//     required this.masologaoxo,
//     required this.khoiluonggaoxo,
//     required this.phantramhatbocvo,
//     required this.phantramgao,
//     required this.phantramtam,
//     required this.sangtapchat,
//     required this.gangbatthocphanly,
//     required this.khoiluongtrau,
//     required this.nguoivanhanh,
//     required this.noibaoquan,
//   });

//   factory RakimloaiModel.fromJson(Map<String, dynamic> json) => RakimloaiModel(
//         chitietgiamsatbocvotachhatId: json["chitietgiamsatbocvotachhat_id"],
//         masoloId: json["masolo_id"],
//         ngay: DateTime.parse(json["ngay"]),
//         thoidiemkiemtra: json["thoidiemkiemtra"],
//         apsuat: json["apsuat"],
//         masologaoxo: json["masologaoxo"],
//         khoiluonggaoxo: json["khoiluonggaoxo"],
//         phantramhatbocvo: json["phantramhatbocvo"],
//         phantramgao: json["phantramgao"],
//         phantramtam: json["phantramtam"],
//         sangtapchat: json["sangtapchat"],
//         gangbatthocphanly: json["gangbatthocphanly"],
//         khoiluongtrau: json["khoiluongtrau"],
//         nguoivanhanh: json["nguoivanhanh"],
//         noibaoquan: json["noibaoquan"],
//       );

//   Map<String, dynamic> toJson() => {
//         "chitietgiamsatbocvotachhat_id": chitietgiamsatbocvotachhatId,
//         "masolo_id": masoloId,
//         "ngay": ngay.toIso8601String(),
//         "thoidiemkiemtra": thoidiemkiemtra,
//         "apsuat": apsuat,
//         "masologaoxo": masologaoxo,
//         "khoiluonggaoxo": khoiluonggaoxo,
//         "phantramhatbocvo": phantramhatbocvo,
//         "phantramgao": phantramgao,
//         "phantramtam": phantramtam,
//         "sangtapchat": sangtapchat,
//         "gangbatthocphanly": gangbatthocphanly,
//         "khoiluongtrau": khoiluongtrau,
//         "nguoivanhanh": nguoivanhanh,
//         "noibaoquan": noibaoquan,
//       };
// }
