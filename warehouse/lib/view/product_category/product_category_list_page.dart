import 'package:flutter/material.dart';
import 'package:warehouse/apis/product_category_api.dart';
import 'package:warehouse/view/product_category/product_category_create_page.dart';
import 'package:warehouse/view/product_category/product_category_update_page.dart';

import '../../models/product_category_model.dart';

class ProductCategoryListPage extends StatefulWidget {
  const ProductCategoryListPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryListPage> createState() =>
      _ProductCategoryListPageState();
}

class _ProductCategoryListPageState extends State<ProductCategoryListPage> {
  final ProductCategoryApi _api = ProductCategoryApi();

  Future<List<ProductCategoryModel>>? _getProductCategoryList;

  @override
  void initState() {
    super.initState();

    getProductCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh mục sản phẩm"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductCategoryCreatePage(),
                ),
              );

              if (update == true) {
                getProductCategoryList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductCategoryModel>>(
        future: _getProductCategoryList,
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

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.requireData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (BuildContext context, int index) {
              var category = snapshot.requireData.elementAt(index);

              return Card(
                color: const Color.fromARGB(
                    255, 186, 219, 241), // Thay đổi màu background
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductCategoryUpdatePage(
                          category: category,
                        ),
                      ),
                    );

                    if (update == true) {
                      getProductCategoryList();
                    }
                  },
                  title: Text(category.tenloai),
                  subtitle: Text(category.mota),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getProductCategoryList() {
    setState(() {
      _getProductCategoryList = _api.list();
    });
  }
}
