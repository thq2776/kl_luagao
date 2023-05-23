import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:warehouse/models/masolo_model.dart';

import 'config.dart';

class RakimloaiApi {
  String host = ApiConfig.host;

  Future<List<MaSoLoModel>> list() async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/raikimloai"));
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

  Future<bool> create({
    required int loaisanpham,
    required String trangthai,
    required String ten,
    required String masolo,
    required int khoiluong,
    required int khoiluongdadung,
    required String mota,
  }) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/masolo"),
        body: {
          "loaisanpham_id": "$loaisanpham",
          "trangthai": trangthai,
          "ten": ten,
          "masolo": masolo,
          "khoiluong": "$khoiluong",
          "khoiluongdadung": "$khoiluongdadung",
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

  Future<bool> update({
    required int id,
    required int loaisanpham,
    required String trangthai,
    required String ten,
    required String masolo,
    required int khoiluong,
    required int khoiluongdadung,
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
          "khoiluong": "$khoiluong",
          "khoiluongdadung": "$khoiluongdadung",
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

  Future<bool> updateKL({
    required int id,
    required int khoiluong,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/masolo/$id"),
        body: {
          "khoiluong": "$khoiluong",
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

  Future<bool> updateKLSD({
    required int id,
    required int khoiluong,
  }) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/masolo/$id"),
        body: {
          "khoiluongdadung": "$khoiluong",
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

  Future<void> update_masolo_theokhoiluong(MaSoLoModel masolo) async {
    var client = Client();
    try {
      // Kiểm tra nếu khoiluong bằng khoiluongdadung
      if (masolo.khoiluong == masolo.khoiluongdadung) {
        // Cập nhật trạng thái thành 'Đã đóng'
        masolo.trangthai = 'Đã đóng';
      }

      // Gửi yêu cầu cập nhật thông tin đến API hoặc cơ sở dữ liệu
      // Ví dụ:
      var response = await client.put(
        Uri.parse('$host/api/masolo/${masolo.masoloId}'),
        body: {
          'loaisanpham_id': masolo.loaisanphamId,
          'trangthai': masolo.trangthai,
          'ten': masolo.ten,
          'masolo': masolo.masolo,
          'khoiluong': masolo.khoiluong,
          'khoiluongdadung': masolo.khoiluongdadung,
          'mota': masolo.mota,
        },
      );

      if (response.statusCode == 200) {
        // Cập nhật thành công
        print('Cập nhật thành công');
      } else {
        // Xử lý lỗi nếu có
        print('Lỗi khi cập nhật');
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      print('Lỗi khi gửi yêu cầu cập nhật');
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

  Future<bool> checkMaSoLo(String masolo) async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/masolo/$masolo"));

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

  Future<int?> checkMaSoLoDeLayMasoloid(String masolo) async {
    var client = Client();

    try {
      var response = await client.get(Uri.parse("$host/api/masolo/$masolo"));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = jsonDecode(response.body);
        return jsonData['masolo_id'];
      } else {
        return null;
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



Future<String?> checkMaSoLoDeLayMasolo(int masolo_id) async {
  var url = Uri.parse('$host/api/masolo/$masolo_id'); // Thay thế `host` bằng URL của máy chủ Laravel của bạn
  var client = Client();

  try {
    var response = await client.get(url);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final jsonData = jsonDecode(response.body);
      return jsonData['masolo'].toString();
    } else {
      return null;
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
