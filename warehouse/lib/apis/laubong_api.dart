import 'dart:convert';

import 'package:http/http.dart';
import 'package:warehouse/models/laubong_api.dart';

import 'config.dart';

class LauBongApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<LauBongModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/baocaogiamsatlaubong"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => LauBongModel.fromJson(e),
          ),
        );
      } else {
        return Future.error("Lỗi ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    } finally {
      client.close();
    }
  }

  Future<bool> create({
   required int masoloId,
   required String masolotam,
   required String masologaotrang,
   required String masolootammai,
   required String nbq5,
   required String kl5,
   required String nbq1,
   required String kl1,
   required String nbq2,
   required String kl2,
   required String nbq3,
   required String kl3,
   required String nbq4,
   required String kl4,
   required String cam,
   required String tgkiemtra,
   required int doam,
   required int tam,
  required  int hatphan,
   required int hathu,
  required  int hatvang,
  required  int hatxanhnon,
 required   int hatdo,
 
  required  int tapchat,
  required  int hatnep,
   required int thoc,
   required int hatlanloai,
   required String nguoivanhanh,
   required String mucxattrang,
   required String mucdanhbong,
   required int dothuan,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/baocaogiamsatlaubong"),
        body: {
        "masolo_id": "$masoloId",
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
        "doam": "$doam",
        "tam": "$tam",
        "hatphan": "$hatphan",
        "hathu": "$hathu",
        "hatvang": "$hatvang",
        "hatxanhnon": "$hatxanhnon",
        "hatdo": "$hatdo",
        "tapchat": "$tapchat",
        "hatnep": "$hatnep",
        "thoc": "$thoc",
        "hatlanloai": "$hatlanloai",
        "nguoivanhanh": nguoivanhanh,
        "mucxattrang": mucxattrang,
        "mucdanhbong": mucdanhbong,
        "dothuan": dothuan,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during update: $e');
      return false; // Trả về false nếu có lỗi xảy ra
    } finally {
      client.close();
    }
  }

  Future<bool> update(
      {required int id,
        required int masoloId,
   required String masolotam,
   required String masologaotrang,
   required String masolootammai,
   required String nbq5,
   required String kl5,
   required String nbq1,
   required String kl1,
   required String nbq2,
   required String kl2,
   required String nbq3,
   required String kl3,
   required String nbq4,
   required String kl4,
   required String cam,
   required String tgkiemtra,
   required int doam,
   required int tam,
  required  int hatphan,
   required int hathu,
  required  int hatvang,
  required  int hatxanhnon,
 required   int hatdo,
 
  required  int tapchat,
  required  int hatnep,
   required int thoc,
   required int hatlanloai,
   required String nguoivanhanh,
   required String mucxattrang,
   required String mucdanhbong,
   required int dothuan,}) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/baocaogiamsatlaubong/$id"),
        body: {
          //phai dung
 "masolo_id": "$masoloId",
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
        "doam": "$doam",
        "tam": "$tam",
        "hatphan": "$hatphan",
        "hathu": "$hathu",
        "hatvang": "$hatvang",
        "hatxanhnon": "$hatxanhnon",
        "hatdo": "$hatdo",
        "tapchat": "$tapchat",
        "hatnep": "$hatnep",
        "thoc": "$thoc",
        "hatlanloai": "$hatlanloai",
        "nguoivanhanh": nguoivanhanh,
        "mucxattrang": mucxattrang,
        "mucdanhbong": mucdanhbong,
        "dothuan": dothuan,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return Future.error(e.toString());
    } finally {
      client.close();
    }
  }

  Future<bool> delete({required int id}) async {
    var client = Client();

    try {
      var response = await client.delete(
        Uri.parse("$host/api/baocaogiamsatlaubong/$id"),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      client.close();
    }
  }
}
