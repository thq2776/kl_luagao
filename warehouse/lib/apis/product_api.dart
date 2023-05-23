import 'dart:convert';

import 'package:http/http.dart';
import 'package:warehouse/models/product_model.dart';

import 'config.dart';

class ProductApi {
  String host = ApiConfig.host;

  /// Lấy danh sách sản phẩm
  Future<List<ProductModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/sanpham"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => ProductModel.fromJson(e),
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

  Future<ProductModel?> create({
    required String tensanpham,
    required int loaisanpham,
  }) async {
    var client = Client();

    // try {
    var response = await client.post(
      Uri.parse("$host/api/sanpham"),
      body: {
        "tensanpham": tensanpham,
        "loaisanpham_id": loaisanpham.toString(),
      },
    );
    print(response.statusCode);

    final jsonData = jsonDecode(response.body);

    print(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return ProductModel.fromJson(jsonData);
    } else {
      return Future.error("Lỗi ${response.statusCode}");
    }
    // } catch (e) {
    //   return Future.error(e.toString());
    // } finally {
    //   client.close();
    // }
  }

  Future<bool> update({
    required int id,
    required String tensanpham,
    required int loaisanpham,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/sanpham/$id"),
        body: {
          "tensanpham": tensanpham,
          "loaisanpham_id": "$loaisanpham",
        },
      );

      print(response.statusCode);

      final jsonData = jsonDecode(response.body);

      print(response.body);

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

  Future<bool> delete({required int id}) async {
    var client = Client();

    try {
      var response = await client.delete(
        Uri.parse("$host/api/sanpham/$id"),
      );

      print(response.statusCode);

      print(response.body);

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
