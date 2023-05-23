// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/apis/laubong_api.dart';
import 'package:warehouse/apis/nhaplo_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/models/nhaplo_model.dart';
import 'package:warehouse/view/masolo/masolo_update_page.dart';

import '../../../apis/masolo_api.dart';
import '../../../apis/product_api.dart';
import '../../../models/laubong_api.dart';
import '../../../models/masolo_model.dart';
import '../../../models/phuongtien_modell.dart';
import '../../../models/product_model.dart';
import '../../phuongtien/phieudieuphuongtien_update.dart';

class LauBongUpdate extends StatefulWidget {
  const LauBongUpdate({super.key, required this.laubongid});

  final LauBongModel laubongid;

  @override
  State<LauBongUpdate> createState() => _LauBongUpdateState();
}

class _LauBongUpdateState extends State<LauBongUpdate> {
  final LauBongApi laubongid_api = LauBongApi();

  final MaSoLoApi _MaSoLoApi = MaSoLoApi();

  Future<List<MaSoLoModel>>? getMaSoLoListFuture;
  Future<bool?>? _updateLauBongFuture;
  Future<bool?>? _createLaubongFuture;
  Future<bool?>? _deleteLauBongFuture;

  TextEditingController thoidiemkiemtraInputController =
      TextEditingController();
  TextEditingController doamInputController = TextEditingController();
  TextEditingController tamInputController = TextEditingController();
  TextEditingController hatphanInputController = TextEditingController();
  TextEditingController hathuInputController = TextEditingController();
  TextEditingController hatvangInputController = TextEditingController();
  TextEditingController hatxanhnonInputController = TextEditingController();
  TextEditingController hatdoInputController = TextEditingController();
  TextEditingController hatnepInputController = TextEditingController();
  TextEditingController thocInputController = TextEditingController();
  TextEditingController tapchatInputController = TextEditingController();
  TextEditingController hatlanloaiInputController = TextEditingController();
  TextEditingController nguoivanhanhInputController = TextEditingController();
  TextEditingController mucxattrangInputController = TextEditingController();
  TextEditingController mucdanhbongInputController = TextEditingController();
  TextEditingController dothuanInputController = TextEditingController();
  TextEditingController nbq1InputController = TextEditingController();
  TextEditingController kl1InputController = TextEditingController();
  TextEditingController nbq2InputController = TextEditingController();
  TextEditingController kl2InputController = TextEditingController();
  TextEditingController nbq3InputController = TextEditingController();
  TextEditingController kl3InputController = TextEditingController();
  TextEditingController nbq4InputController = TextEditingController();
  TextEditingController kl4InputController = TextEditingController();
  TextEditingController nbq5InputController = TextEditingController();
  TextEditingController kl5InputController = TextEditingController();
  TextEditingController mslgaotrangInputController = TextEditingController();
  TextEditingController msltamInputController = TextEditingController();
  TextEditingController msltammaiInputController = TextEditingController();
  TextEditingController mslcamInputController = TextEditingController();

