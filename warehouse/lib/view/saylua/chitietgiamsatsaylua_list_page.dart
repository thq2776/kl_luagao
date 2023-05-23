// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/view/saylua/chitietgiamsatsaylua_update_page.dart';
import '../../apis/chitietgiamsatsaylua_api.dart';
import '../../models/chitietgiamsatsaylua_model.dart';

class ChiTietSayLuaListPage extends StatefulWidget {
  const ChiTietSayLuaListPage({super.key});

  @override
  State<ChiTietSayLuaListPage> createState() => _ChiTietSayLuaListPageState();
}

class _ChiTietSayLuaListPageState extends State<ChiTietSayLuaListPage> {
  final ChiTietSayLuaApi _api = ChiTietSayLuaApi();

  Future<List<ChiTietSayLuaModel>>? _getChiTietSayLuaList;

  @override
  void initState() {
    super.initState();

    getChiTietSayLuaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết giám sát sấy lúa"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(),
                ),
              );

              if (update == true) {
                getChiTietSayLuaList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<ChiTietSayLuaModel>>(
        future: _getChiTietSayLuaList,
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
              var chitietsaylua = snapshot.requireData.elementAt(index);

              return Card(
                color: const Color.fromARGB(255, 186, 219, 241),
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChiTietSayLuaUpDatePage(
                          chitietsaylua: chitietsaylua,
                        ),
                      ),
                    );

                    if (update == true) {
                      getChiTietSayLuaList();
                    }
                  },
                  title: Row(
                    children: [
                      Text('Mã chi tiết giám sát sấy lúa: '),
                      Text(chitietsaylua.chitietgiamsatsayluaId.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text('Thông số vận hành: '),
                      Text(chitietsaylua.thongsovanhanh),
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

  getChiTietSayLuaList() {
    setState(() {
      _getChiTietSayLuaList = _api.list();
    });
  }
}
