import 'dart:convert';

import 'package:http/http.dart';
import '../models/phieudieuphuongtien_model.dart';
import 'config.dart';

class PhieuDieuPhuongTienApi {
  String host = ApiConfig.host;

  /// Lấy danh sách danh mục sản phẩm
  Future<List<PhieuDieuPhuongTienModel>> list() async {
    var client = Client();

    try {
      var response =
          await client.get(Uri.parse("$host/api/phieudieuphuongtien"));
      final jsonData = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return List.from(
          (jsonData as List).map(
            (e) => PhieuDieuPhuongTienModel.fromJson(e),
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
      {required int phuongtienId,
      required int sanphamId,
      required int masoloId,
      required int khachhangId,
      required DateTime ngayxuatben,
      required String diachivung,
      required String daidienphuongtien,
      required String soluong,
      required String tinhtrang,
      required String baoquan}) async {
    var client = Client();

    try {
      var response = await client.post(
        Uri.parse("$host/api/phieudieuphuongtien"),
        body: {
          "phuongtien_id": "$phuongtienId",
          "sanpham_id": "$sanphamId",
          "ngayxuatben": ngayxuatben.toIso8601String(),
          "masolo_id": "$masoloId",
          "khachhang_id": "$khachhangId",
          "diachivung": diachivung,
          "daidienphuongtien": daidienphuongtien,
          "soluong": soluong,
          "tinhtrang": tinhtrang,
          "baoquan": baoquan,
          //    'phieudieuphuongtien_id',
          // 'phuongtien_id',
          // 'sanpham_id',
          // 'masolo_id',
          // 'khachhang_id',
          // 'ngayxuatben',
          // 'diachivung',
          // 'daidienphuongtien',
          // 'soluong',
          // 'tinhtrang',
          // 'baoquan'
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

  Future<bool> update(
      {required int id,
      required int phuongtienId,
      required int sanphamId,
      required int masoloId,
      required int khachhangId,
      required DateTime ngayxuatben,
      required String diachivung,
      required String daidienphuongtien,
      required String soluong,
      required String tinhtrang,
      required String baoquan}) async {
    var client = Client();

    try {
      var response = await client.put(
        Uri.parse("$host/api/phieudieuphuongtien/$id"),
        body: {//phai dung
          "phuongtien_id": "$phuongtienId",
          "sanpham_id": "$sanphamId",
          "ngayxuatben": ngayxuatben.toIso8601String(),
          "masolo_id": "$masoloId",
          "khachhang_id": "$khachhangId",
          "diachivung": diachivung,
          "daidienphuongtien": daidienphuongtien,
          "soluong": soluong,
          "tinhtrang": tinhtrang,
          "baoquan": baoquan,
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
        Uri.parse("$host/api/phieudieuphuongtien/$id"),
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
