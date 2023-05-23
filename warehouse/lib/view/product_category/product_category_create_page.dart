// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/models/product_category_model.dart';

import '../../apis/product_category_api.dart';

class ProductCategoryCreatePage extends StatefulWidget {
  const ProductCategoryCreatePage({super.key});

  @override
  State<ProductCategoryCreatePage> createState() =>
      _ProductCategoryCreatePageState();
}

class _ProductCategoryCreatePageState extends State<ProductCategoryCreatePage> {
  final ProductCategoryApi _api = ProductCategoryApi();

  Future<ProductCategoryModel?>? _createProductCategoryFuture;

  TextEditingController nameInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tạo danh sách sản phẩm"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameInputController,
              decoration: InputDecoration(
                hintText: 'Nhập tên danh mục',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                labelText: "Tên danh mục",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                hintText: 'Nhập mô tả',
                fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Mô tả",
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
      if (nameInputController.text.isEmpty) {
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
      _createProductCategoryFuture = _api.create(
        tenloai: nameInputController.text,
        mota: descriptionInputController.text,
      );

      _createProductCategoryFuture?.then((value) {
        if (value != null) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Tạo danh mục sản phẩm "${value.tenloai}" thành công'),
            ),
          );
        }
      });
    }
  }
}
