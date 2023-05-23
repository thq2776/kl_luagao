// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/view/masolo/masolo_create_page.dart';
import 'package:warehouse/view/masolo/masolo_update_page.dart';
import '../../apis/masolo_api.dart';
import '../../models/masolo_model.dart';

class zMaSoLoListPage extends StatefulWidget {
  const zMaSoLoListPage({super.key});

  @override
  State<zMaSoLoListPage> createState() => _zMaSoLoListPageState();
}

class _zMaSoLoListPageState extends State<zMaSoLoListPage> {
  final MaSoLoApi _api = MaSoLoApi();

  Future<List<MaSoLoModel>>? _getMaSoLoList;

  @override
  void initState() {
    super.initState();

    getMaSoLoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mã số lô"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MaSoLoCreatPage(),
                ),
              );

              if (update == true) {
                getMaSoLoList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<MaSoLoModel>>(
        future: _getMaSoLoList,
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
              var masolo = snapshot.requireData.elementAt(index);

              return Card(
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MaSoLoUpdatePage(
                          masolo: masolo,
                        ),
                      ),
                    );

                    if (update == true) {
                      getMaSoLoList();
                    }
                  },
                  title: Row(
                    children: [
                      const Text('Tên lô: '),
                      Text(masolo.ten.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Text('Mô tả: '),
                      Text(masolo.mota.toString()),
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

  getMaSoLoList() {
    setState(() {
      _getMaSoLoList = _api.list();
    });
  }
}
