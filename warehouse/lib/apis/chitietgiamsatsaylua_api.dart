import 'dart:convert';
import 'package:http/http.dart';
import '../models/chitietgiamsatsaylua_model.dart';
import 'config.dart';

class ChiTietSayLuaApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<ChiTietSayLuaModel>>list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/chitietgiamsatsaylua"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => ChiTietSayLuaModel.fromJson(e),
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

  Future<ChiTietSayLuaModel?> create({
    required String thoidiemkiemtra,
    required String nhietdo,
    required String doammau1,
    required String doammau2,
    required String doammau3,
    required String doammau4,
    required String doammau5,
    required String doammau6,
    required String doammau7,
    required String doammau8,
    required String thongsovanhanh,
    required String tinhtranglosay,
    required String nguoivanhanh,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/chitietgiamsatsaylua"),
        body: {
          "thoidiemkiemtra": thoidiemkiemtra,
          "nhietdo": nhietdo,
          "doammau1": doammau1,
          "doammau2": doammau2,
          "doammau3": doammau3,
          "doammau4": doammau4,
          "doammau5": doammau5,
          "doammau6": doammau6,
          "doammau7": doammau7,
          "doammau8": doammau8,
          "thongsovanhanh": thongsovanhanh,
          "tinhtranglosay": tinhtranglosay,
          "nguoivanhanh": nguoivanhanh,
        },
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ChiTietSayLuaModel.fromJson(jsonData['data']);
      } else {
        return Future.error("Lỗi ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    } finally {
      client.close();
    }
  }

  Future<ChiTietSayLuaModel> update({
    required int id,
    required String thoidiemkiemtra,
    required String nhietdo,
    required String doammau1,
    required String doammau2,
    required String doammau3,
    required String doammau4,
    required String doammau5,
    required String doammau6,
    required String doammau7,
    required String doammau8,
    required String thongsovanhanh,
    required String tinhtranglosay,
    required String nguoivanhanh,
  }) async {
    print("call");
    var client = Client();

    // try {
    var response = await client.put(
      Uri.parse("$host/api/chitietgiamsatsaylua/$id"),
      body: {
        "chitietgiamsatsaylua_id": id,
        "thoidiemkiemtra": thoidiemkiemtra,
        "nhietdo": nhietdo,
        "doammau1": doammau1,
        "doammau2": doammau2,
        "doammau3": doammau3,
        "doammau4": doammau4,
        "doammau5": doammau5,
        "doammau6": doammau6,
        "doammau7": doammau7,
        "doammau8": doammau8,
        "thongsovanhanh": thongsovanhanh,
        "tinhtranglosay": tinhtranglosay,
        "nguoivanhanh": nguoivanhanh,
      },
    );

    final jsonData = jsonDecode(response.body);

    print(response.statusCode);
    print(jsonData);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return ChiTietSayLuaModel.fromJson(jsonData['data']);
    } else {
      return Future.error("Lỗi ${response.statusCode}");
    }
    // } catch (e) {
    //   return Future.error(e.toString());
    // } finally {
    //   client.close();
    // }
  }

  Future<bool> delete({required int id}) async {
    var client = Client();

    try {
      var response = await client.delete(
        Uri.parse("$host/api/chitietgiamsatsaylua/$id"),
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
