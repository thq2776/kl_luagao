// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/view/phuongtien/phieudieuphuongtien_creat.dart';
import 'package:warehouse/view/phuongtien/phieudieuphuongtien_update.dart';
import 'package:warehouse/view/phuongtien/phuongtien_create_page.dart';

import '../../apis/phieudieuphuongtien_api.dart';
import '../../models/phieudieuphuongtien_model.dart';

class PhieuDieuPhuongTienListPage extends StatefulWidget {
  const PhieuDieuPhuongTienListPage({super.key});

  @override
  State<PhieuDieuPhuongTienListPage> createState() =>
      _PhieuDieuPhuongTienListPageState();
}

class _PhieuDieuPhuongTienListPageState
    extends State<PhieuDieuPhuongTienListPage> {
  final PhieuDieuPhuongTienApi _api = PhieuDieuPhuongTienApi();

  Future<List<PhieuDieuPhuongTienModel>>? _getPhieuDieuPhuongTienList;

  @override
  void initState() {
    super.initState();

    getPhieuDieuPhuongTienList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phiếu điều Phương tiện"),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     bool? update = await Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const PhieuDieuPhuongTienUpdatePage(phieudieuphuongtien: null,),
          //       ),
          //     );

          //     if (update == true) {
          //       getPhieuDieuPhuongTienList();
          //     }
          //   },
          //   icon: const Icon(Icons.add),
          // ),
        ],
      ),
      body: FutureBuilder<List<PhieuDieuPhuongTienModel>>(
        future: _getPhieuDieuPhuongTienList,
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
              var phieudieuphuongtien = snapshot.requireData.elementAt(index);

              return Card(
                color: const Color.fromARGB(255, 186, 219, 241),
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhieuDieuPhuongTienUpdatePage(
                          phieudieuphuongtien: phieudieuphuongtien,
                        ),
                      ),
                    );

                    if (update == true) {
                      getPhieuDieuPhuongTienList();
                    }
                  },
                  title: Row(
                    children: [
                      const Text('Đại diện phương tiện: '),
                      Text(phieudieuphuongtien.daidienphuongtien.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Text('Địa chỉ vùng hàng: '),
                      Text(phieudieuphuongtien.diachivung.toString()),
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

  getPhieuDieuPhuongTienList() {
    setState(() {
      _getPhieuDieuPhuongTienList = _api.list();
    });
  }
}
