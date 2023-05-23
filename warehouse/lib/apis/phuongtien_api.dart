import 'dart:convert';

import 'package:http/http.dart';
import '../models/phuongtien_modell.dart';
import 'config.dart';

class PhuongTienApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<PhuongTienModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/phuongtien"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => PhuongTienModel.fromJson(e),
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

  Future<PhuongTienModel> create({
    required String tenphuongtien,
    required String sophuongtien,
    required String tinhtrangvesinh,
    required String baoquansanpham,
    required String taitrong,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/phuongtien"),
        body: {
          "tenphuongtien": tenphuongtien,
          "sophuongtien": sophuongtien,
          "tinhtrangvesinh": tinhtrangvesinh,
          "baoquansanpham": baoquansanpham,
          "taitrong": taitrong,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return PhuongTienModel.fromJson(jsonData);
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
    required String tenphuongtien,
    required String sophuongtien,
    required String tinhtrangvesinh,
    required String baoquansanpham,
    required String taitrong,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/phuongtien/$id"),
        body: {
          "tenphuongtien": tenphuongtien,
          "sophuongtien": sophuongtien,
          "tinhtrangvesinh": tinhtrangvesinh,
          "baoquansanpham": baoquansanpham,
          "taitrong": taitrong,
        },
      );

     final jsonData = jsonDecode(response.body);


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
        Uri.parse("$host/api/phuongtien/$id"),
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