  TextEditingController masoloInputConntroller = TextEditingController();
  // TextEditingController khoiluongnguyenlieuInputController =TextEditingController();
  // TextEditingController noibaoquannlInputController = TextEditingController();
  // TextEditingController masolotpInputController = TextEditingController();
  // TextEditingController phantramtamtpInputController = TextEditingController();
  // TextEditingController khoiluongtpInputController = TextEditingController();
  // TextEditingController noibaoquanthanhphamInputController =
  //     TextEditingController();

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
    thoidiemkiemtraInputController.text = widget.laubongid.tgkiemtra;
    selectedMSLId = widget.laubongid.masoloId;
    doamInputController.text = widget.laubongid.doam.toString();
    tamInputController.text = widget.laubongid.tam.toString();
    hatphanInputController.text = widget.laubongid.hatphan.toString();
    hathuInputController.text = widget.laubongid.hathu.toString();
    hatvangInputController.text = widget.laubongid.hatvang.toString();
    hatxanhnonInputController.text = widget.laubongid.hatxanhnon.toString();
    hatdoInputController.text = widget.laubongid.hatdo.toString();
    hatnepInputController.text = widget.laubongid.hatnep.toString();
    thocInputController.text = widget.laubongid.thoc.toString();
    tapchatInputController.text = widget.laubongid.tapchat.toString();
    hatlanloaiInputController.text = widget.laubongid.hatlanloai.toString();
    nguoivanhanhInputController.text = widget.laubongid.nguoivanhanh.toString();
    mucxattrangInputController.text = widget.laubongid.mucxattrang.toString();
    mucdanhbongInputController.text = widget.laubongid.mucdanhbong.toString();
    dothuanInputController.text = widget.laubongid.dothuan.toString();
    masoloInputConntroller.text = widget.laubongid.masoloId.toString();
    nbq1InputController.text = widget.laubongid.nbq1;
    nbq2InputController.text = widget.laubongid.nbq2;
    nbq3InputController.text = widget.laubongid.nbq3;
    nbq4InputController.text = widget.laubongid.nbq4;
    nbq5InputController.text = widget.laubongid.nbq5;
    kl1InputController.text = widget.laubongid.kl1;
    kl2InputController.text = widget.laubongid.kl2;
    kl3InputController.text = widget.laubongid.kl3;
    kl4InputController.text = widget.laubongid.kl4;
    kl5InputController.text = widget.laubongid.kl5;
    mslgaotrangInputController.text = widget.laubongid.masologaotrang;
    msltamInputController.text = widget.laubongid.masolotam;
    msltammaiInputController.text = widget.laubongid.masolootammai;
    mslcamInputController.text = widget.laubongid.cam;

