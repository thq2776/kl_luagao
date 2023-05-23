// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/apis/bcgstiepnhan_api.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/apis/masolo_api.dart';
import 'package:warehouse/apis/phuongtien_api.dart';
import 'package:warehouse/models/bcgstiepnhan_model.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/models/masolo_model.dart';
import 'package:warehouse/models/phuongtien_modell.dart';
import 'package:warehouse/view/customer/customer_list_page.dart';
import '../../../apis/product_category_api.dart';
import '../../../models/product_category_model.dart';

class BcGsTiepNhanupdatepage extends StatefulWidget {
  const BcGsTiepNhanupdatepage({super.key, required this.bcgstiepnhan});

  final BcGsTiepNhanModel bcgstiepnhan;

  @override
  State<BcGsTiepNhanupdatepage> createState() => _BcGsTiepNhanupdatepageState();
}

class _BcGsTiepNhanupdatepageState extends State<BcGsTiepNhanupdatepage> {
  final BcGsTiepNhanApi _api = BcGsTiepNhanApi();
  final MaSoLoApi _MSLapi = MaSoLoApi();

  Future<bool>? _createBcGsTiepnhanFuture;
  Future<bool>? _updateBcgsTiepNhanFuture;
  Future<bool?>? _deleteBcgsTiepNhanFuture;
//khóa ngoại
  Future<List<BcGsTiepNhanModel>>? _getBcgsTiepNhanFuture;

  Future<List<ProductCategoryModel>>? _getProductCategoryListFuture;
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();
  Future<List<KhachHangModel>>? _getCustomerListFuture;
  final KhachHangApi _productKhachHangApi = KhachHangApi();
  Future<List<MaSoLoModel>>? _getMSLListFuture;
  final MaSoLoApi _MaSoLoApi = MaSoLoApi();

  TextEditingController customerInPutController = TextEditingController();
  TextEditingController loaisanphamInPutController = TextEditingController();
  TextEditingController diachiInputController = TextEditingController();
  TextEditingController khoiluongInpuutController = TextEditingController();
  TextEditingController kiemtraphuongtienInpuutController =
      TextEditingController();
  TextEditingController hosotrongtrotInpuutController = TextEditingController();
  TextEditingController hosocamkeInpuutController = TextEditingController();
  TextEditingController chungnhanInpuutController = TextEditingController();
  TextEditingController doamInpuutController = TextEditingController();
  TextEditingController tamInpuutController = TextEditingController();
  TextEditingController tapchatInpuutController = TextEditingController();
  TextEditingController hatnguyenInpuutController = TextEditingController();
  TextEditingController hathuInpuutController = TextEditingController();
  TextEditingController hatvangInpuutController = TextEditingController();
  TextEditingController hatbacphanInpuutController = TextEditingController();
  TextEditingController ketluanInpuutController = TextEditingController();
  TextEditingController thoigiantiepnhanInpuutController =
      TextEditingController();

  TextEditingController idInPutController = TextEditingController();
  late TextEditingController ngayInputController = TextEditingController();
  late DateTime ngayInputDateTime;

  String? selectmasolo;
  DateTime? selectedDate;
  int? selectedCategoryId;
  int? selectedPhuongTienId;
  int? selectedCustomerId;
  int? selectedMSLId;
  String selectedValue = "Đạt";

  String? nameInputError;
  String? descriptionInputError;
  String? categoryIdInputError;
  // int selectedCustomerIdd = 0;
  String selectedCustomerAddress = ""; // Địa chỉ của khách hàng được chọn

