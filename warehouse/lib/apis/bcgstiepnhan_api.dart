import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../models/bcgstiepnhan_model.dart';
import 'config.dart';

class BcGsTiepNhanApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<BcGsTiepNhanModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/bcgiamsattiepnhannguyenlieu"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => BcGsTiepNhanModel.fromJson(e),
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

  Future<bool> create(
      {required int khachhang,
      required int loaisanpham,
      required int masolo,
      required DateTime ngay,
      required String diachi,
      required int khoiluong,
      required String kiemtraphuongtien,
      required String hosotrongtrot,
      required String hosocamket,
      required String chungnhan,
      required int doam,
      required int tam,
      required int tapchat,
      required int hatnguyen,
      required int hathu,
      required int hatvang,
      required int hatbacphan,
      required String ketluan,
      required String thoigiantiepnhan}) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/bcgiamsattiepnhannguyenlieu"),
        body: {
          "khachhang_id": "$khachhang",
          "loaisanpham_id": "$loaisanpham",
          "masolo_id": "$masolo",
          "ngay": ngay.toIso8601String(),
          "diachi": diachi,
          "khoiluong": "$khoiluong",
          "kiemtraphuongtien": kiemtraphuongtien,
          "hosotrongtrot": hosotrongtrot,
          "hosocamket": hosocamket,
          "chungnhan": chungnhan,
          "doam": "$doam",
          "tam": "$tam",
          "tapchat": "$tapchat",
          "hatnguyen": "$hatnguyen",
          "hathu": "$hathu",
          "hatvang": "$hatvang",
          "hatbacphan": "$hatbacphan",
          "ketluan": ketluan,
          "thoigiantiepnhan": thoigiantiepnhan
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
    required int khachhang,
    required int loaisanpham,
    required int masolo,
    required DateTime ngay,
    required String diachi,
    required int khoiluong,
    required String kiemtraphuongtien,
    required String hosotrongtrot,
    required String hosocamket,
    required String chungnhan,
    required int doam,
    required int tam,
    required int tapchat,
    required int hatnguyen,
    required int hathu,
    required int hatvang,
    required int hatbacphan,
    required String ketluan,
    required String thoigiantiepnhan,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/bcgiamsattiepnhannguyenlieu/$id"),
        body: {
          "khachhang_id": "$khachhang",
          "loaisanpham_id": "$loaisanpham",
          "masolo_id": "$masolo",
          "ngay": ngay.toIso8601String(),
          "diachi": diachi,
          "khoiluong": "$khoiluong",
          "kiemtraphuongtien": kiemtraphuongtien,
          "hosotrongtrot": hosotrongtrot,
          "hosocamket": hosocamket,
          "chungnhan": chungnhan,
          "doam": "$doam",
          "tam": "$tam",
          "tapchat": "$tapchat",
          "hatnguyen": "$hatnguyen",
          "hathu": "$hathu",
          "hatvang": "$hatvang",
          "hatbacphan": "$hatbacphan",
          "ketluan": ketluan,
          "thoigiantiepnhan": thoigiantiepnhan
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
        Uri.parse("$host/api/bcgiamsattiepnhannguyenlieu/$id"),
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

  Future<bool> checkMSLIDname(int masolo_id) async {
    var client = Client();

    try {
      var response = await client
          .get(Uri.parse("$host/api/bcgiamsattiepnhannguyenlieu/$masolo_id"));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = jsonDecode(response.body);
        return jsonData['exists'] ?? true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception occurred: $e");
      }
      rethrow;
    } finally {
      client.close();
    }
  }
}
