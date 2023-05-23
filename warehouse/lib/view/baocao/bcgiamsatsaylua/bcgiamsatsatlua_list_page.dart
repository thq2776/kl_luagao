// Xem danh sách danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/apis/bcgiamsatsaylua_api.dart';
import 'package:warehouse/view/baocao/bcgiamsatsaylua/bcgiamsatsatlua_create_page.dart';
import 'package:warehouse/view/baocao/bcgiamsatsaylua/bcgiamsatsatlua_update_page.dart';

import '../../../models/bcgiamsatsaylua_model.dart';

class BcGiamSatSayLuaListPage extends StatefulWidget {
  const BcGiamSatSayLuaListPage({super.key});

  @override
  State<BcGiamSatSayLuaListPage> createState() =>
      _BcGiamSatSayLuaListPageState();
}

class _BcGiamSatSayLuaListPageState extends State<BcGiamSatSayLuaListPage> {
  final BcGiamSatSayLuaApi _api = BcGiamSatSayLuaApi();

  Future<List<BcGiamSatSayLuaModel>>? _getBcGiamSatSayLuaModelList;

  @override
  void initState() {
    super.initState();
    getBcGiamSatSayLuaModelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Báo cáo giám sát sấy lúa"),
      ),
      body: FutureBuilder<List<BcGiamSatSayLuaModel>>(
        future: _getBcGiamSatSayLuaModelList,
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
              var BcGiamSatSayLua = snapshot.requireData.elementAt(index);

              return Card(
                child: ListTile(
                  onTap: () async {
                    bool? update = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => tao(
                          BcGiamSatSayLua: BcGiamSatSayLua,
                        ),
                      ),
                    );

                    if (update == true) {
                      getBcGiamSatSayLuaModelList();
                    }
                  },
                  title: Text('Lò sấy: ${BcGiamSatSayLua.losaylua}'),
                  subtitle: Text('Ngày: ${BcGiamSatSayLua.ngay.toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      bool? update = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BcGiamSsatSayLuaUpdatePage(
                            BcGiamSatSayLua: BcGiamSatSayLua,
                          ),
                        ),
                      );

                      if (update == true) {
                        getBcGiamSatSayLuaModelList();
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getBcGiamSatSayLuaModelList() {
    setState(() {
      _getBcGiamSatSayLuaModelList = _api.list();
    });
  }
}
