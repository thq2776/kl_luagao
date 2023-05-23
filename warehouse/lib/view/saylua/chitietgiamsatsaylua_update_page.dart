// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import '../../apis/chitietgiamsatsaylua_api.dart';

import '../../models/chitietgiamsatsaylua_model.dart';

class ChiTietSayLuaUpDatePage extends StatefulWidget {
  const ChiTietSayLuaUpDatePage({super.key, required this.chitietsaylua});

  final ChiTietSayLuaModel chitietsaylua;

  @override
  State<ChiTietSayLuaUpDatePage> createState() =>
      _ChiTietSayLuaUpDatePageState();
}

class _ChiTietSayLuaUpDatePageState extends State<ChiTietSayLuaUpDatePage> {
  final ChiTietSayLuaApi _api = ChiTietSayLuaApi();

  Future<ChiTietSayLuaModel?>? _updateChiTietSayLuaFuture;
  Future<bool?>? _deleteChiTietSayLuaFuture;

  TextEditingController nhietdoInputCotroller = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();
  TextEditingController doam1InputController = TextEditingController();
  TextEditingController doam2InputController = TextEditingController();
  TextEditingController doam3InputController = TextEditingController();
  TextEditingController doam4InputController = TextEditingController();
  TextEditingController doam5InputController = TextEditingController();
  TextEditingController doam6InputController = TextEditingController();
  TextEditingController doam7InputController = TextEditingController();
  TextEditingController doam8InputController = TextEditingController();
  TextEditingController thongsovanhanhInputController = TextEditingController();
  TextEditingController tinhtranglosayInputController = TextEditingController();
  TextEditingController nguoivanhanhInputController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  @override
  void initState() {
    super.initState();

    nhietdoInputCotroller.text = widget.chitietsaylua.nhietdo;
    descriptionInputController.text = widget.chitietsaylua.thoidiemkiemtra;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Tờ chi tiết sấy lúa số: '),
            Text(widget.chitietsaylua.chitietgiamsatsayluaId.toString()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nhietdoInputCotroller,
              decoration: InputDecoration(
                labelText: "Nhiệt độ",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: doam1InputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Thời điểm kiểm tra",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: update,
                    child: const Text("Cập nhật"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: delete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Xoá"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void update() {
    print("?");
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (nhietdoInputCotroller.text.isEmpty) {
        nameInputError = "Vui lòng nhập tên danh mục";
      } else {
        nameInputError = null;
      }

      if (descriptionInputController.text.isEmpty) {
        descriptionInputError = "Vui lòng nhập mô tả";
      } else {
        descriptionInputError = null;
      }
    });
    if (nameInputError == null && descriptionInputError == null) {
      _updateChiTietSayLuaFuture = _api.update(
        id: widget.chitietsaylua.chitietgiamsatsayluaId,
        thoidiemkiemtra: widget.chitietsaylua.thoidiemkiemtra.toString(),
        doammau1: widget.chitietsaylua.doammau1.toString(),
        doammau2: widget.chitietsaylua.doammau2.toString(),
        doammau3: widget.chitietsaylua.doammau3.toString(),
        doammau4: widget.chitietsaylua.doammau4.toString(),
        doammau5: widget.chitietsaylua.doammau5.toString(),
        doammau6: widget.chitietsaylua.doammau6.toString(),
        doammau7: widget.chitietsaylua.doammau7.toString(),
        doammau8: widget.chitietsaylua.doammau8.toString(),
        thongsovanhanh: widget.chitietsaylua.thongsovanhanh.toString(),
        tinhtranglosay: widget.chitietsaylua.tinhtranglosay.toString(),
        nguoivanhanh: widget.chitietsaylua.nguoivanhanh.toString(),
        nhietdo: widget.chitietsaylua.nhietdo.toString(),
      );

      _updateChiTietSayLuaFuture?.then((value) {
        if (value != null) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Cập nhật danh mục sản phẩm "${value.chitietgiamsatsayluaId}" thành công'),
            ),
          );
        }
      });
    }
  }

  void delete() async {
    bool? isConfirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thông báo"),
        content: const Text("Bạn có có muốn xoá dữ liệu này không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Quay lại"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text("Xoá"),
          ),
        ],
      ),
    );

    if (isConfirm == true) {
      setState(() {
        _deleteChiTietSayLuaFuture = _api.delete(
          id: widget.chitietsaylua.chitietgiamsatsayluaId,
        );

        _deleteChiTietSayLuaFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa danh mục ${widget.chitietsaylua.chitietgiamsatsayluaId} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
