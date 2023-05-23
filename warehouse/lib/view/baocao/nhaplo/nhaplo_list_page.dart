// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/view/baocao/nhaplo/nhaplo_update.dart';
import '../../../apis/nhaplo_api.dart';
import '../../../models/nhaplo_model.dart';
class NhapLo extends StatefulWidget {
  const NhapLo({super.key});

  @override
  State<NhapLo> createState() => _NhapLoState();
}

class _NhapLoState extends State<NhapLo> {
  final NhapLoApi _api = NhapLoApi();
  final KhachHangApi _apii = KhachHangApi();

  Future<List<KhachHangModel>>? _getKhachHangList;
  Future<List<NhapLoModel>>? _getNhapLoList;
  String _searchText = '';
  bool _isSearching = false;

  final TextEditingController _searchController =
      TextEditingController(); //seachbar

  @override
  void initState() {
    super.initState();

    getNhapLoList();
    getKhachHangList();
  }

  getKhachHangList() {
    setState(() {
      _getKhachHangList = _apii.list();
    });
  }

  getNhapLoList() {
    setState(() {
      _getNhapLoList = _api.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Báo cáo nhập lô:"),
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
                          labelText: 'Nhập từ khóa',
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
      // actions: [
      //   IconButton(
      //     onPressed: () async {
      //       bool? update = await Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => const MaSoLoCreatPage(),
      //         ),
      //       );

      //       if (update == true) {
      //         getToKhaiList();
      //       }
      //     },
      //     icon: const Icon(Icons.add),
      //   ),
      // ],

      body: FutureBuilder<List<NhapLoModel>>(
        future: _getNhapLoList,
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

          return FutureBuilder<List<KhachHangModel>>(
            future: _getKhachHangList,
            builder: (context, khsnapshot) {
              if (khsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (khsnapshot.hasError) {
                return const Center(
                  child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
                );
              }

              if (khsnapshot.requireData.isEmpty) {
                return const Center(
                  child: Text("Không có dữ liệu hiển thị"),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: snapshot.requireData.length,
                itemBuilder: (BuildContext context, int index) {
                  // Chỉ mục riêng cho nhaploid
                  var nhaploid = snapshot.requireData.elementAt(index);
                  var kh = khsnapshot.requireData.elementAt(index);

                  if (_searchText.isEmpty ||
                      nhaploid.masolotp
                          .toLowerCase()
                          .contains(_searchText.toLowerCase())) {
                    String updatedTen = nhaploid.masolotp;

                    return Column(
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: ListTile(
                            title: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://tse4.mm.bing.net/th?id=OIP.sgA2-C0PBr1JPfzUrTdx_AHaHa&pid=Api&P=0',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Lô TP:${nhaploid.masolotp}',
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
                                  builder: (context) => NhapLoUpdate(
                                    nhaploid: nhaploid,
                                  ),
                                ),
                              );

                              if (update == true) {
                                getNhapLoList();
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
