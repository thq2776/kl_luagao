import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:warehouse/models/product_category_model.dart';
import 'package:warehouse/testapi/testapi_model.dart';

class TestApiApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<TestApiModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/testapi"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData).map(
            (e) => TestApiModel.fromJson(e),
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

  Future<TestApiModel?> create({
    required int kieuInt,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/testapi"),
        body: {
          "kieuInt": kieuInt,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return TestApiModel.fromJson(jsonData['data']);
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
    required int kieuInt,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/testapi/$id"),
        body: {
          "kieuInt": kieuInt,
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
        Uri.parse("$host/api/testapi/$id"),
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

  Future<bool> checkCategoryName(String categoryName) async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/loaisanpham/$categoryName"));

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

class ApiConfig {
  static String host = "http://10.0.3.2:8000";
}
