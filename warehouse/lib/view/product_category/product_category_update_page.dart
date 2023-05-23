// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import 'package:warehouse/models/product_category_model.dart';

import '../../apis/product_category_api.dart';

class ProductCategoryUpdatePage extends StatefulWidget {
  const ProductCategoryUpdatePage({super.key, required this.category});

  final ProductCategoryModel category;

  @override
  State<ProductCategoryUpdatePage> createState() =>
      _ProductCategoryUpdatePageState();
}

class _ProductCategoryUpdatePageState extends State<ProductCategoryUpdatePage> {
  final ProductCategoryApi _api = ProductCategoryApi();

  Future<ProductCategoryModel?>? _updateProductCategoryFuture;
  Future<bool?>? _deleteProductCategoryFuture;

  TextEditingController loaispInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  @override
  void initState() {
    super.initState();

    loaispInputController.text = widget.category.tenloai;
    descriptionInputController.text = widget.category.mota;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.tenloai),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: loaispInputController,
              decoration: InputDecoration(
                labelText: "Loại sản phẩm",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionInputController,
              decoration: InputDecoration(
                labelText: "Mô tả",
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
      if (descriptionInputController.text.isEmpty) {
        descriptionInputError = "Vui lòng nhập mô tả";
      } else {
        descriptionInputError = null;
      }
    });

    if (descriptionInputError == null) {
      // Kiểm tra xem tên loại đã thay đổi hay chưa
      if (loaispInputController.text != widget.category.tenloai) {
        // Kiểm tra trùng tên loại
        _api.checkCategoryName(loaispInputController.text).then((isExists) {
          if (isExists) {
            setState(() {
              nameInputError = "Tên danh mục đã tồn tại";
            });
          } else {
            _updateProductCategoryFuture = _api.update(
              id: widget.category.loaisanphamId,
              tenloai: loaispInputController.text,
              mota: descriptionInputController.text,
            );

            _updateProductCategoryFuture?.then((value) {
              if (value != null) {
                Navigator.of(context).pop(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Cập nhật danh mục sản phẩm "${value.tenloai}" thành công',
                    ),
                  ),
                );
              }
            });
          }
        });
      } else {
        // Không thay đổi tên loại, chỉ cập nhật mô tả
        _updateProductCategoryFuture = _api.update(
          id: widget.category.loaisanphamId,
          tenloai: loaispInputController.text,
          mota: descriptionInputController.text,
        );

        _updateProductCategoryFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Cập nhật danh mục sản phẩm "${value.tenloai}" thành công',
                ),
              ),
            );
          }
        });
      }
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
        _deleteProductCategoryFuture = _api.delete(
          id: widget.category.loaisanphamId,
        );

        _deleteProductCategoryFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa danh mục ${widget.category.tenloai} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
