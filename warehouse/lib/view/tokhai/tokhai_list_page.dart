// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/models/tokhai_model.dart';
import 'package:warehouse/view/tokhai/tokhai_update_page.dart';

import '../../apis/masolo_api.dart';
import '../../apis/tokhai_api.dart';
import '../../models/masolo_model.dart';
import '../masolo/masolo_create_page.dart';

class ToKhaiListPage extends StatefulWidget {
  const ToKhaiListPage({super.key});

  @override
  State<ToKhaiListPage> createState() => _ToKhaiListPageState();
}

class _ToKhaiListPageState extends State<ToKhaiListPage> {
  final ToKhaiApi _api = ToKhaiApi();
  final KhachHangApi _apii = KhachHangApi();

  Future<List<KhachHangModel>>? _getCustomerList;
  Future<List<ToKhaiModel>>? _getToKhaiList;

  @override
  void initState() {
    super.initState();

    getToKhaiList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tờ khai cam kết xuất xứ"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MaSoLoCreatPage(),
                ),
              );

              if (update == true) {
                getToKhaiList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<ToKhaiModel>>(
        future: _getToKhaiList,
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
              var tokhai = snapshot.requireData.elementAt(index);

              return Card(
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TokhaiUpdatePage(
                          tokhai: tokhai,
                        ),
                      ),
                    );

                    if (update == true) {
                      getToKhaiList();
                    }
                  },
                  title: Row(
                    children: [
                      const Text('Tờ khai số: '),
                      Text(tokhai.tokhaixuatxucamketId.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Text('Vùng nguyên liệu: '),
                      Text(tokhai.vungnguyenlieu.toString()),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getToKhaiList() {
    setState(() {
      _getToKhaiList = _api.list();
    });
  }
}
