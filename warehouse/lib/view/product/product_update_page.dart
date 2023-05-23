// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import 'package:warehouse/models/product_model.dart';

import '../../apis/product_api.dart';
import '../../apis/product_category_api.dart';
import '../../models/product_category_model.dart';
import '../product_category/product_category_create_page.dart';

class ProductUpdatePage extends StatefulWidget {
  const ProductUpdatePage({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductUpdatePage> createState() => _ProductUpdatePageState();
}

class _ProductUpdatePageState extends State<ProductUpdatePage> {
  final ProductApi _productApi = ProductApi();
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();

  Future<List<ProductCategoryModel>>? _getProductCategoryListFuture;
  Future<bool?>? _updateProductFuture;
  Future<bool?>? _deleteProductFuture;

  TextEditingController nameInputController = TextEditingController();
  int? selectedCategoryId;

  String? nameInputError;
  String? categoryIdInputError;

  @override
  void initState() {
    super.initState();

    nameInputController.text = widget.product.tensanpham;
    selectedCategoryId = widget.product.loaisanphamId;

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
        title: Text(widget.product.tensanpham),
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
                  // DropdownButtonFormField<int>(
                  //   value: selectedCategoryId,
                  //   items: List.generate(
                  //     snapshot.requireData.length,
                  //     (index) => DropdownMenuItem(
                  //       value:
                  //           snapshot.requireData.elementAt(index).loaisanphamId,
                  //       child:
                  //           Text(snapshot.requireData.elementAt(index).tenloai),
                  //     ),
                  //   ),
                  //   decoration: InputDecoration(
                  //     labelText: "Danh mục sản phẩm",
                  //     errorText: categoryIdInputError,
                  //   ),
                  //   onChanged: (value) {
                  //     if (value != null) {
                  //       setState(() {
                  //         selectedCategoryId = value;
                  //       });
                  //     }
                  //   },
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: selectedCategoryId,
                          items: List.generate(
                            snapshot.requireData.length,
                            (index) => DropdownMenuItem(
                              value: snapshot.requireData
                                  .elementAt(index)
                                  .loaisanphamId,
                              child: Text(snapshot.requireData
                                  .elementAt(index)
                                  .tenloai),
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
                        label: Text("Thêm"),
                      ),
                    ],
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
            );
          }),
    );
  }

  void update() {
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
      _updateProductFuture = _productApi.update(
        id: widget.product.sanphamId,
        tensanpham: nameInputController.text,
        loaisanpham: selectedCategoryId!,
      );

      _updateProductFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật sản phẩm thành công'),
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
        _deleteProductFuture = _productApi.delete(
          id: widget.product.sanphamId,
        );

        _deleteProductFuture?.then((value) {
          if (value == true) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa danh mục ${widget.product.tensanpham} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