  @override
  void initState() {
    super.initState();
    idInPutController.text =
        widget.bcgstiepnhan.bcgiamsattiepnhannguyenlieuId.toString();
    loaisanphamInPutController.text =
        widget.bcgstiepnhan.loaisanphamId.toString();
    customerInPutController.text = widget.bcgstiepnhan.khachhangId.toString();
    diachiInputController.text = widget.bcgstiepnhan.diachi;
    khoiluongInpuutController.text = widget.bcgstiepnhan.khoiluong.toString();
    kiemtraphuongtienInpuutController.text =
        widget.bcgstiepnhan.kiemtraphuongtien;
    hosotrongtrotInpuutController.text = widget.bcgstiepnhan.hosotrongtrot;
    hosocamkeInpuutController.text = widget.bcgstiepnhan.hosocamket;
    chungnhanInpuutController.text = widget.bcgstiepnhan.chungnhan;
    doamInpuutController.text = widget.bcgstiepnhan.doam.toString();
    tamInpuutController.text = widget.bcgstiepnhan.tam.toString();
    tapchatInpuutController.text = widget.bcgstiepnhan.tapchat.toString();
    hatnguyenInpuutController.text = widget.bcgstiepnhan.hatnguyen.toString();
    hathuInpuutController.text = widget.bcgstiepnhan.hathu.toString();
    hatvangInpuutController.text = widget.bcgstiepnhan.hatvang.toString();
    hatbacphanInpuutController.text = widget.bcgstiepnhan.hatbacphan.toString();
    ketluanInpuutController.text = widget.bcgstiepnhan.ketluan;
    thoigiantiepnhanInpuutController.text =
        widget.bcgstiepnhan.thoigiantiepnhan;

    selectedCategoryId = widget.bcgstiepnhan.loaisanphamId;
    selectedCustomerId = widget.bcgstiepnhan.khachhangId;
    selectedMSLId = widget.bcgstiepnhan.masoloId;
    ngayInputDateTime = widget.bcgstiepnhan.ngay;
    ngayInputController = TextEditingController.fromValue(
      TextEditingValue(
        text: DateFormat('yyyy/MM/dd').format(ngayInputDateTime),
      ),
    );
// Trạng thái hiển thị
    // getTOKhai();
    getMSLList();
    getProductCategoryList();

    getCustomerList();
  }

