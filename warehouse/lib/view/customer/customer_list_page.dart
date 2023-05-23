import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/view/customer/customer_create_page.dart';
import 'package:warehouse/view/customer/customer_update_page.dart';
import 'package:warehouse/view/product_category/product_category_list_page.dart';
import 'package:warehouse/view/product_category/product_category_update_page.dart';

import '../../apis/product_category_api.dart';
import '../../models/product_category_model.dart';
import '../saylua/chitietgiamsatsaylua_create_page.dart';
import 'package:collection/collection.dart';

// ignore: camel_case_types
class Customerlist extends StatefulWidget {
  const Customerlist({super.key});

  @override
  State<Customerlist> createState() => _CustomerlistState();
}

// ignore: camel_case_types
class _CustomerlistState extends State<Customerlist> {
  final KhachHangApi _api = KhachHangApi();
  Future<List<KhachHangModel>>? _getKhachHangList;

  String _searchText = '';
  bool _isSearching = false;

  final TextEditingController _searchController =
      TextEditingController(); //seachbar

  @override
  void initState() {
    super.initState();

    getCustomerList();
  }

  //thanh cuộn ngang

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách nông hộ"),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     bool? update = await Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => (){},
          //       ),
          //     );

          //     if (update == true) {
          //       getCustomerList();
          //     }
          //   },
          //   icon: const Icon(Icons.add),
          // ),
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
                          labelText: 'Nhập từ khóa tên nông hộ',
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
      body: FutureBuilder<List<KhachHangModel>>(
        future: _getKhachHangList,
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
              crossAxisCount: 2, // Số cột trong grid
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
                  category.ten
                      .toLowerCase()
                      .contains(_searchText.toLowerCase())) {
                return Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // Màu nền của hình tròn
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  'https://tse4.mm.bing.net/th?id=OIP.8mxPLszJkIKL_mnrA4W-RwHaGl&pid=Api&P=0',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.ten,
                              style: const TextStyle(
                                fontSize: 8,
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
                              builder: (context) => CustomerUpdatePage(
                                category: category,
                              ),
                            ),
                          );

                          if (update == true) {
                            getCustomerList();
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
        },
      ),
    );
  }

  getCustomerList() {
    setState(() {
      _getKhachHangList = _api.list();
    });
  }
}
