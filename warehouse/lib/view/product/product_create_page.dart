// Tạo danh mục sản phẩm

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:warehouse/models/product_model.dart';

import '../../apis/product_api.dart';
import '../../apis/product_category_api.dart';
import '../../models/product_category_model.dart';
import '../product_category/product_category_create_page.dart';

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final ProductApi _productApi = ProductApi();
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();

  Future<ProductModel?>? _createProductFuture;
  Future<List<ProductCategoryModel>>? _getProductCategoryListFuture;

  TextEditingController nameInputController = TextEditingController();
  int? selectedCategoryId;

  String? nameInputError;
  String? categoryIdInputError;

  @override
  void initState() {
    super.initState();

    // Lấy danh sách danh mục sản phẩm
    getProductCategoryList();
  }

  getProductCategoryList() {
    setState(() {
      _getProductCategoryListFuture = _productCategoryApi.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo sản phẩm"),
      ),
      body: FutureBuilder<List<ProductCategoryModel>>(
        future: _getProductCategoryListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
            );
          }

          if (snapshot.requireData.isEmpty) {
            return const Center(
              child: Text("Không có dữ liệu hiển thị"),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameInputController,
                  decoration: InputDecoration(
                    labelText: "Tên sản phẩm",
                    errorText: nameInputError,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        items: List.generate(
                          snapshot.requireData.length,
                          (index) => DropdownMenuItem(
                            value: snapshot.requireData
                                .elementAt(index)
                                .loaisanphamId,
                            child: Text(
                                snapshot.requireData.elementAt(index).tenloai),
                          ),
                        ),
                        decoration: InputDecoration(
                          labelText: "Danh mục sản phẩm",
                          errorText: categoryIdInputError,
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCategoryId = value;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton.icon(
                      onPressed: () async {
                        bool? update = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProductCategoryCreatePage(),
                          ),
                        );

                        if (update == true) {
                          getProductCategoryList();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Thêm"),
                    ),
                  ],
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
          );
        },
      ),
    );
  }

  void create() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (nameInputController.text.isEmpty) {
        nameInputError = "Vui lòng nhập tên sản phẩm";
      } else {
        nameInputError = null;
      }

      if (selectedCategoryId == null) {
        categoryIdInputError = "Vui lòng nhập loại sản phẩm";
      } else {
        categoryIdInputError = null;
      }
    });

    if (nameInputError == null && categoryIdInputError == null) {
      _createProductFuture = _productApi.create(
        tensanpham: nameInputController.text,
        loaisanpham: selectedCategoryId!,
      );

      _createProductFuture?.then((value) {
        if (value != null) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tạo sản phẩm "${value.tensanpham}" thành công'),
            ),
          );
        }
      });
    }
  }
}
