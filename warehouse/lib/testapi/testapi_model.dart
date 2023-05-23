// To parse this JSON data, do
//
//     final testApiModel = testApiModelFromJson(jsonString);

import 'dart:convert';

TestApiModel testApiModelFromJson(String str) => TestApiModel.fromJson(json.decode(str));

String testApiModelToJson(TestApiModel data) => json.encode(data.toJson());

class TestApiModel {
    int id;
    int kieuInt;

    TestApiModel({
        required this.id,
        required this.kieuInt,
    });

    factory TestApiModel.fromJson(Map<String, dynamic> json) => TestApiModel(
        id: json["id"],
        kieuInt: json["kieuInt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kieuInt": kieuInt,
    };
}
