import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:warehouse/models/bcgiamsatsaylua_model.dart';
import 'package:warehouse/models/nhaplo_model.dart';

import '../models/bcgiamsatsaylua_model.dart';
import 'config.dart';

class NhapLoApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<NhapLoModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/bcgsnhaplo"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => NhapLoModel.fromJson(e),
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
    required String thoidiemkiemtra,
    required String phantramtamnl,
    required int khoiluongnl,
    required String noibaoquannl,
    required String masolotp,
    required String phantramtamtp,
    required int khoiluongtp,
    required String noibaoquantp,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/bcgsnhaplo"),
        body: {
          "masolo_id": "$masoloId",
          "ngay": ngay.toIso8601String(),
          "thoidiemkiemtra": thoidiemkiemtra,
          "phantramtamnl": phantramtamnl,
          "khoiluongnl": "$khoiluongnl",
          "noibaoquannl": noibaoquannl,
          "masolotp": masolotp,
          "phantramtamtp": phantramtamtp,
          "khoiluongtp": "$khoiluongtp",
          "noibaoquantp": noibaoquantp,
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
    required String thoidiemkiemtra,
    required String phantramtamnl,
    required int khoiluongnl,
    required String noibaoquannl,
    required String masolotp,
    required String phantramtamtp,
    required int khoiluongtp,
    required String noibaoquantp,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/bcgsnhaplo/$id"),
        body: {
          "masolo_id": "$masoloId",
          "ngay": ngay.toIso8601String(),
          "thoidiemkiemtra": thoidiemkiemtra,
          "phantramtamnl": phantramtamnl,
          "khoiluongnl": "$khoiluongnl",
          "noibaoquannl": noibaoquannl,
          "masolotp": masolotp,
          "phantramtamtp": phantramtamtp,
          "khoiluongtp": "$khoiluongtp",
          "noibaoquantp": noibaoquantp,
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
        Uri.parse("$host/api/bcgsnhaplo/$id"),
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
