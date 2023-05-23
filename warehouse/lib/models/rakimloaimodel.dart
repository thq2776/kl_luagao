// To parse this JSON data, do
//
//     final rakimloaiModel = rakimloaiModelFromJson(jsonString);

import 'dart:convert';

RakimloaiModel rakimloaiModelFromJson(String str) => RakimloaiModel.fromJson(json.decode(str));

String rakimloaiModelToJson(RakimloaiModel data) => json.encode(data.toJson());

class RakimloaiModel {
    int rakimloaiId;
    int masoloId;
    int sanphamId;
    String noibaoquan;
    String hopdong;
    DateTime tgkiemtra;
    String khoiluong;
    String khoiluongcokimloai;
    String mauthufe;
    String mauthunfe;
    String mauthuS316;
    String nhanxet;

    RakimloaiModel({
        required this.rakimloaiId,
        required this.masoloId,
        required this.sanphamId,
        required this.noibaoquan,
        required this.hopdong,
        required this.tgkiemtra,
        required this.khoiluong,
        required this.khoiluongcokimloai,
        required this.mauthufe,
        required this.mauthunfe,
        required this.mauthuS316,
        required this.nhanxet,
    });

    factory RakimloaiModel.fromJson(Map<String, dynamic> json) => RakimloaiModel(
        rakimloaiId: json["rakimloai_id"],
        masoloId: json["masolo_id"],
        sanphamId: json["sanpham_id"],
        noibaoquan: json["noibaoquan"],
        hopdong: json["hopdong"],
        tgkiemtra: DateTime.parse(json["tgkiemtra"]),
        khoiluong: json["khoiluong"],
        khoiluongcokimloai: json["khoiluongcokimloai"],
        mauthufe: json["mauthufe"],
        mauthunfe: json["mauthunfe"],
        mauthuS316: json["mauthuS316"],
        nhanxet: json["nhanxet"],
    );

    Map<String, dynamic> toJson() => {
        "rakimloai_id": rakimloaiId,
        "masolo_id": masoloId,
        "sanpham_id": sanphamId,
        "noibaoquan": noibaoquan,
        "hopdong": hopdong,
        "tgkiemtra": tgkiemtra.toIso8601String(),
        "khoiluong": khoiluong,
        "khoiluongcokimloai": khoiluongcokimloai,
        "mauthufe": mauthufe,
        "mauthunfe": mauthunfe,
        "mauthuS316": mauthuS316,
        "nhanxet": nhanxet,
    };
}
