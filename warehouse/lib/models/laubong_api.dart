// To parse this JSON data, do
//
//     final lauBongModel = lauBongModelFromJson(jsonString);

import 'dart:convert';

LauBongModel lauBongModelFromJson(String str) => LauBongModel.fromJson(json.decode(str));

String lauBongModelToJson(LauBongModel data) => json.encode(data.toJson());

class LauBongModel {
    int baocaogiamsatlaubongId;
    int masoloId;
    String masolotam;
    String masologaotrang;
    String masolootammai;
    String nbq5;
    String kl5;
    String nbq1;
    String kl1;
    String nbq2;
    String kl2;
    String nbq3;
    String kl3;
    String nbq4;
    String kl4;
    String cam;
    String tgkiemtra;
    int doam;
    int tam;
    int hatphan;
    int hathu;
    int hatvang;
    int hatxanhnon;
    int hatdo;
    int tapchat;
    int hatnep;
    int thoc;
    int hatlanloai;
    String nguoivanhanh;
    String mucxattrang;
    String mucdanhbong;
    int dothuan;

    LauBongModel({
        required this.baocaogiamsatlaubongId,
        required this.masoloId,
        required this.masolotam,
        required this.masologaotrang,
        required this.masolootammai,
        required this.nbq5,
        required this.kl5,
        required this.nbq1,
        required this.kl1,
        required this.nbq2,
        required this.kl2,
        required this.nbq3,
        required this.kl3,
        required this.nbq4,
        required this.kl4,
        required this.cam,
        required this.tgkiemtra,
        required this.doam,
        required this.tam,
        required this.hatphan,
        required this.hathu,
        required this.hatvang,
        required this.hatxanhnon,
        required this.hatdo,
        required this.tapchat,
        required this.hatnep,
        required this.thoc,
        required this.hatlanloai,
        required this.nguoivanhanh,
        required this.mucxattrang,
        required this.mucdanhbong,
        required this.dothuan,
    });

    factory LauBongModel.fromJson(Map<String, dynamic> json) => LauBongModel(
        baocaogiamsatlaubongId: json["baocaogiamsatlaubong_id"],
        masoloId: json["masolo_id"],
        masolotam: json["masolotam"],
        masologaotrang: json["masologaotrang"],
        masolootammai: json["masolootammai"],
        nbq5: json["nbq5"],
        kl5: json["kl5"],
        nbq1: json["nbq1"],
        kl1: json["kl1"],
        nbq2: json["nbq2"],
        kl2: json["kl2"],
        nbq3: json["nbq3"],
        kl3: json["kl3"],
        nbq4: json["nbq4"],
        kl4: json["kl4"],
        cam: json["cam"],
        tgkiemtra: json["tgkiemtra"],
        doam: json["doam"],
        tam: json["tam"],
        hatphan: json["hatphan"],
        hathu: json["hathu"],
        hatvang: json["hatvang"],
        hatxanhnon: json["hatxanhnon"],
        hatdo: json["hatdo"],
        tapchat: json["tapchat"],
        hatnep: json["hatnep"],
        thoc: json["thoc"],
        hatlanloai: json["hatlanloai"],
        nguoivanhanh: json["nguoivanhanh"],
        mucxattrang: json["mucxattrang"],
        mucdanhbong: json["mucdanhbong"],
        dothuan: json["dothuan"],
    );

    Map<String, dynamic> toJson() => {
        "baocaogiamsatlaubong_id": baocaogiamsatlaubongId,
        "masolo_id": masoloId,
        "masolotam": masolotam,
        "masologaotrang": masologaotrang,
        "masolootammai": masolootammai,
        "nbq5": nbq5,
        "kl5": kl5,
        "nbq1": nbq1,
        "kl1": kl1,
        "nbq2": nbq2,
        "kl2": kl2,
        "nbq3": nbq3,
        "kl3": kl3,
        "nbq4": nbq4,
        "kl4": kl4,
        "cam": cam,
        "tgkiemtra": tgkiemtra,
        "doam": doam,
        "tam": tam,
        "hatphan": hatphan,
        "hathu": hathu,
        "hatvang": hatvang,
        "hatxanhnon": hatxanhnon,
        "hatdo": hatdo,
        "tapchat": tapchat,
        "hatnep": hatnep,
        "thoc": thoc,
        "hatlanloai": hatlanloai,
        "nguoivanhanh": nguoivanhanh,
        "mucxattrang": mucxattrang,
        "mucdanhbong": mucdanhbong,
        "dothuan": dothuan,
    };
}
