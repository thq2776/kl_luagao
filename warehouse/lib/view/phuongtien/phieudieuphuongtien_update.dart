// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/models/customer_model.dart';

import '../../apis/masolo_api.dart';
import '../../apis/phieudieuphuongtien_api.dart';
import '../../apis/phuongtien_api.dart';
import '../../apis/product_api.dart';
import '../../models/masolo_model.dart';
import '../../models/phieudieuphuongtien_model.dart';
import '../../models/phuongtien_modell.dart';
import '../../models/product_model.dart';

class PhieuDieuPhuongTienUpdatePage extends StatefulWidget {
  const PhieuDieuPhuongTienUpdatePage(
      {super.key, required this.phieudieuphuongtien});

  final PhieuDieuPhuongTienModel phieudieuphuongtien;

  @override
  State<PhieuDieuPhuongTienUpdatePage> createState() =>
      _PhieuDieuPhuongTienUpdatePageState();
}

class _PhieuDieuPhuongTienUpdatePageState
    extends State<PhieuDieuPhuongTienUpdatePage> {
  final PhieuDieuPhuongTienApi phieudieuphuongtien_api =
      PhieuDieuPhuongTienApi();
  final PhuongTienApi phuongtien_api = PhuongTienApi();
  final ProductApi _productApi = ProductApi();
  final MaSoLoApi _MaSoLoApi = MaSoLoApi();
  final KhachHangApi _KhachHangApi = KhachHangApi();

  Future<List<ProductModel>>? getProductListFuture;
  Future<List<KhachHangModel>>? getKhachHangListFuture;

  Future<List<PhuongTienModel>>? getPhuongTienListFuture;
  Future<List<MaSoLoModel>>? getMaSoLoListFuture;
  Future<bool?>? _updatePhieuDieuPhuongTienFuture;
  Future<bool?>? _createPhieuDieuPhuongTienFuture;
  Future<bool?>? _deletePhieuDieuPhuongTienFuture;

  TextEditingController tennguyenlieuInputController = TextEditingController();
  TextEditingController tennguoibanInputController = TextEditingController();
  TextEditingController sohopdongController = TextEditingController();
  TextEditingController diachivungController = TextEditingController();
  TextEditingController daidienphuongtienController = TextEditingController();
  TextEditingController soluongController = TextEditingController();
  TextEditingController tinhtrangvesinhController = TextEditingController();
  TextEditingController baoquanController = TextEditingController();

  int? selectedtaitrong;
  String? nameInputError;
  String? descriptionInputError;
  int? secletedPhuongTienId;
  int? selectedProductId;
  int? selectedMSLId;
  int? selectedKhachHangId;
  String? dropdownValue;

  late DateTime ngayxuatbenInputDateTime;
  late TextEditingController ngayxuatbenInputController;
  @override
  void initState() {
    super.initState();
    // secletedPhuongTienId = widget..loaisanphamId;
    secletedPhuongTienId = widget.phieudieuphuongtien.phuongtienId;
    selectedProductId = widget.phieudieuphuongtien.sanphamId;
    selectedMSLId = widget.phieudieuphuongtien.masoloId;
    diachivungController.text = widget.phieudieuphuongtien.diachivung;
    selectedKhachHangId = widget.phieudieuphuongtien.khachhangId;
    tinhtrangvesinhController.text = widget.phieudieuphuongtien.tinhtrang;
    baoquanController.text = widget.phieudieuphuongtien.baoquan;
    soluongController.text = widget.phieudieuphuongtien.soluong;
    daidienphuongtienController.text =
        widget.phieudieuphuongtien.daidienphuongtien;

    // tennguyenlieuInputController =
    //     widget.phieudieuphuongtien.tennguyenlieu;
    ngayxuatbenInputDateTime = widget.phieudieuphuongtien.ngayxuatben;
    ngayxuatbenInputController = TextEditingController.fromValue(
      TextEditingValue(
        text: DateFormat('yyyy/MM/dd').format(ngayxuatbenInputDateTime),
      ),
    );
    getMaSoLoList();
    getProductList();
    getPhuongTienList();
    getKhachHangList();
  }

  getKhachHangList() {
    setState(() {
      getKhachHangListFuture = _KhachHangApi.list();
    });
  }

  getMaSoLoList() {
    setState(() {
      getMaSoLoListFuture = _MaSoLoApi.list();
    });
  }

  getPhuongTienList() {
    setState(() {
      getPhuongTienListFuture = phuongtien_api.list();
    });
  }

  getProductList() {
    setState(() {
      getProductListFuture = _productApi.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Phiếu điều phương tiện"),
        ),
        body: FutureBuilder<List<PhuongTienModel>>(
            future: getPhuongTienListFuture,
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
              return FutureBuilder<List<ProductModel>>(
                  future: getProductListFuture,
                  builder: (context, productsnapshot) {
                    if (productsnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (productsnapshot.hasError) {
                      return const Center(
                        child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
                      );
                    }

                    if (productsnapshot.requireData.isEmpty) {
                      return const Center(
                        child: Text("Không có dữ liệu hiển thị"),
                      );
                    }
                    return FutureBuilder<List<MaSoLoModel>>(
                        future: getMaSoLoListFuture,
                        builder: (context, masolosnapshot) {
                          if (masolosnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (masolosnapshot.hasError) {
                            return const Center(
                              child: Text(
                                  "Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
                            );
                          }

                          if (masolosnapshot.requireData.isEmpty) {
                            return const Center(
                              child: Text("Không có dữ liệu hiển thị"),
                            );
                          }
                          return FutureBuilder<List<KhachHangModel>>(
                              future: getKhachHangListFuture,
                              builder: (context, khachhangsnapshot) {
                                if (khachhangsnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (khachhangsnapshot.hasError) {
                                  return const Center(
                                    child: Text(
                                        "Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
                                  );
                                }

                                if (khachhangsnapshot.requireData.isEmpty) {
                                  return const Center(
                                    child: Text("Không có dữ liệu hiển thị"),
                                  );
                                }
                                if (secletedPhuongTienId != null) {
                                  final selectedtaitrong =
                                      snapshot.requireData.firstWhere(
                                    (item) =>
                                        item.phuongtienId ==
                                        secletedPhuongTienId,
                                  );
                                }
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05, // Lề ngang tùy chỉnh
                                      vertical: 30,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          color: Colors.lightGreenAccent,
                                          child: Table(
                                            defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            columnWidths: const {
                                              0: FlexColumnWidth(),
                                              1: FlexColumnWidth(),
                                            },
                                            children: [
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Ngày xuất bến",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        ngayxuatbenInputController,
                                                    readOnly: true,
                                                    decoration: const InputDecoration(
                                                        // labelText: "Ngày xuất bến",
                                                        // errorText: descriptionInputError,
                                                        ),
                                                    onTap: () async {
                                                      DateTime? date =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            ngayxuatbenInputDateTime,
                                                        firstDate:
                                                            DateTime(1900),
                                                        lastDate:
                                                            DateTime(2100),
                                                      );

                                                      if (date != null) {
                                                        setState(() {
                                                          ngayxuatbenInputDateTime =
                                                              date;
                                                          ngayxuatbenInputController
                                                              .text = DateFormat(
                                                                  'yyyy/MM/dd')
                                                              .format(
                                                                  ngayxuatbenInputDateTime);
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Tên nguyên liệu",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DropdownButtonFormField<int>(
                                                    value: selectedProductId,
                                                    items: List.generate(
                                                      productsnapshot
                                                          .requireData.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                        value: productsnapshot
                                                            .requireData[index]
                                                            .sanphamId,
                                                        child: Text(
                                                            productsnapshot
                                                                .requireData[
                                                                    index]
                                                                .tensanpham),
                                                      ),
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                            // errorText: categoryIdInputError,
                                                            ),
                                                    onChanged: (value) {
                                                      if (value != null) {
                                                        setState(() {
                                                          selectedProductId =
                                                              value;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Tên người bán",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DropdownButtonFormField<int>(
                                                    value: selectedKhachHangId,
                                                    items: List.generate(
                                                      khachhangsnapshot
                                                          .requireData.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                        value: khachhangsnapshot
                                                            .requireData[index]
                                                            .khachhangId,
                                                        child: Text(
                                                            khachhangsnapshot
                                                                .requireData[
                                                                    index]
                                                                .ten),
                                                      ),
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                            // errorText: categoryIdInputError,
                                                            ),
                                                    onChanged: (value) {
                                                      if (value != null) {
                                                        setState(() {
                                                          selectedKhachHangId =
                                                              value;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Số hợp đồng",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DropdownButtonFormField<int>(
                                                    value: selectedMSLId,
                                                    items: List.generate(
                                                      masolosnapshot
                                                          .requireData.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                        value: masolosnapshot
                                                            .requireData[index]
                                                            .masoloId,
                                                        child: Text(
                                                            masolosnapshot
                                                                .requireData[
                                                                    index]
                                                                .masolo),
                                                      ),
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                            // errorText: categoryIdInputError,
                                                            ),
                                                    onChanged: (value) {
                                                      if (value != null) {
                                                        setState(() {
                                                          selectedMSLId = value;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Địa chỉ vùng",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        diachivungController,
                                                    decoration: InputDecoration(
                                                      // labelText: "Địa chỉ vùng",
                                                      errorText:
                                                          descriptionInputError,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Đại diện phương tiện",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        daidienphuongtienController,
                                                    decoration: InputDecoration(
                                                      // labelText: "Đại diện phương tiện",
                                                      errorText:
                                                          descriptionInputError,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Số lượng",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        soluongController,
                                                    decoration: InputDecoration(
                                                      // labelText: "Đại diện phương tiện",
                                                      errorText:
                                                          descriptionInputError,
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Số phương tiện",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    child:
                                                        DropdownButtonFormField<
                                                            int>(
                                                      value:
                                                          secletedPhuongTienId,
                                                      items: List.generate(
                                                        snapshot
                                                            .requireData.length,
                                                        (index) =>
                                                            DropdownMenuItem(
                                                          value: snapshot
                                                              .requireData[
                                                                  index]
                                                              .phuongtienId,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .requireData[
                                                                        index]
                                                                    .sophuongtien,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              Text(
                                                                ' tải trọng:${snapshot.requireData[index].taitrong}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      decoration: InputDecoration(
                                                          // errorText: categoryIdInputError,
                                                          ),
                                                      onChanged: (value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            secletedPhuongTienId =
                                                                value;
                                                            final selectedtaitrong =
                                                                snapshot
                                                                    .requireData
                                                                    .firstWhere(
                                                              (item) =>
                                                                  item.taitrong ==
                                                                  value,
                                                            );
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Trình trạng vệ sinh:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        tinhtrangvesinhController,
                                                    decoration: InputDecoration(
                                                      // labelText: "Địa chỉ vùng",
                                                      errorText:
                                                          descriptionInputError,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 8, 8, 8),
                                                    child: Text(
                                                      "Địa chỉ vùng",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        baoquanController,
                                                    decoration: InputDecoration(
                                                      // labelText: "Địa chỉ vùng",
                                                      errorText:
                                                          descriptionInputError,
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
                                                onPressed: create,
                                                child: const Text("Tạo mới"),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: update,
                                                child: const Text("Cập nhật"),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
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
                              });
                        });
                  });
            }));
  }

  void update() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (diachivungController.text.isEmpty ||
          daidienphuongtienController.text.isEmpty ||
          tinhtrangvesinhController.text.isEmpty ||
          baoquanController.text.isEmpty ||
          soluongController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        return; // Ném ngoại lệ
      }
    });
    // if (int.parse(selectedtaitrong.toString()) <
    //     int.parse(soluongController.text)) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content:
    //           Text('Vui lòng chọn phương tiện khác có tải trọng lớn hơn'),
    //     ),
    //   );
    //   return;
    // }
    // In các giá trị trước khi gọi API
    // if (int.parse(soluongController.text) >= selectedtaitrong!) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Nhập khối lượng lúa khô < khối lượng sấy <= KLCL'),
    //     ),
    //   );

    //   return;
    // }

    _updatePhieuDieuPhuongTienFuture = phieudieuphuongtien_api.update(
      id: widget.phieudieuphuongtien.phieudieuphuongtienId,
      phuongtienId: secletedPhuongTienId!,
      sanphamId: selectedProductId!,
      ngayxuatben: ngayxuatbenInputDateTime,
      masoloId: selectedMSLId!,
      khachhangId: selectedKhachHangId!,
      tinhtrang: tinhtrangvesinhController.text,
      baoquan: baoquanController.text,
      diachivung: diachivungController.text,
      soluong: soluongController.text,
      daidienphuongtien: daidienphuongtienController.text,
    );

    _updatePhieuDieuPhuongTienFuture?.then((value) {
      if (value != null) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật phiếu điều phương tiện thành công'),
          ),
        );
      }
    });
  }

  void create() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (diachivungController.text.isEmpty ||
            daidienphuongtienController.text.isEmpty ||
            tinhtrangvesinhController.text.isEmpty ||
            baoquanController.text.isEmpty ||
            soluongController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin tạo mới'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
      });
      DateTime ngay =
          DateFormat('yyyy/MM/dd').parse(ngayxuatbenInputController.text);
      _createPhieuDieuPhuongTienFuture = phieudieuphuongtien_api.create(
        phuongtienId: secletedPhuongTienId!,
        sanphamId: selectedProductId!,
        ngayxuatben: ngay,
        masoloId: selectedMSLId!,
        khachhangId: selectedKhachHangId!,
        tinhtrang: tinhtrangvesinhController.text,
        baoquan: baoquanController.text,
        diachivung: diachivungController.text,
        soluong: soluongController.text,
        daidienphuongtien: daidienphuongtienController.text,
      );

      // print('phuongtienId: $secletedPhuongTienId');
      // print('sanphamId: $selectedKhachHangId');
      // print('ngayxuatben: $ngayxuatbenInputDateTime');
      // print('masoloId: $selectedMSLId');
      // print('khachhangId: $selectedKhachHangId');
      // print('tinhtrang: ${tinhtrangvesinhController.text}');
      // print('baoquan: ${baoquanController.text}');
      // print('diachivung: ${diachivungController.text}');
      // print('soluong: ${soluongController.text}');
      // print('daidienphuongtien: ${daidienphuongtienController.text}');
      _createPhieuDieuPhuongTienFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tạo phiếu điều phương tiện thành công'),
            ),
          );
        }
      });
    } catch (e) {
      // Xử lý ngoại lệ
      print('Đã xảy ra một ngoại lệ: $e');
      // Có thể hiển thị thông báo lỗi cho người dùng hoặc thực hiện các hành động khác tùy ý
    }
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
        _deletePhieuDieuPhuongTienFuture = phieudieuphuongtien_api.delete(
          id: widget.phieudieuphuongtien.phieudieuphuongtienId,
        );

        _deletePhieuDieuPhuongTienFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa phiếu điều số ${widget.phieudieuphuongtien.phieudieuphuongtienId} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