  // void _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picked != null &&
  //       picked != selectedDate &&
  //       picked != ngayInputDateTime) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  getMSLList() {
    setState(() {
      _getMSLListFuture = _MaSoLoApi.list();
    });
  }

  getProductCategoryList() {
    setState(() {
      _getProductCategoryListFuture = _productCategoryApi.list();
    });
  }

  getCustomerList() {
    setState(() {
      _getCustomerListFuture = _productKhachHangApi.list();
    });
  }

  List<Customerlist> customerList = []; // Danh sách khách hàng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'BCGS tiếp nhận số: ${widget.bcgstiepnhan.bcgiamsattiepnhannguyenlieuId.toString()}'),
        ),
        body: FutureBuilder<List<ProductCategoryModel>>(
            future: _getProductCategoryListFuture,
            builder: (context, productCategorySnapshot) {
              if (productCategorySnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (productCategorySnapshot.hasError) {
                return const Center(
                  child: Text(
                    "Có lỗi khi gọi dữ liệu loại sản phẩm, vui lòng thử lại",
                  ),
                );
              }

              if (productCategorySnapshot.requireData.isEmpty) {
                return const Center(
                  child: Text("Không có dữ liệu loại sản phẩm hiển thị"),
                );
              }

              return FutureBuilder<List<KhachHangModel>>(
                  future: _getCustomerListFuture,
                  builder: (context, customerSnapshot) {
                    if (customerSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (customerSnapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Có lỗi khi gọi dữ liệu phương tiện, vui lòng thử lại",
                        ),
                      );
                    }

                    if (customerSnapshot.requireData.isEmpty) {
                      return const Center(
                        child: Text("Không có dữ liệu phương tiện hiển thị"),
                      );
                    }
                    return FutureBuilder<List<MaSoLoModel>>(
                        future: _getMSLListFuture,
                        builder: (context, masoloSnapshot) {
                          if (masoloSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (masoloSnapshot.hasError) {
                            return const Center(
                              child: Text(
                                "Có lỗi khi gọi dữ liệu phương tiện, vui lòng thử lại",
                              ),
                            );
                          }

                          if (masoloSnapshot.requireData.isEmpty) {
                            return const Center(
                              child:
                                  Text("Không có dữ liệu phương tiện hiển thị"),
                            );
                          }

                          return FutureBuilder<List<KhachHangModel>>(
                              future: _getCustomerListFuture,
                              builder: (context, customerSnapshot) {
                                if (customerSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (customerSnapshot.hasError) {
                                  return const Center(
                                    child: Text(
                                      "Có lỗi khi gọi dữ liệu phương tiện, vui lòng thử lại",
                                    ),
                                  );
                                }

                                if (customerSnapshot.requireData.isEmpty) {
                                  return const Center(
                                    child: Text(
                                        "Không có dữ liệu phương tiện hiển thị"),
                                  );
                                }
                                // if (masoloSnapshot.requireData.isNotEmpty) {
                                //   selectmasolo =
                                //       masoloSnapshot.requireData[0].masolo;
                                // }
                                return SingleChildScrollView(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable(
                                    columnSpacing:
                                        16, // Khoảng cách giữa các cột
                                    columns: const [
                                      DataColumn(
                                          label:
                                              Text("Trường")), // Cột "Trường"
                                      DataColumn(
                                          label:
                                              Text("Giá trị")), // Cột "Giá trị"
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Khách hàng")), // Trường: Phương tiện
                                        DataCell(
                                          DropdownButtonFormField<int>(
                                            value: selectedCustomerId,
                                            items: List.generate(
                                              customerSnapshot
                                                  .requireData.length,
                                              (index) => DropdownMenuItem(
                                                value: customerSnapshot
                                                    .requireData[index]
                                                    .khachhangId,
                                                child: Text(customerSnapshot
                                                    .requireData[index].ten),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              // labelText: "Phương tiện",
                                              errorText: descriptionInputError,
                                              // suffixIcon: IconButton(
                                              //   onPressed: () async {
                                              //     bool? update =
                                              //         await Navigator.of(context).push(
                                              //       MaterialPageRoute(
                                              //         builder: (context) => Customerlist   (),
                                              //       ),
                                              //     );

                                              //     if (update == true) {

                                              //     }
                                              //   },
                                              //   icon: Icon(Icons.add),
                                              // ),
                                            ),
                                            onChanged: (value) {
                                              if (value != null) {
                                                setState(() {
                                                  selectedCustomerId = value;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Mã số lô:")), // Trường: Danh mục sản phẩm
                                        DataCell(
                                          DropdownButtonFormField<int>(
                                            value: selectedMSLId,
                                            items: List.generate(
                                              masoloSnapshot.requireData.length,
                                              (index) => DropdownMenuItem(
                                                value: masoloSnapshot
                                                    .requireData[index]
                                                    .masoloId,
                                                child: Text(masoloSnapshot
                                                    .requireData[index].masolo),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              errorText: categoryIdInputError,
                                            ),
                                            onChanged: (value) {
                                              if (value != null) {
                                                setState(() {
                                                  selectedMSLId = value;
                                                  // selectmasolo = masoloSnapshot
                                                  //     .requireData[value].masolo
                                                  //     .toString();
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Loại nguyên liệu;")), // Trường: Danh mục sản phẩm
                                        DataCell(
                                          DropdownButtonFormField<int>(
                                            value: selectedCategoryId,
                                            items: List.generate(
                                              productCategorySnapshot
                                                  .requireData.length,
                                              (index) => DropdownMenuItem(
                                                value: productCategorySnapshot
                                                    .requireData[index]
                                                    .loaisanphamId,
                                                child: Text(
                                                    productCategorySnapshot
                                                        .requireData[index]
                                                        .tenloai),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              errorText: categoryIdInputError,
                                            ),
                                            onChanged: (value) {
                                              if (value != null) {
                                                setState(() {
                                                  selectedCategoryId = value;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text("Địa chỉ")), //
                                        DataCell(
                                          TextFormField(
                                            controller: diachiInputController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Khối lượng")), // Trường: Vùng nguyên liệu
                                        DataCell(
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                            controller:
                                                khoiluongInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Kiểm tra phương tiện")), // Trường: Vùng nguyên liệu
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                kiemtraphuongtienInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hồ sơ trồng trọt")), // Trường: Vùng nguyên liệu
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                hosotrongtrotInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hồ sơ cam kết:")), // Trường: Vùng nguyên liệu
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                hosocamkeInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Chứng nhận CoA:")), // Trường: Vùng nguyên liệu
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                chungnhanInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Độ ẩm:")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: doamInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(
                                            Text("Tấm:")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: tamInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Tạp chất:")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: tapchatInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hạt nguyên:")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                hatnguyenInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hạt hư: ")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: hathuInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hạt vàng: ")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: hatvangInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Hạt bạc phấn; ")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                hatbacphanInpuutController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Kết luận:)")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller: ketluanInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text(
                                            "Khoảng thời gian nhận:")), // Trường: Khối lượng
                                        DataCell(
                                          TextFormField(
                                            controller:
                                                thoigiantiepnhanInpuutController,
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(Text("Ngày")),
                                        DataCell(
                                          TextFormField(
                                            controller: ngayInputController,
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: ngayInputDateTime,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                              );

                                              if (date != null) {
                                                setState(() {
                                                  ngayInputDateTime = date;
                                                  ngayInputController
                                                      .text = DateFormat(
                                                          'yyyy/MM/dd')
                                                      .format(
                                                          ngayInputDateTime);
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        const DataCell(
                                            Text("")), // Trường: (trống)
                                        DataCell(
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
                                                  onPressed: update,
                                                  child: const Text("Cập nhật"),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                  ),
                                                  onPressed: delete,
                                                  child: const Text("Xóa"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                );
                              });
                        });
                  });
            }));
  }

  void update() async {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (diachiInputController.text.trim().isEmpty ||
          khoiluongInpuutController.text.trim().isEmpty ||
          kiemtraphuongtienInpuutController.text.trim().isEmpty ||
          hosocamkeInpuutController.text.trim().isEmpty ||
          hosotrongtrotInpuutController.text.trim().isEmpty ||
          chungnhanInpuutController.text.trim().isEmpty ||
          doamInpuutController.text.trim().isEmpty ||
          tamInpuutController.text.trim().isEmpty ||
          tapchatInpuutController.text.trim().isEmpty ||
          hatnguyenInpuutController.text.trim().isEmpty ||
          hathuInpuutController.text.trim().isEmpty ||
          hatvangInpuutController.text.trim().isEmpty ||
          hatbacphanInpuutController.text.trim().isEmpty ||
          ketluanInpuutController.text.trim().isEmpty ||
          thoigiantiepnhanInpuutController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
      }
    });
    //kiểm tra người dùng có thay đổi mã số lô hay không
    if (selectedMSLId != widget.bcgstiepnhan.masoloId) {
      final isDuplicateName = await _api.checkMSLIDname(selectedMSLId!);
      if (isDuplicateName) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lô đã được tiếp nhận'),
          ),
        );
        return;
      }
    }
    DateTime ngay = DateFormat('yyyy/MM/dd').parse(ngayInputController.text);

    _updateBcgsTiepNhanFuture = _api.update(
      id: widget.bcgstiepnhan.bcgiamsattiepnhannguyenlieuId,
      loaisanpham: selectedCategoryId!,
      khachhang: selectedCustomerId!,
      masolo: selectedMSLId!,
      diachi: diachiInputController.text,
      khoiluong: int.parse(khoiluongInpuutController.text),
      kiemtraphuongtien: kiemtraphuongtienInpuutController.text,
      hosotrongtrot: hosotrongtrotInpuutController.text,
      hosocamket: hosocamkeInpuutController.text,
      chungnhan: chungnhanInpuutController.text,
      doam: int.parse(doamInpuutController.text),
      tam: int.parse(tamInpuutController.text),
      tapchat: int.parse(tapchatInpuutController.text),
      hatnguyen: int.parse(hatnguyenInpuutController.text),
      hathu: int.parse(hathuInpuutController.text),
      hatvang: int.parse(hatvangInpuutController.text),
      hatbacphan: int.parse(hatbacphanInpuutController.text),
      ketluan: ketluanInpuutController.text,
      thoigiantiepnhan: thoigiantiepnhanInpuutController.text,
      ngay: ngay,
    );
    //truyền mã số lô id để lấy mã số lô
    final laymasolo = await _MaSoLoApi.checkMaSoLoDeLayMasolo(selectedMSLId!);
    print('msl: $laymasolo');
    _updateBcgsTiepNhanFuture?.then((value) {
      if (value == true) {
        _MSLapi.update(
            id: selectedMSLId!,
            khoiluong: int.parse(khoiluongInpuutController.text) -
                widget.bcgstiepnhan.khoiluong,
            loaisanpham: selectedCategoryId!,
            trangthai: "Hoạt động",
            ten: "Lô đã tiếp nhận",
            masolo: laymasolo.toString(),
            mota: "Lô đã được tiếp nhận",
            khoiluongdadung: 0);
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật thành công'),
          ),
        );
      }
    });
  }

  void create() async {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (diachiInputController.text.trim().isEmpty ||
          khoiluongInpuutController.text.trim().isEmpty ||
          kiemtraphuongtienInpuutController.text.trim().isEmpty ||
          hosocamkeInpuutController.text.trim().isEmpty ||
          hosotrongtrotInpuutController.text.trim().isEmpty ||
          chungnhanInpuutController.text.trim().isEmpty ||
          doamInpuutController.text.trim().isEmpty ||
          tamInpuutController.text.trim().isEmpty ||
          tapchatInpuutController.text.trim().isEmpty ||
          hatnguyenInpuutController.text.trim().isEmpty ||
          hathuInpuutController.text.trim().isEmpty ||
          hatvangInpuutController.text.trim().isEmpty ||
          hatbacphanInpuutController.text.trim().isEmpty ||
          ketluanInpuutController.text.trim().isEmpty ||
          thoigiantiepnhanInpuutController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        return;
      }
    });

    final isDuplicateName = await _api.checkMSLIDname(selectedMSLId!);
    if (isDuplicateName) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lô đã được tiếp nhận'),
        ),
      );
      return;
    }
    // _MSLapi.updateKL(
    //     id: selectedMSLId!,
    //     khoiluong: int.parse(khoiluongInpuutController.text));
    DateTime ngay = DateFormat('yyyy/MM/dd').parse(ngayInputController.text);
    // print('tokhaixuatxucamketId: ${widget.tokhai.tokhaixuatxucamketId}');
    // print('phuongtienId: $selectedPhuongTienId');
    // print('loaisanphamId: $selectedCategoryId');
    // print('customerId: $selectedCustomerId');
    // print('soluong: ${diachiInputController.text}');
    // print('vungnguyenlieu: ${vungnguyenlieuInputController.text}');
    // print('chatluongnguyenlieu: ${khoiluongInpuutController.text}');
    // print('ngay: $ngay');

    _createBcGsTiepnhanFuture = _api.create(
      loaisanpham: selectedCategoryId!,
      khachhang: selectedCustomerId!,
      masolo: selectedMSLId!,
      diachi: diachiInputController.text,
      khoiluong: int.parse(khoiluongInpuutController.text),
      kiemtraphuongtien: kiemtraphuongtienInpuutController.text,
      hosotrongtrot: hosotrongtrotInpuutController.text,
      hosocamket: hosocamkeInpuutController.text,
      chungnhan: chungnhanInpuutController.text,
      doam: int.parse(doamInpuutController.text),
      tam: int.parse(tamInpuutController.text),
      tapchat: int.parse(tapchatInpuutController.text),
      hatnguyen: int.parse(hatnguyenInpuutController.text),
      hathu: int.parse(hathuInpuutController.text),
      hatvang: int.parse(hatvangInpuutController.text),
      hatbacphan: int.parse(hatbacphanInpuutController.text),
      ketluan: ketluanInpuutController.text,
      thoigiantiepnhan: thoigiantiepnhanInpuutController.text,
      ngay: ngay,
    );
    final laymasolo = await _MaSoLoApi.checkMaSoLoDeLayMasolo(selectedMSLId!);
    print('msl: $laymasolo');
    _createBcGsTiepnhanFuture?.then((value) {
      if (value == true) {
        _MSLapi.update(
            id: selectedMSLId!,
            khoiluong: int.parse(khoiluongInpuutController.text),
            loaisanpham: selectedCategoryId!,
            trangthai: "Hoạt động",
            ten: "Lô đã tiếp nhận",
            masolo: laymasolo.toString(),
            mota: "Lô đã được tiếp nhận",
            khoiluongdadung: 0);
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tạo mới thành công'),
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
        _deleteBcgsTiepNhanFuture = _api.delete(
          id: widget.bcgstiepnhan.bcgiamsattiepnhannguyenlieuId,
        );
        _MSLapi.updateKL(id: selectedMSLId!, khoiluong: 0);

        _deleteBcgsTiepNhanFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa mã số lô ${widget.bcgstiepnhan.bcgiamsattiepnhannguyenlieuId} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
