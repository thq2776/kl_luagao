import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:warehouse/models/product_category_model.dart';

import 'config.dart';

class ProductCategoryApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<ProductCategoryModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/loaisanpham"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => ProductCategoryModel.fromJson(e),
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

  Future<ProductCategoryModel?> create({
    required String tenloai,
    required String mota,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/loaisanpham"),
        body: {
          "tenloai": tenloai,
          "mota": mota,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ProductCategoryModel.fromJson(jsonData['data']);
      } else {
        return Future.error("Lỗi ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    } finally {
      client.close();
    }
  }

  Future<ProductCategoryModel> update({
    required int id,
    required String tenloai,
    required String mota,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/loaisanpham/$id"),
        body: {
          "tenloai": tenloai,
          "mota": mota,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ProductCategoryModel.fromJson(jsonData['data']);
      } else {
        return Future.error("Lỗi ${response.statusCode}");
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
        Uri.parse("$host/api/loaisanpham/$id"),
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
