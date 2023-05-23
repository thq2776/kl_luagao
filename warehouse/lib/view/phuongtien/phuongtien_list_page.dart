// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/view/phuongtien/phuongtien_create_page.dart';
import 'package:warehouse/view/phuongtien/phuongtien_update_page.dart';

import '../../apis/phuongtien_api.dart';
// import '../../models/phuongtien_model.dart';
import '../../models/phuongtien_modell.dart';

class PhuongTienListPage extends StatefulWidget {
  const PhuongTienListPage({super.key});

  @override
  State<PhuongTienListPage> createState() => _PhuongTienListPageState();
}

class _PhuongTienListPageState extends State<PhuongTienListPage> {
  final PhuongTienApi _api = PhuongTienApi();

  Future<List<PhuongTienModel>>? _getPhuongTienList;

  @override
  void initState() {
    super.initState();

    getPhuongTienList();
  }

  getPhuongTienList() {
    setState(() {
      _getPhuongTienList = _api.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phương tiện"),
        actions: [
          IconButton(
            onPressed: () async {
              bool? update = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PhuongTienCreatePage(),
                ),
              );

              if (update == true) {
                getPhuongTienList();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<PhuongTienModel>>(
        future: _getPhuongTienList,
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
              var phuongtien = snapshot.requireData.elementAt(index);

              return Card(
                color: const Color.fromARGB(255, 186, 219, 241),
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhuongTienUpdatePage(
                          phuongtien: phuongtien,
                        ),
                      ),
                    );

                    if (update == true) {
                      getPhuongTienList();
                    }
                  },
                  title: Text(phuongtien.tenphuongtien),
                  subtitle: Text(phuongtien.sophuongtien),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
