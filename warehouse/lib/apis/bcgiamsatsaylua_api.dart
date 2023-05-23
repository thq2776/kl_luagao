import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:warehouse/models/bcgiamsatsaylua_model.dart';

import '../models/bcgiamsatsaylua_model.dart';
import 'config.dart';

class BcGiamSatSayLuaApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<BcGiamSatSayLuaModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/baocaogiamsatsaylua"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => BcGiamSatSayLuaModel.fromJson(e),
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
    required DateTime ngay,
    required int khoiluong,
    required String losaylua,
    required String doambandau,
    required String dodaymelua,
    required String noibaoquansaukhisay,
    //  required DateTime thoigianbatdau,
    //  required DateTime thoigianketthuc,
    required String khoiluongluakho,
    required String masolosaukhisay,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/baocaogiamsatsaylua"),
        body: {
         "masolo_id": "$masoloId",
          "ngay": ngay.toIso8601String(),
          "khoiluong": "$khoiluong",
          "losaylua": losaylua,
          "doambandau": doambandau,
          "dodaymelua": dodaymelua,
          "noibaoquansaukhisay": noibaoquansaukhisay,
          // // "thoigianbatdau": thoigianbatdau.toIso8601String(),
          // // "thoigianketthuc": thoigianketthuc.toIso8601String(),
          "khoiluongluakho": khoiluongluakho,
          "masolosaukhisay": masolosaukhisay,
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

  Future<bool> update({
    required int id,
    required int masoloId,
    required DateTime ngay,
    required int khoiluong,
    required String losaylua,
    required String doambandau,
    required String dodaymelua,
    required String noibaoquansaukhisay,
    //  required DateTime thoigianbatdau,
    //  required DateTime thoigianketthuc,
    required String khoiluongluakho,
    required String masolosaukhisay,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/baocaogiamsatsaylua/$id"),
        body: {
          "masolo_id": "$masoloId",
          "ngay": ngay.toIso8601String(),
          "khoiluong": "$khoiluong",
          "losaylua": losaylua,
          "doambandau": doambandau,
          "dodaymelua": dodaymelua,
          "noibaoquansaukhisay": noibaoquansaukhisay,
          // // "thoigianbatdau": thoigianbatdau.toIso8601String(),
          // // "thoigianketthuc": thoigianketthuc.toIso8601String(),
          "khoiluongluakho": khoiluongluakho,
          "masolosaukhisay": masolosaukhisay,
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

  Future<bool> delete({required int id}) async {
    var client = Client();

    try {
      var response = await client.delete(
        Uri.parse("$host/api/baocaogiamsatsaylua/$id"),
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
