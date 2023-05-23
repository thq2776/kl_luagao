// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/models/product_category_model.dart';

import '../../apis/phuongtien_api.dart';
import '../../apis/product_category_api.dart';
import '../../models/phuongtien_modell.dart';

class PhuongTienCreatePage extends StatefulWidget {
  const PhuongTienCreatePage({super.key});

  @override
  State<PhuongTienCreatePage> createState() => _PhuongTienCreatePageState();
}

class _PhuongTienCreatePageState extends State<PhuongTienCreatePage> {
  final PhuongTienApi _api = PhuongTienApi();

  Future<PhuongTienModel?>? _createPhuongTienFuture;

  TextEditingController tenInputController = TextEditingController();
  TextEditingController sophuongtienInputController = TextEditingController();
  TextEditingController tinhtrangvesinhInputController =
      TextEditingController();
  TextEditingController baoquanInputController = TextEditingController();
  TextEditingController taitrongInputController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm phương tiện vận chuyển"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tenInputController,
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // create rounded corners
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Tên phương tiện",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: sophuongtienInputController,
              decoration: InputDecoration(
                labelText: "Mô tả",
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 146, 213, 98),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 129, 204, 75),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: tinhtrangvesinhInputController,
              decoration: InputDecoration(
                labelText: "Tình trạng vệ sinh",
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 146, 213, 98),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 129, 204, 75),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: baoquanInputController,
              decoration: InputDecoration(
                labelText: "Bảo quản sản phẩm",
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 146, 213, 98),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 129, 204, 75),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: taitrongInputController,
              decoration: InputDecoration(
                labelText: "Tải trọng",
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 146, 213, 98),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 129, 204, 75),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: create,
                    child: const Text("Tạo"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void create() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (tenInputController.text.isEmpty) {
        nameInputError = "Vui lòng nhập dữ liệu";
      } else {
        nameInputError = null;
      }

      if (sophuongtienInputController.text.isEmpty) {
        descriptionInputError = "Vui lòng nhập dữ liệu";
      } else {
        descriptionInputError = null;
      }
    });
    if (nameInputError == null && descriptionInputError == null) {
      _createPhuongTienFuture = _api.create(
          tenphuongtien: tenInputController.text,
          sophuongtien: sophuongtienInputController.text,
          tinhtrangvesinh: tinhtrangvesinhInputController.text,
          baoquansanpham: baoquanInputController.text,
          taitrong: taitrongInputController.text);

      _createPhuongTienFuture?.then((value) {
        if (value != null) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tạo phương tiện mới thành công'),
            ),
          );
        }
      });
    }
  }
}
