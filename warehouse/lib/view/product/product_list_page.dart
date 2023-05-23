// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/apis/product_api.dart';
import 'package:warehouse/models/product_category_model.dart';
import 'package:warehouse/view/product/product_create_page.dart';
import 'package:warehouse/view/product/product_update_page.dart';

import '../../apis/product_category_api.dart';
import '../../models/product_model.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ProductApi _productApi = ProductApi();
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();

  Future? _getProductList;

  @override
  void initState() {
    super.initState();

    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sản phẩm"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductCreatePage(),
                ),
              );

              if (update == true) {
                getProductList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getProductList,
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

          List<ProductModel> productList = snapshot.requireData[0];
          List<ProductCategoryModel> productCategoryList =
              snapshot.requireData[1];

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: productList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (BuildContext context, int index) {
              var product = productList.elementAt(index);
              var category = productCategoryList.firstWhere(
                (element) => element.loaisanphamId == product.loaisanphamId,
                orElse: () => ProductCategoryModel(
                  loaisanphamId: 0,
                  tenloai: "",
                  mota: "",
                ),
              );

              return Card(
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductUpdatePage(product: product),
                      ),
                    );

                    if (update == true) {
                      getProductList();
                    }
                  },
                  title: Text(product.tensanpham),
                  subtitle: Text(category.tenloai),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getProductList() {
    setState(() {
      _getProductList = Future.wait([
        _productApi.list(),
        _productCategoryApi.list(),
      ]);
    });
  }
}
