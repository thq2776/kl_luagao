import 'dart:convert';

import 'package:http/http.dart';
import 'package:warehouse/models/masolo_model.dart';
import 'package:warehouse/models/tokhai_model.dart';

import 'config.dart';

class ToKhaiApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<ToKhaiModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/tokhaixuatxu_camket"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData).map(
            (e) => ToKhaiModel.fromJson(e),
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
    required int phuongtien,
    required int loaisanpham,
    required int customer,
    required String soluong,
    required String vungnguyenlieu,
    required String chatluongnguyenlieu,
    required DateTime ngay,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/tokhaixuatxu_camket"),
        body: {
          "phuongtien_id": "$phuongtien",
          "loaisanpham_id": "$loaisanpham",
          "khachhang_id": "$customer",
          "soluong": soluong,
          "vungnguyenlieu": vungnguyenlieu,
          "chatluongnguyenlieu": chatluongnguyenlieu,
          "ngay": ngay.toIso8601String(),
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
    required int phuongtien,
    required int loaisanpham,
    required int customer,
    required String soluong,
    required String vungnguyenlieu,
    required String chatluongnguyenlieu,
    required DateTime ngay,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/tokhaixuatxu_camket/$id"),
        body: {
          "phuongtien_id": "$phuongtien",
          "loaisanpham_id": "$loaisanpham",
          "khachhang_id": "$customer",
          "soluong": soluong,
          "vungnguyenlieu": vungnguyenlieu,
          "chatluongnguyenlieu": chatluongnguyenlieu,
          "ngay": ngay.toIso8601String(),
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
        Uri.parse("$host/api/tokhaixuatxu_camket/$id"),
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
