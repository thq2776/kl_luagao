// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/apis/nhaplo_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/models/nhaplo_model.dart';
import 'package:warehouse/view/masolo/masolo_update_page.dart';

import '../../../apis/masolo_api.dart';
import '../../../apis/product_api.dart';
import '../../../models/masolo_model.dart';
import '../../../models/phuongtien_modell.dart';
import '../../../models/product_model.dart';
import '../../phuongtien/phieudieuphuongtien_update.dart';

class NhapLoUpdate extends StatefulWidget {
  const NhapLoUpdate({super.key, required this.nhaploid});

  final NhapLoModel nhaploid;

  @override
  State<NhapLoUpdate> createState() => _NhapLoUpdateState();
}

class _NhapLoUpdateState extends State<NhapLoUpdate> {
  final NhapLoApi nhaploid_api = NhapLoApi();
  final NhapLoApi phuongtien_api = NhapLoApi();
  final ProductApi _productApi = ProductApi();
  final MaSoLoApi _MaSoLoApi = MaSoLoApi();
  final KhachHangApi _KhachHangApi = KhachHangApi();

  Future<List<MaSoLoModel>>? getMaSoLoListFuture;
  Future<bool?>? _updateNhapLoFuture;
  Future<bool?>? _createNhapLoFuture;
  Future<bool?>? _deleteNhapLoFuture;

  TextEditingController thoidiemkiemtraInputController =
      TextEditingController();
  TextEditingController phantramtamnlInputController = TextEditingController();
  TextEditingController masoloInputConntroller = TextEditingController();
  TextEditingController khoiluongnguyenlieuInputController =
      TextEditingController();
  TextEditingController noibaoquannlInputController = TextEditingController();
  TextEditingController masolotpInputController = TextEditingController();
  TextEditingController phantramtamtpInputController = TextEditingController();
  TextEditingController khoiluongtpInputController = TextEditingController();
  TextEditingController noibaoquanthanhphamInputController =
      TextEditingController();

  String? nameInputError;
  String? descriptionInputError;
  int? secletedPhuongTienId;
  int? selectedProductId;
  int? selectedMSLId;
  int? selectedKhachHangId;
  String? dropdownValue;
  int? selectedKLCL;
  late DateTime ngayxuatbenInputDateTime;
  late TextEditingController ngayxuatbenInputController;

