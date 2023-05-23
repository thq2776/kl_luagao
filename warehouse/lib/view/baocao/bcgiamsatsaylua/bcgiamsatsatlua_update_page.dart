// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/apis/bcgiamsatsaylua_api.dart';
import 'package:warehouse/models/bcgiamsatsaylua_model.dart';
import 'package:intl/intl.dart';

import '../../../apis/masolo_api.dart';
import '../../../models/masolo_model.dart';

class BcGiamSsatSayLuaUpdatePage extends StatefulWidget {
  BcGiamSsatSayLuaUpdatePage({super.key, required this.BcGiamSatSayLua});

  final BcGiamSatSayLuaModel BcGiamSatSayLua;
  Future<List<BcGiamSatSayLuaModel>>? _getBcGiamSatSayLuaModelList;
  @override
  State<BcGiamSsatSayLuaUpdatePage> createState() =>
      _BcGiamSsatSayLuaUpdatePageState();
}

class _BcGiamSsatSayLuaUpdatePageState
    extends State<BcGiamSsatSayLuaUpdatePage> {
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
  bool isButtonEnabled = true;
  int? selectedKLCL;
  String? nameInputError;
  String? descriptionInputError;
  int? selectedMSLId;
  String? masolosausay;
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
              if (selectedMSLId != null) {
                final selectedMasolo = masolosnapshot.requireData.firstWhere(
                  (item) => item.masoloId == selectedMSLId,
                );

                if (selectedMasolo != null) {
                  selectedKLCL =
                      selectedMasolo.khoiluong - selectedMasolo.khoiluongdadung;
                }
              }
              List<DropdownMenuItem<int>> filteredItems = masolosnapshot
                  .requireData
                  .where((item) => item.khoiluong - item.khoiluongdadung >= 0)
                  .map((item) => DropdownMenuItem(
                        value: item.masoloId,
                        child: Row(
                          children: [
                            Text(
                              item.masolo,
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "  klcl: ${item.khoiluong - item.khoiluongdadung}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ))
                  .toList();
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
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  child: Container(
                                    height: 50,
                                    child: const Text(
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
                                    isExpanded: true,
                                    items: filteredItems,
                                    decoration: const InputDecoration(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedMSLId = value;

                                          final selectedMasolo = masolosnapshot
                                              .requireData
                                              .firstWhere(
                                            (item) => item.masoloId == value,
                                          );
                                          selectedKLCL = selectedMasolo != null
                                              ? selectedMasolo.khoiluong -
                                                  selectedMasolo.khoiluongdadung
                                              : null;
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly, // Chỉ cho phép nhập số
                                  ],
                                  onChanged: (value) {
                                    int? inputValue = int.tryParse(value);
                                    if (inputValue != null &&
                                        inputValue >= selectedKLCL!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Vui lòng nhập số nhỏ hơn khối lượng còn lại của lô hàng'),
                                        ),
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                    errorText: descriptionInputError,
                                  ),
                                  controller: khoiluongInputController,
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
                                  keyboardType: TextInputType
                                      .number, // Chỉ cho phép nhập số
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly, // Chỉ cho phép nhập số
                                  ],
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
                                  keyboardType: TextInputType
                                      .number, // Chỉ cho phép nhập số
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly, // Chỉ cho phép nhập số
                                  ],
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
                                  keyboardType: TextInputType
                                      .number, // Chỉ cho phép nhập số
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly, // Chỉ cho phép nhập số
                                  ],
                                  onChanged: (value) {
                                    int? khoiluongsay = int.tryParse(
                                        khoiluongInputController.text);
                                    int? khoiluongtp = int.tryParse(value);
                                    if (khoiluongsay != null &&
                                        khoiluongtp != null &&
                                        khoiluongtp >= khoiluongsay) {
                                      setState(() {
                                        // Hiển thị thông báo hoặc sử dụng SnackBar
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Vui lòng nhập khối lượng lúa nhỏ hơn khối lượng sấy'),
                                          ),
                                        );
                                      });
                                    }
                                  },
                                  controller: khoiluongluakhoInputController,
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
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: isButtonEnabled ? create : null,
                              child: const Text("Tạo mới"),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Expanded(
                          //   child: ElevatedButton(
                          //     onPressed: update,
                          //     child: const Text("Cập nhật"),
                          //   ),
                          // ),
                          // const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: delete,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text("Xoá"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  // void update() async {
  //   // Kiểm tra giá trị đầu vào
  //   setState(() {
  //     if (khoiluongInputController.text.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Nhập đầy đủ thông tin'),
  //         ),
  //       );
  //       throw Exception('Vui lòng nhập đầy đủ thông tin');
  //     }
  //   });

  //   _updateBcGiamSatSayLuaFuture = _api.update(
  //     id: widget.BcGiamSatSayLua.baocaogiamsatsayluaId,
  //     masoloId: selectedMSLId!,
  //     ngay: ngayInputDateTime,
  //     khoiluong: int.parse(khoiluongInputController.text),
  //     losaylua: losayluaInputController.text,
  //     doambandau: doambandauInputController.text,
  //     dodaymelua: dodaymeluaInputController.text,
  //     noibaoquansaukhisay: noibaoquanInputController.text,
  //     // // thoigianbatdau: thoigianbatdauInputController.text,
  //     // // thoigianketthuc: thoigianketthucInputController.text,
  //     khoiluongluakho: khoiluongluakhoInputController.text,
  //     masolosaukhisay: masolosaukhisayInputController.text,
  //   );
  //   _MaSoLoApi.updateKLSD(
  //       id: selectedMSLId!,
  //       khoiluong: int.parse(khoiluongInputController.text));

  //   _updateBcGiamSatSayLuaFuture?.then((value) {
  //     if (value == true) {
  //       Navigator.of(context).pop(true);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Cập nhật thành công'),
  //         ),
  //       );
  //     }
  //   });
  // }

  void create() async {
    // Kiểm tra giá trị đầu vào
    bool shouldExit = false;
    setState(() {
      if (khoiluongluakhoInputController.text.isNotEmpty &&
              khoiluongInputController.text.isNotEmpty ||
          doambandauInputController.text.isEmpty ||
          dodaymeluaInputController.text.isEmpty) {
        if (int.parse(khoiluongluakhoInputController.text) >=
                int.parse(khoiluongInputController.text) ||
            int.parse(khoiluongInputController.text) > selectedKLCL!) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nhập khối lượng lúa khô < khối lượng sấy <= KLCL'),
            ),
          );
          shouldExit = true;
          return;
        }
      }
      if (khoiluongInputController.text.isEmpty ||
          losayluaInputController.text.isEmpty ||
          noibaoquanInputController.text.isEmpty ||
          khoiluongluakhoInputController.text.isEmpty ||
          doambandauInputController.text.isEmpty ||
          dodaymeluaInputController.text.isEmpty ||
          masolosaukhisayInputController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhập đầy đủ thông tin'),
          ),
        );
        shouldExit = true;
        return;
      }
      if (selectedKLCL == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng chọn lô khác. Lô này đã sấy hết'),
          ),
        );
        shouldExit = true;
        return;
      }
    });
    if (shouldExit) {
      return;
    }

    if (masolosaukhisayInputController.text.isNotEmpty) {
      final maSoLoExists = await _MaSoLoApi.checkMaSoLo(
          "${masolosaukhisayInputController.text}ss"); //check nếu mã số lô sau khi sấy đã tồn tại thì
// cập nhật khối lượng cho lô sau khi sấy lên
      if (maSoLoExists) {
        final laymasoloid = await _MaSoLoApi.checkMaSoLoDeLayMasoloid(
            "${masolosaukhisayInputController.text}ss"); // lấy mã số lô dựa vào tên mã số lô
        print('laymasoloid: $laymasoloid');
        _MaSoLoApi.update(
            id: laymasoloid!,
            loaisanpham: 557,
            trangthai: "Hoạt động",
            ten: "Sau khi sấy",
            masolo: masolosaukhisayInputController.text + "ss",
            khoiluongdadung: 0,
            mota: "Lô sau sấy",
            khoiluong: int.parse(khoiluongInputController.text) -
                int.parse(widget.BcGiamSatSayLua.khoiluongluakho));
        print(int.parse(khoiluongInputController.text) -
            int.parse(widget.BcGiamSatSayLua.khoiluongluakho));
      }
    } else {
      _MaSoLoApi.create(
          loaisanpham: 557,
          trangthai: "Hoạt động",
          ten: "Sau khi sấy",
          masolo: masolosaukhisayInputController.text + "ss",
          khoiluongdadung: 0,
          mota: "Lô sau sấy",
          khoiluong: int.parse(khoiluongInputController.text) -
              int.parse(widget.BcGiamSatSayLua.khoiluongluakho));
      print(int.parse(khoiluongInputController.text) -
          int.parse(widget.BcGiamSatSayLua.khoiluongluakho));
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

    //update kkhoois luong sd cua ma lo dem di sấy
    // _MaSoLoApi.update(
    //     id: selectedMSLId!,
    //     khoiluong: int.parse(khoiluongInputController.text));

//tạo lô mới sau sấy dựa trên số lô sau sấy
    _MaSoLoApi.create(
        loaisanpham: 555,
        ten: "Lô lúa sấy",
        trangthai: "Hoạt động",
        masolo: "${masolosaukhisayInputController.text}ss",
        khoiluong: int.parse(khoiluongluakhoInputController.text),
        khoiluongdadung: 0,
        mota: "Lô đã sấy");
    _createBcGiamSatSayLuaFuture?.then((value) {
      if (value == true) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
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