    // ngayxuatbenInputDateTime = widget.laubongid.ngay;
    // ngayxuatbenInputController = TextEditingController.fromValue(
    //   TextEditingValue(
    //     text: DateFormat('yyyy/MM/dd').format(ngayxuatbenInputDateTime),
    //   ),
    // );
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
        title: const Text("Báo cáo lau bóng"),
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
                              // TableRow(
                              //   children: [
                              //     const Padding(
                              //       padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                              //       child: Text(
                              //         "Ngày:",
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     TextFormField(
                              //       controller: thoidiemkiemtraInputController,
                              //     ),
                              //   ],
                              // ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Container(
                                      height: 50,
                                      child: const Text(
                                        "Mã số lô gạo xô:",
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
                                      "Nơi bảo quản:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nbq1InputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Khối lượng gạo xô:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: kl1InputController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ],
                              ),

                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mã số lô gạo trắng:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mslgaotrangInputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "khối lượng gạo trắng:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: kl2InputController,
                                    keyboardType: TextInputType.number,
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
                                    controller: nbq2InputController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mã số lô tấm:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: msltamInputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Khối lượng tấm:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: kl3InputController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
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
                                    controller: nbq3InputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mã số lô tấm mài:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: msltammaiInputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "khối lượng tấm mài:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: kl4InputController,
                                    keyboardType: TextInputType.number,
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
                                    controller: nbq4InputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),

                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mã số lô cám:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mslcamInputController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Khối lượng cám:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: kl5InputController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                  ),
                                ],
                              ),

                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Độ ẩm %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: doamInputController,
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
                                      "Tấm %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: tamInputController,
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
                                      "Hạt phấn %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatphanInputController,
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
                                      "Hạt hư %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hathuInputController,
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
                                      "Hạt vàng %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatvangInputController,
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
                                      "Hạt xanh non %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatxanhnonInputController,
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
                                      "Hạt đỏ %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatdoInputController,
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
                                      "Tạp chất %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: tapchatInputController,
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
                                      "Hạt nếp %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatnepInputController,
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
                                      "Thóc %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: thocInputController,
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
                                      "Hạt lẫn loại %:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: hatlanloaiInputController,
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
                                      "Độ thuần: %",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: dothuanInputController,
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
                                      "Người vận hành:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nguoivanhanhInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mức đánh bóng:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mucdanhbongInputController,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: Text(
                                      "Mức xát trắng:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mucxattrangInputController,
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

  void update() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (mslcamInputController.text.isEmpty ||
          mslgaotrangInputController.text.isEmpty ||
          msltamInputController.text.isEmpty ||
          msltammaiInputController.text.isEmpty ||
          kl1InputController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        return;
      }
    });

    // In các giá trị trước khi gọi API

    _updateLauBongFuture = laubongid_api.update(
      id: widget.laubongid.baocaogiamsatlaubongId,
      masoloId: selectedMSLId!,
      kl1: kl1InputController.text,
      kl2: kl2InputController.text,
      kl3: kl3InputController.text,
      kl4: kl4InputController.text,
      kl5: kl5InputController.text,
      nbq1: nbq1InputController.text,
      nbq2: nbq2InputController.text,
      nbq3: nbq3InputController.text,
      nbq4: nbq4InputController.text,
      nbq5: nbq5InputController.text,
      masologaotrang: mslgaotrangInputController.text,
      masolotam: msltamInputController.text,
      masolootammai: msltammaiInputController.text,
      cam: mslcamInputController.text,
      tgkiemtra: thoidiemkiemtraInputController.text,
      doam: int.parse(doamInputController.text),
      tam: int.parse(tamInputController.text),
      hathu: int.parse(hathuInputController.text),
      hatvang: int.parse(hatvangInputController.text),
      hatphan: int.parse(hatphanInputController.text),
      hatxanhnon: int.parse(hatxanhnonInputController.text),
      hatdo: int.parse(hatdoInputController.text),
      tapchat: int.parse(tapchatInputController.text),
      thoc: int.parse(thocInputController.text),
      hatnep: int.parse(hatnepInputController.text),
      hatlanloai: int.parse(hatlanloaiInputController.text),
      nguoivanhanh: nguoivanhanhInputController.text,
      mucxattrang: mucdanhbongInputController.text,
      mucdanhbong: mucdanhbongInputController.text,
      dothuan: int.parse(dothuanInputController.text),
    );

    _updateLauBongFuture?.then((value) {
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
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (mslcamInputController.text.isEmpty ||
          mslgaotrangInputController.text.isEmpty ||
          msltamInputController.text.isEmpty ||
          msltammaiInputController.text.isEmpty ||
          kl1InputController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin tạo mới'),
          ),
        );
        return;
      }
    });
    _createLaubongFuture = laubongid_api.create(
      masoloId: selectedMSLId!,
      kl1: kl1InputController.text,
      kl2: kl2InputController.text,
      kl3: kl3InputController.text,
      kl4: kl4InputController.text,
      kl5: kl5InputController.text,
      nbq1: nbq1InputController.text,
      nbq2: nbq2InputController.text,
      nbq3: nbq3InputController.text,
      nbq4: nbq4InputController.text,
      nbq5: nbq5InputController.text,
      masologaotrang: mslgaotrangInputController.text,
      masolotam: msltamInputController.text,
      masolootammai: msltammaiInputController.text,
      cam: mslcamInputController.text,
      tgkiemtra: thoidiemkiemtraInputController.text,
      doam: int.parse(doamInputController.text),
      tam: int.parse(tamInputController.text),
      hathu: int.parse(hathuInputController.text),
      hatvang: int.parse(hatvangInputController.text),
      hatphan: int.parse(hatphanInputController.text),
      hatxanhnon: int.parse(hatxanhnonInputController.text),
      hatdo: int.parse(hatdoInputController.text),
      tapchat: int.parse(tapchatInputController.text),
      thoc: int.parse(thocInputController.text),
      hatnep: int.parse(hatnepInputController.text),
      hatlanloai: int.parse(hatlanloaiInputController.text),
      nguoivanhanh: nguoivanhanhInputController.text,
      mucxattrang: mucdanhbongInputController.text,
      mucdanhbong: mucdanhbongInputController.text,
      dothuan: int.parse(dothuanInputController.text),
    );
    _createLaubongFuture?.then((value) {
      if (value == true) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã tạo mới mẫu nhập lô'),
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
        _deleteLauBongFuture = laubongid_api.delete(
          id: widget.laubongid.baocaogiamsatlaubongId,
        );

        _deleteLauBongFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã xóa báo cáo lau bóng thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
