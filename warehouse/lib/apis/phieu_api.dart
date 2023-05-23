import 'dart:convert';

import 'package:http/http.dart';
import 'package:warehouse/models/masolo_model.dart';
import 'package:warehouse/models/phieu_model.dart';
import 'package:warehouse/models/tokhai_model.dart';

import 'config.dart';

class PhieuApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<PhieuModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/phieudieuphuongtien"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData).map(
            (e) => MaSoLoModel.fromJson(e),
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

  Future<ToKhaiModel?> create({
    required int tokhaixuatxucamket_id,
    required int phuongtien_id,
    required int loaisanpham_id,
    required int customer_id,
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
          "tokhaixuatxucamket_id": tokhaixuatxucamket_id,
          "phuongtien_id": phuongtien_id,
          "loaisanpham_id": loaisanpham_id,
          "customer_id": customer_id,
          "soluong": soluong,
          "vungnguyenlieu": vungnguyenlieu,
          "chatluongnguyenlieu": chatluongnguyenlieu,
          "ngay": ngay,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ToKhaiModel.fromJson(jsonData);
      } else {
        return Future.error("Lỗi ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    } finally {
      client.close();
    }
  }

  Future<bool> update({
    required int id,
    required int loaisanpham,
    required String trangthai,
    required String ten,
    required String masolo,
    required String mota,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/masolo/$id"),
        body: {
          "loaisanpham_id": "$loaisanpham",
          "trangthai": trangthai,
          "ten": ten,
          "masolo": masolo,
          "mota": mota,
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
        Uri.parse("$host/api/masolo/$id"),
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