  @override
  void initState() {
    super.initState();
    thoidiemkiemtraInputController.text = widget.nhaploid.thoidiemkiemtra;
    selectedMSLId = widget.nhaploid.masoloId;
    phantramtamnlInputController.text = widget.nhaploid.phantramtamnl;
    khoiluongnguyenlieuInputController.text =
        widget.nhaploid.khoiluongnl.toString();
    noibaoquannlInputController.text = widget.nhaploid.noibaoquannl;
    masolotpInputController.text = widget.nhaploid.masolotp;
    phantramtamtpInputController.text = widget.nhaploid.phantramtamtp;
    khoiluongtpInputController.text = widget.nhaploid.khoiluongtp.toString();
    noibaoquanthanhphamInputController.text = widget.nhaploid.noibaoquantp;

    ngayxuatbenInputDateTime = widget.nhaploid.ngay;
    ngayxuatbenInputController = TextEditingController.fromValue(
      TextEditingValue(
        text: DateFormat('yyyy/MM/dd').format(ngayxuatbenInputDateTime),
      ),
    );
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
        title: const Text("Báo cáo nhập lô"),
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
            List<DropdownMenuItem<int>> filteredItems =
                masolosnapshot.requireData
                    .where((item) => item.khoiluong - item.khoiluongdadung >= 0
                        //  &&
                        // item.masolo.endsWith('ss')
                        )
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

            return Column(
              children: [
                SizedBox(
                  height: 650,
                  child: SingleChildScrollView(
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
                                      "Ngày:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: ngayxuatbenInputController,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                        // labelText: "Ngày xuất bến",
                                        // errorText: descriptionInputError,
                                        ),
                                    onTap: () async {
                                      DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: ngayxuatbenInputDateTime,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );

                                      if (date != null) {
                                        setState(() {
                                          ngayxuatbenInputDateTime = date;
                                          ngayxuatbenInputController.text =
                                              DateFormat('yyyy/MM/dd').format(
                                                  ngayxuatbenInputDateTime);
                                        });
                                      }
                                    },
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
                                      isExpanded: true,
                                      items: filteredItems,
                                      decoration: const InputDecoration(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedMSLId = value;
                                            final selectedMasolo =
                                                masolosnapshot.requireData
                                                    .firstWhere(
                                              (item) => item.masoloId == value,
                                            );
                                            selectedKLCL =
                                                selectedMasolo != null
                                                    ? selectedMasolo.khoiluong -
                                                        selectedMasolo
                                                            .khoiluongdadung
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
                                      "% tấm nguyên liệu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: phantramtamnlInputController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .digitsOnly, // Chỉ cho phép nhập số
                                    ],
                                    onChanged: (value) {
                                      int? inputValue = int.tryParse(value);
                                      if (inputValue != null &&
                                          inputValue >= 100) {
                                        setState(() {
                                          descriptionInputError =
                                              'Vui lòng nhập số nhỏ hơn 100';
                                        });
                                      } else {
                                        setState(() {
                                          descriptionInputError = null;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
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
                                      "Khối lượng nguyên liệu:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                          khoiluongnguyenlieuInputController
                                              .text);
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
                                                  'Vui lòng nhập khối lượng nguyên liệu nhỏ hơn khối lượng còn lại'),
                                            ),
                                          );
                                        });
                                      }
                                    },
                                    controller:
                                        khoiluongnguyenlieuInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Khối lượng thành phẩm:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .digitsOnly, // Chỉ cho phép nhập số
                                    ],
                                    controller: khoiluongtpInputController,
                                    onChanged: (value) {
                                      int? khoiluongnguyenlieu = int.tryParse(
                                          khoiluongnguyenlieuInputController
                                              .text);
                                      int? khoiluongtp = int.tryParse(value);
                                      if (khoiluongnguyenlieu != null &&
                                          khoiluongtp != null &&
                                          khoiluongtp >= khoiluongnguyenlieu) {
                                        setState(() {
                                          // Hiển thị thông báo hoặc sử dụng SnackBar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Vui lòng nhập khối lượng thành phẩm nhỏ hơn khối lượng nguyên liệu'),
                                            ),
                                          );
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
                                      "Nơi bảo quản:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: noibaoquannlInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mã lô thành phẩm;",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: masolotpInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "% tấm thành phẩm:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType
                                        .number, // Chỉ cho phép nhập số
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .digitsOnly, // Chỉ cho phép nhập số
                                    ],
                                    controller: phantramtamtpInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Nơi bảo quản tp:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller:
                                        noibaoquanthanhphamInputController,
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
                                child: const Text("Tạo"),
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
                  )),
                ),
              ],
            );
          }),
    );
  }

  // void update() {
  //   try {
  //     // Kiểm tra giá trị đầu vào
  //     setState(() {
  //       if (khoiluongnguyenlieuInputController.text.isEmpty ||
  //           noibaoquannlInputController.text.isEmpty ||
  //           phantramtamtpInputController.text.isEmpty ||
  //           noibaoquanthanhphamInputController.text.isEmpty ||
  //           masolotpInputController.text.isEmpty) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Vui lòng nhập đầy đủ thông tin'),
  //           ),
  //         );
  //         throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
  //       }
  //     });

  //     // In các giá trị trước khi gọi API

  //     _updateNhapLoFuture = nhaploid_api.update(
  //       id: widget.nhaploid.nhaploidId,
  //       phuongtienId: secletedPhuongTienId!,
  //       sanphamId: selectedProductId!,
  //       ngayxuatben: ngayxuatbenInputDateTime,
  //       masoloId: selectedMSLId!,
  //       khachhangId: selectedKhachHangId!,
  //       tinhtrang: phantramtamtpInputController.text,
  //       baoquan: noibaoquanthanhphamInputController.text,
  //       diachivung: khoiluongnguyenlieuInputController.text,
  //       soluong: masolotpInputController.text,
  //       daidienphuongtien: noibaoquannlInputController.text,
  //     );

  //     _updateNhapLoFuture?.then((value) {
  //       if (value != null) {
  //         Navigator.of(context).pop(true);
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Cập nhật phiếu điều phương tiện thành công'),
  //           ),
  //         );
  //       }
  //     });
  //   } catch (e) {
  //     // Xử lý ngoại lệ
  //     print('Đã xảy ra một ngoại lệ: $e');
  //     // Có thể hiển thị thông báo lỗi cho người dùng hoặc thực hiện các hành động khác tùy ý
  //   }
  // }

  void create() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (phantramtamnlInputController.text.isEmpty ||
            phantramtamtpInputController.text.isEmpty ||
            khoiluongnguyenlieuInputController.text.isEmpty ||
            noibaoquannlInputController.text.isEmpty ||
            khoiluongtpInputController.text.isEmpty ||
            noibaoquanthanhphamInputController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin tạo mới'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
      });
      _MaSoLoApi.updateKLSD(
          id: selectedMSLId!,
          khoiluong: int.parse(khoiluongnguyenlieuInputController.text));
//tạo lô mới sau sấy dựa trên số lô sau sấy
      _MaSoLoApi.create(
          loaisanpham: 556,
          ten: "Lô sau khi nhập của lô",
          trangthai: "Hoạt động",
          masolo: "${masolotpInputController.text}snl",
          khoiluong: int.parse(
            khoiluongtpInputController.text,
          ),
          khoiluongdadung: 0,
          mota: "Lô đã sấy");
      DateTime ngay =
          DateFormat('yyyy/MM/dd').parse(ngayxuatbenInputController.text);
      _createNhapLoFuture = nhaploid_api.create(
          ngay: ngay,
          masoloId: selectedMSLId!,
          thoidiemkiemtra: thoidiemkiemtraInputController.text,
          phantramtamnl: phantramtamnlInputController.text,
          khoiluongnl: int.parse(khoiluongnguyenlieuInputController.text),
          noibaoquannl: noibaoquannlInputController.text,
          masolotp: masolotpInputController.text,
          phantramtamtp: phantramtamtpInputController.text,
          khoiluongtp: int.parse(khoiluongtpInputController.text),
          noibaoquantp: noibaoquannlInputController.text);

      _createNhapLoFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã tạo mới mẫu nhập lô'),
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
        _deleteNhapLoFuture = nhaploid_api.delete(
          id: widget.nhaploid.baocaogiamsatnhaploId,
        );

        _deleteNhapLoFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa báo cáo nhập lô${widget.nhaploid.baocaogiamsatnhaploId} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
