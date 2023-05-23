// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/apis/bcgiamsatsaylua_api.dart';
import 'package:warehouse/models/bcgiamsatsaylua_model.dart';
import 'package:intl/intl.dart';

import '../../../apis/masolo_api.dart';
import '../../../models/masolo_model.dart';

class tao extends StatefulWidget {
  tao({super.key, required this.BcGiamSatSayLua});

  final BcGiamSatSayLuaModel BcGiamSatSayLua;
  Future<List<BcGiamSatSayLuaModel>>? _getBcGiamSatSayLuaModelList;
  @override
  State<tao> createState() => _taoState();
}

class _taoState extends State<tao> {
  final BcGiamSatSayLuaApi _api = BcGiamSatSayLuaApi();

  final MaSoLoApi _MaSoLoApi = MaSoLoApi();
  Future<bool?>? _updateBcGiamSatSayLuaFuture;
  Future<bool?>? _createBcGiamSatSayLuaFuture;
  Future<bool?>? _deleteProductCategoryFuture;

  Future<List<MaSoLoModel>>? _getMSLListFuture;
  Future<List<MaSoLoModel>>? getMaSoLoListFuture;
  int? masosloidInputController;
  TextEditingController losayluaInputController = TextEditingController();
  TextEditingController noibaoquanInputController = TextEditingController();
  TextEditingController khoiluongInputController = TextEditingController();
  TextEditingController doambandauInputController = TextEditingController();
  TextEditingController dodaymeluaInputController = TextEditingController();
  DateTime? thoigianbatdauInputController;
  DateTime? thoigianketthucInputController;
  TextEditingController khoiluongluakhoInputController =
      TextEditingController();
  TextEditingController masoloInputController = TextEditingController();
  TextEditingController masolosaukhisayInputController =
      TextEditingController();

  String? nameInputError;
  String? descriptionInputError;
  int? selectedMSLId;
  // Input Ngay
  // TextEditingController + DateTime
  late DateTime ngayInputDateTime;
  late TextEditingController ngayInputController;

  @override
  void initState() {
    super.initState();

    masosloidInputController = widget.BcGiamSatSayLua.masoloId;
    dodaymeluaInputController.text = widget.BcGiamSatSayLua.dodaymelua;

    ngayInputDateTime = widget.BcGiamSatSayLua.ngay;
    ngayInputController = TextEditingController.fromValue(
      TextEditingValue(
        text: DateFormat('dd/MM/yyyy').format(ngayInputDateTime),
      ),
    );

    khoiluongInputController.text = widget.BcGiamSatSayLua.khoiluong.toString();
    losayluaInputController.text = widget.BcGiamSatSayLua.losaylua;
    doambandauInputController.text = widget.BcGiamSatSayLua.doambandau;
    dodaymeluaInputController.text = widget.BcGiamSatSayLua.dodaymelua;
    noibaoquanInputController.text = widget.BcGiamSatSayLua.noibaoquansaukhisay;
    thoigianbatdauInputController = widget.BcGiamSatSayLua.thoigianbatdau;
    thoigianketthucInputController = widget.BcGiamSatSayLua.thoigianketthuc;
    khoiluongluakhoInputController.text =
        widget.BcGiamSatSayLua.khoiluongluakho;
    masolosaukhisayInputController.text =
        widget.BcGiamSatSayLua.masolosaukhisay;
    selectedMSLId = widget.BcGiamSatSayLua.masoloId;
    getMaSoLoList();
  }

