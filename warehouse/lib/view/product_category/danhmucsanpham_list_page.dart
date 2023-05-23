import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:warehouse/view/product_category/product_category_list_page.dart';
import 'package:warehouse/view/product_category/product_category_update_page.dart';

import '../../apis/product_category_api.dart';
import '../../models/product_category_model.dart';
import '../saylua/chitietgiamsatsaylua_create_page.dart';
import 'package:collection/collection.dart';

// ignore: camel_case_types
class danhmucsanpham extends StatefulWidget {
  const danhmucsanpham({super.key});

  @override
  State<danhmucsanpham> createState() => _danhmucsanphamState();
}

// ignore: camel_case_types
class _danhmucsanphamState extends State<danhmucsanpham> {
  final ProductCategoryApi _api = ProductCategoryApi();
  Future<List<ProductCategoryModel>>? _getProductCategoryList;

  String _searchText = '';
  bool _isSearching = false;

  final TextEditingController _searchController =
      TextEditingController(); //seachbar

  @override
  void initState() {
    super.initState();

    getProductCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("danh mục sản phẩm"),
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
          IconButton(
            onPressed: () {
              if (_isSearching) {
                // Nếu đang trong trạng thái tìm kiếm
                setState(() {
                  _isSearching = false;
                  _searchText = '';
                  _searchController.clear();
                });
              } else {
                // Nếu không trong trạng thái tìm kiếm
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Tìm kiếm'),
                      content: TextFormField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Nhập từ khóa danh mục',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _searchController.clear();
                          },
                          child: const Text('Hủy'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _isSearching = true;
                              _searchText = _searchController.text;
                            });
                          },
                          child: const Text('Tìm kiếm'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: Icon(_isSearching ? Icons.arrow_back : Icons.search),
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
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // Kích thước tối đa của các phần tử
              crossAxisCount: 3, // Số cột trong grid
              childAspectRatio: 1.5,
              mainAxisSpacing:
                  10.0, // Khoảng cách giữa các phần tử theo chiều chính (dọc)
              crossAxisSpacing:
                  10.0, // Khoảng cách giữa các phần tử theo chiều ngang (ngang)
            ),
            itemCount: snapshot.requireData.length,
            itemBuilder: (BuildContext context, int index) {
              var category = snapshot.requireData.elementAt(index);
              if (_searchText.isEmpty ||
                  category.tenloai
                      .toLowerCase()
                      .contains(_searchText.toLowerCase())) {
                return Column(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // Màu nền của hình tròn
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  'https://wall.vn/wp-content/uploads/2019/11/hinh-anh-canh-dong-lua-15.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.tenloai,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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
                        // title: Text(category.tenloai),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox
                    .shrink(); // Trả về widget rỗng nếu không khớp với từ khóa tìm kiếm
              }
            },
          );

          // return GridView.count(
          //   crossAxisCount: 3,
          //   padding: const EdgeInsets.all(16),
          //   mainAxisSpacing: 16,
          //   crossAxisSpacing: 16,
          //   children: [
          //     GestureDetector(
          //       onTap: () => Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => const ProductCategoryListPage(),
          //         ),
          //       ),
          //       child: Column(
          //         children: [
          //           Image.network(
          //             'https://wall.vn/wp-content/uploads/2019/11/hinh-anh-canh-dong-lua-15.jpg',
          //             width: 64,
          //             height: 64,
          //           ),
          //           const SizedBox(height: 8),
          //            Text(
          //             "Quản lý danh mục",
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 14,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
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
