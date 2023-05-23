// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import '../../apis/phuongtien_api.dart';
import '../../models/phuongtien_modell.dart';

class PhuongTienUpdatePage extends StatefulWidget {
  const PhuongTienUpdatePage({super.key, required this.phuongtien});

  final PhuongTienModel phuongtien;

  @override
  State<PhuongTienUpdatePage> createState() => _PhuongTienUpdatePageState();
}

class _PhuongTienUpdatePageState extends State<PhuongTienUpdatePage> {
  final PhuongTienApi _api = PhuongTienApi();

  Future<bool>? _updatePhuongTienFuture;
  Future<bool?>? _deletePhuongTienFuture;

  TextEditingController tenInputController = TextEditingController();
  TextEditingController sophuongtienInputController = TextEditingController();
  TextEditingController tinhtrangvesinhtienInputController =
      TextEditingController();
  TextEditingController baoquanInputController = TextEditingController();
  TextEditingController taitrongInputController = TextEditingController();
  String? nameInputError;
  String? descriptionInputError;

  @override
  void initState() {
    super.initState();
    tinhtrangvesinhtienInputController.text = widget.phuongtien.tinhtrangvesinh;
    taitrongInputController.text = widget.phuongtien.taitrong;
    tinhtrangvesinhtienInputController.text = widget.phuongtien.baoquansanpham;
    tenInputController.text = widget.phuongtien.tenphuongtien;
    sophuongtienInputController.text = widget.phuongtien.sophuongtien;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.phuongtien.sophuongtien),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tenInputController,
              decoration: InputDecoration(
                labelText: "Tên phương tiện",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: sophuongtienInputController,
              decoration: InputDecoration(
                labelText: "Số phương tiện",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: tinhtrangvesinhtienInputController,
              decoration: InputDecoration(
                labelText: "Tình trạng vệ sinh",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: baoquanInputController,
              decoration: InputDecoration(
                labelText: "Bảo quản",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: taitrongInputController,
              decoration: InputDecoration(
                labelText: "Tải trọng(kg)",
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
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (tenInputController.text.isEmpty) {
        nameInputError = "Vui lòng nhập tên danh mục";
      } else {
        nameInputError = null;
      }

      if (sophuongtienInputController.text.isEmpty) {
        descriptionInputError = "Vui lòng nhập mô tả";
      } else {
        descriptionInputError = null;
      }
    });
    if (nameInputError == null && descriptionInputError == null) {
      _updatePhuongTienFuture = _api.update(
        id: widget.phuongtien.phuongtienId,
        tenphuongtien: tenInputController.text,
        sophuongtien: sophuongtienInputController.text,
        tinhtrangvesinh: tinhtrangvesinhtienInputController.text,
        baoquansanpham: baoquanInputController.text,
        taitrong: taitrongInputController.text,
      );

      _updatePhuongTienFuture?.then((value) {
        if (value != null) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cập nhật phương tiện  thành công'),
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
        _deletePhuongTienFuture = _api.delete(
          id: widget.phuongtien.phuongtienId,
        );

        _deletePhuongTienFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa phương tiện ${widget.phuongtien.sophuongtien} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
