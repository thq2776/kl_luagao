// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/view/masolo/masolo_create_page.dart';
import 'package:warehouse/view/masolo/masolo_update_page.dart';
import '../../apis/masolo_api.dart';
import '../../models/masolo_model.dart';

class MaSoLoListPage extends StatefulWidget {
  const MaSoLoListPage({super.key});

  @override
  State<MaSoLoListPage> createState() => _MaSoLoListPageState();
}

class _MaSoLoListPageState extends State<MaSoLoListPage> {
  final MaSoLoApi _api = MaSoLoApi();

  Future<List<MaSoLoModel>>? _getMaSoLoList;
  bool showInvalidItems = false;

  @override
  void initState() {
    super.initState();
    // _updateMaSoLoStatus();
    getMaSoLoList();
    _updateMaSoLoStatus();
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

          // Tạo một danh sách mới để lưu trữ chỉ mục hợp lệ
          List<int> validIndexes = [];

          // Kiểm tra các chỉ mục và lọc ra chỉ mục hợp lệ
          for (int i = 0; i < snapshot.requireData.length; i++) {
            var masolo = snapshot.requireData.elementAt(i);
            if (masolo.trangthai == "Hoạt động") {
              validIndexes.add(i);
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                    color: Colors.blue,
                    child: Image.network(
                      'https://tse4.mm.bing.net/th?id=OIP.RRuJ4txtnVFCNS18zhyt3gHaE8&pid=Api&P=0',
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    width: double.infinity,
                    height: 25,
                    color: const Color.fromARGB(255, 72, 137, 85),
                    child: const Text(
                      "  Danh sách các lô còn ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Container(
                    color: Color.fromARGB(255, 204, 207, 210),
                    child: SizedBox(
                      height: 400,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: showInvalidItems
                            ? snapshot.requireData.length
                            : validIndexes.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var masolo = showInvalidItems
                              ? snapshot.requireData.elementAt(index)
                              : snapshot.requireData
                                  .elementAt(validIndexes[index]);

                          return Container(
                            color: Color.fromARGB(255, 203, 134, 134),
                            child: Card(
                              child: ListTile(
                                onTap: () async {
                                  bool? update =
                                      await Navigator.of(context).push(
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
                                    const Text('Mã số lô '),
                                    Text(masolo.masolo.toString()),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    const Text('Trạng thái: '),
                                    Text(
                                      masolo.trangthai,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: masolo.trangthai == "Hoạt động"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showInvalidItems = !showInvalidItems;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    showInvalidItems ? 'Ẩn lô đã đóng' : 'Hiển thị tất cả',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _updateMaSoLoStatus() async {
    try {
      // Lấy danh sách mã số lô từ API
      final List<MaSoLoModel> masoloList = await _api.list();

      // Duyệt qua từng mã số lô và kiểm tra trạng thái
      for (var masolo in masoloList) {
        if (masolo.khoiluong <= masolo.khoiluongdadung) {
          // Nếu khoiluong bằng khoiluongdadung, cập nhật trạng thái thành 'Đã đóng'
          masolo.trangthai = 'Đã đóng';
          await _api.update_masolo_theokhoiluong(masolo);
        }
      }

      // Cập nhật lại danh sách mã số lô sau khi đã cập nhật trạng thái
      getMaSoLoList();
    } catch (error) {
      // Xử lý lỗi nếu có
      print('Lỗi khi cập nhật trạng thái mã số lô: $error');
    }
  }

  getMaSoLoList() {
    setState(() {
      _getMaSoLoList = _api.list();
    });
  }
}