  getMaSoLoList() {
    setState(() {
      getMaSoLoListFuture = _MaSoLoApi.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Chi tiết báo cáo sấy lúa: '),
              Text(widget.BcGiamSatSayLua.baocaogiamsatsayluaId.toString()),
            ],
          ),
        ),
        body: FutureBuilder<List<MaSoLoModel>>(
            future: getMaSoLoListFuture,
            builder: (context, masolosnapshot) {
              if (masolosnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (masolosnapshot.hasError) {
                return const Center(
                  child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
                );
              }

              if (masolosnapshot.requireData.isEmpty) {
                return const Center(
                  child: Text("Không có dữ liệu hiển thị"),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.05, // Lề ngang tùy chỉnh
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.lightGreenAccent,
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Ngày xuất bến",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: ngayInputController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                      // labelText: "Ngày xuất bến",
                                      // errorText: descriptionInputError,
                                      ),
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: ngayInputDateTime,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                    );

                                    if (date != null) {
                                      setState(() {
                                        ngayInputDateTime = date;
                                        ngayInputController.text =
                                            DateFormat('yyyy/MM/dd')
                                                .format(ngayInputDateTime);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Lò sấy lúa:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: losayluaInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Nơi bảo quản sau khi sấy:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: noibaoquanInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Container(
                                    height: 50,
                                    child: Text(
                                      "Mã số lô:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: DropdownButtonFormField<int>(
                                    value: selectedMSLId,
                                    isExpanded:
                                        true, // Đặt isExpanded thành true
                                    items: List.generate(
                                      masolosnapshot.requireData.length,
                                      (index) => DropdownMenuItem(
                                        value: masolosnapshot
                                            .requireData[index].masoloId,
                                        child: Row(
                                          children: [
                                            Text(
                                              masolosnapshot
                                                  .requireData[index].masolo,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              "  klcl: ${masolosnapshot.requireData[index].khoiluong - masolosnapshot.requireData[index].khoiluongdadung}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: const InputDecoration(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedMSLId = value;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Khối lượng sấy:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: khoiluongInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Độ ẩm ban đầu:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: doambandauInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Độ dày mẻ lúa:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: dodaymeluaInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Khối lượng lúa khô:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: khoiluongluakhoInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Text(
                                    "Mã số lô sau sấy(ss):",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextFormField(
                                  controller: masolosaukhisayInputController,
                                  decoration: InputDecoration(
                                    // labelText: "Đại diện phương tiện",
                                    errorText: descriptionInputError,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //   const SizedBox(height: 25),
                      //   Row(
                      //     children: [
                      //       Expanded(
                      //         child: ElevatedButton(
                      //           onPressed: create,
                      //           child: const Text("Tạo mới"),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 16),
                      //       // Expanded(
                      //       //   child: ElevatedButton(
                      //       //     onPressed: update,
                      //       //     child: const Text("Cập nhật"),
                      //       //   ),
                      //       // ),
                      //       // const SizedBox(width: 16),
                      //       Expanded(
                      //         child: ElevatedButton(
                      //           onPressed: delete,
                      //           style: ElevatedButton.styleFrom(
                      //             backgroundColor: Colors.red,
                      //           ),
                      //           child: const Text("Xoá"),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                    ],
                  ),
                ),
              );
            }));
  }

  void update() async {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (khoiluongInputController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhập đầy đủ thông tin'),
          ),
        );
        throw Exception('Vui lòng nhập đầy đủ thông tin');
      }
    });

    _updateBcGiamSatSayLuaFuture = _api.update(
      id: widget.BcGiamSatSayLua.baocaogiamsatsayluaId,
      masoloId: selectedMSLId!,
      ngay: ngayInputDateTime,
      khoiluong: int.parse(khoiluongInputController.text),
      losaylua: losayluaInputController.text,
      doambandau: doambandauInputController.text,
      dodaymelua: dodaymeluaInputController.text,
      noibaoquansaukhisay: noibaoquanInputController.text,
      // // thoigianbatdau: thoigianbatdauInputController.text,
      // // thoigianketthuc: thoigianketthucInputController.text,
      khoiluongluakho: khoiluongluakhoInputController.text,
      masolosaukhisay: masolosaukhisayInputController.text,
    );
    _MaSoLoApi.updateKLSD(
        id: selectedMSLId!,
        khoiluong: int.parse(khoiluongInputController.text));

    _updateBcGiamSatSayLuaFuture?.then((value) {
      if (value == true) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cập nhật thành công'),
          ),
        );
      }
    });
  }

  void create() async {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (khoiluongInputController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhập đầy đủ thông tin'),
          ),
        );
        throw Exception('Vui lòng nhập đầy đủ thông tin');
      }
    });
    if (masolosaukhisayInputController.text.isNotEmpty) {
      final maSoLoExists = await _MaSoLoApi.checkMaSoLo(
          masolosaukhisayInputController.text + "ss");
//cập nhật khối lượng đã dùng
      if (maSoLoExists) {
        _MaSoLoApi.updateKLSD(
            id: selectedMSLId!,
            khoiluong: int.parse(khoiluongInputController.text));
        return;
      }
    }
    _createBcGiamSatSayLuaFuture = _api.create(
      masoloId: selectedMSLId!,
      ngay: ngayInputDateTime,
      khoiluong: int.parse(khoiluongInputController.text),
      losaylua: losayluaInputController.text,
      doambandau: doambandauInputController.text,
      dodaymelua: dodaymeluaInputController.text,
      noibaoquansaukhisay: noibaoquanInputController.text,
      // // thoigianbatdau: thoigianbatdauInputController.text,
      // // thoigianketthuc: thoigianketthucInputController.text,
      khoiluongluakho: khoiluongluakhoInputController.text,
      masolosaukhisay: masolosaukhisayInputController.text,
    );
    _MaSoLoApi.updateKLSD(
        id: selectedMSLId!,
        khoiluong: int.parse(khoiluongInputController.text));
//tạo lô mới sau sấy dựa trên số lô sau sấy
    _MaSoLoApi.create(
        loaisanpham: 555,
        ten: "Lô lúa sấy",
        trangthai: "Hoạt động",
        masolo: "${masolosaukhisayInputController}ss",
        khoiluong: int.parse(
          khoiluongInputController.text,
        ),
        khoiluongdadung: 0,
        mota: "Lô đã sấy");
    _createBcGiamSatSayLuaFuture?.then((value) {
      if (value == true) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cập nhật thành công'),
          ),
        );
      }
    });
  }

  void delete() async {
    bool? isConfirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thông báo"),
        content: const Text("Bạn có có muốn xoá dữ liệu này không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Quay lại"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text("Xoá"),
          ),
        ],
      ),
    );

    if (isConfirm == true) {
      setState(() {
        _deleteProductCategoryFuture = _api.delete(
          id: widget.BcGiamSatSayLua.baocaogiamsatsayluaId,
        );

        _deleteProductCategoryFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa danh mục ${widget.BcGiamSatSayLua.baocaogiamsatsayluaId} thành công'),
              ),
            );
          }
        });
      });
    }
  }

  getBcGiamSatSayLuaModelList() {
    setState(() {
      // _getBcGiamSatSayLuaModelList = _api.list();
    });
  }
}
