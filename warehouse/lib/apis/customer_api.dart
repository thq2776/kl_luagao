import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:warehouse/models/product_category_model.dart';

import '../models/customer_model.dart';
import 'config.dart';

class KhachHangApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<KhachHangModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/khachhang"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => KhachHangModel.fromJson(e),
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
    required String ten,
    required String diachi,
    required int sdt,
    required String ghichu,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/khachhang"),
        body: {
          "ten": ten,
          "diachi": diachi,
          "sdt": "$sdt",
          "ghichu": ghichu,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return true;
      } else {
        return Future.error("Lỗi ${response.statusCode}");
      }
    } catch (e) {
      return false;
    } finally {
      client.close();
    }
  }

  Future<bool> update({
    required int id,
    required String ten,
    required String diachi,
    required int sdt,
    required String ghichu,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/khachhang/$id"),
        body: {
          "ten": ten,
          "diachi": diachi,
          "sdt": "$sdt",
          "ghichu": ghichu,
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
        Uri.parse("$host/api/khachhang/$id"),
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

  Future<bool> checkKhachHangname(String ten) async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/khachhang/$ten"));

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
