// Xem danh mục + Chỉnh sửa + Xoá

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/apis/phuongtien_api.dart';
import 'package:warehouse/apis/tokhai_api.dart';
import 'package:warehouse/models/customer_model.dart';
import 'package:warehouse/models/phuongtien_modell.dart';
import 'package:warehouse/models/tokhai_model.dart';
import 'package:warehouse/view/customer/customer_create_page.dart';
import 'package:warehouse/view/customer/customer_list_page.dart';
import 'package:warehouse/view/customer/customer_update_page.dart';
import 'package:warehouse/view/phuongtien/phuongtien_create_page.dart';
import '../../apis/masolo_api.dart';
import '../../apis/product_category_api.dart';
import '../../models/masolo_model.dart';
import '../../models/product_category_model.dart';
import '../product_category/product_category_create_page.dart';

class TokhaiUpdatePage extends StatefulWidget {
  const TokhaiUpdatePage({super.key, required this.tokhai});

  final ToKhaiModel tokhai;

  @override
  State<TokhaiUpdatePage> createState() => _TokhaiUpdatePageState();
}

class _TokhaiUpdatePageState extends State<TokhaiUpdatePage> {
  final ToKhaiApi _api = ToKhaiApi();

  Future<bool>? _createToKhaiFuture;
  Future<bool>? _updateToKhaiFuture;
  Future<bool?>? _deleteToKhaiFuture;
//khóa ngoại
  Future<List<ToKhaiModel>>? _getTKFuture;
  final ToKhaiApi _TKApi = ToKhaiApi();

  Future<List<ProductCategoryModel>>? _getProductCategoryListFuture;
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();
  Future<List<PhuongTienModel>>? _getPhuongTienListFuture;
  final PhuongTienApi _productPhuongtienApi = PhuongTienApi();
  Future<List<KhachHangModel>>? _getCustomerListFuture;
  final KhachHangApi _productKhachHangApi = KhachHangApi();
  KhachHangModel? selectedCustomer;

  TextEditingController loaisanphamInPutController = TextEditingController();
  TextEditingController phuongtienInPutController = TextEditingController();
  TextEditingController customerInPutController = TextEditingController();
  TextEditingController soluongInputContrroller = TextEditingController();
  TextEditingController chatluongInputController = TextEditingController();
  TextEditingController vungnguyenlieuInputController = TextEditingController();

  TextEditingController idInPutController = TextEditingController();
  late TextEditingController ngayInputController = TextEditingController();
  late DateTime ngayInputDateTime;

  DateTime? selectedDate;
  int? selectedCategoryId;
  int? selectedPhuongTienId;
  int? selectedCustomerId;
  String selectedValue = "Đạt";

  String? nameInputError;
  String? descriptionInputError;
  String? categoryIdInputError;
  int selectedCustomerIdd = 0; // KhachhangId được chọn
  String selectedCustomerAddress = ""; // Địa chỉ của khách hàng được chọn

  @override
  void initState() {
    super.initState();
    loaisanphamInPutController.text = widget.tokhai.loaisanphamId.toString();
    phuongtienInPutController.text = widget.tokhai.phuongtienId.toString();
    customerInPutController.text = widget.tokhai.khachhangId.toString();
    soluongInputContrroller.text = widget.tokhai.soluong;
    chatluongInputController.text = widget.tokhai.chatluongnguyenlieu;
    vungnguyenlieuInputController.text = widget.tokhai.vungnguyenlieu;

    selectedCategoryId = widget.tokhai.loaisanphamId;
    selectedPhuongTienId = widget.tokhai.phuongtienId;
    selectedCustomerId = widget.tokhai.khachhangId;
    selectedValue = "Đạt";
    ngayInputDateTime = widget.tokhai.ngay;

    ngayInputController = TextEditingController.fromValue(
      TextEditingValue(
        text: DateFormat('yyyy/MM/dd').format(ngayInputDateTime),
      ),
    );
// Trạng thái hiển thị
    // getTOKhai();
    getProductCategoryList();
    getPhuongTienList();
    getCustomerList();
    // selectedCustomerIdd = widget.tokhai.khachhangId;
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null &&
        picked != selectedDate &&
        picked != ngayInputDateTime) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  getTOKhai() {
    setState(() {
      _getTKFuture = _TKApi.list();
    });
  }

  getProductCategoryList() {
    setState(() {
      _getProductCategoryListFuture = _productCategoryApi.list();
    });
  }

  getPhuongTienList() {
    setState(() {
      _getPhuongTienListFuture = _productPhuongtienApi.list();
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
    String trangthai = widget.tokhai.chatluongnguyenlieu;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tờ khai cam kết  - xuất xứ"),
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

            return FutureBuilder<List<PhuongTienModel>>(
              future: _getPhuongTienListFuture,
              builder: (context, phuongTienSnapshot) {
                if (phuongTienSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (phuongTienSnapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Có lỗi khi gọi dữ liệu phương tiện, vui lòng thử lại",
                    ),
                  );
                }

                if (phuongTienSnapshot.requireData.isEmpty) {
                  return const Center(
                    child: Text("Không có dữ liệu phương tiện hiển thị"),
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

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: DataTable(
                        columnSpacing: 16, // Khoảng cách giữa các cột
                        columns: [
                          DataColumn(label: Text("Trường")), // Cột "Trường"
                          DataColumn(label: Text("Giá trị")), // Cột "Giá trị"
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                                "Danh mục sản phẩm")), // Trường: Danh mục sản phẩm
                            DataCell(
                              DropdownButtonFormField<int>(
                                value: selectedCategoryId,
                                items: List.generate(
                                  productCategorySnapshot.requireData.length,
                                  (index) => DropdownMenuItem(
                                    value: productCategorySnapshot
                                        .requireData[index].loaisanphamId,
                                    child: Text(productCategorySnapshot
                                        .requireData[index].tenloai),
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
                            const DataCell(
                                Text("Phương tiện")), // Trường: Phương tiện
                            DataCell(
                              DropdownButtonFormField<int>(
                                value: selectedPhuongTienId,
                                items: List.generate(
                                  phuongTienSnapshot.requireData.length,
                                  (index) => DropdownMenuItem(
                                    value: phuongTienSnapshot
                                        .requireData[index].phuongtienId,
                                    child: Text(phuongTienSnapshot
                                        .requireData[index].sophuongtien),
                                  ),
                                ),
                                decoration: InputDecoration(
                                  // labelText: "Phương tiện",
                                  errorText: descriptionInputError,
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      bool? update =
                                          await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PhuongTienCreatePage(),
                                        ),
                                      );

                                      if (update == true) {
                                        getTOKhai();
                                      }
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedPhuongTienId = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Khách hàng")), // Trường: Phương tiện
                            DataCell(
                              DropdownButtonFormField<int>(
                                value: selectedCustomerId,
                                items: List.generate(
                                  customerSnapshot.requireData.length,
                                  (index) => DropdownMenuItem(
                                    value: customerSnapshot
                                        .requireData[index].khachhangId,
                                    child: Text(customerSnapshot
                                        .requireData[index].ten),
                                  ),
                                ),
                                decoration: InputDecoration(
                                  // labelText: "Phương tiện",
                                  errorText: descriptionInputError,
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      bool? update =
                                          await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Customerlist(),
                                        ),
                                      );

                                      if (update == true) {
                                        getTOKhai();
                                      }
                                    },
                                    icon: Icon(Icons.add),
                                  ),
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
                          // DataRow(
                          //   cells: [
                          //     DataCell(Text("Địa chỉ")),
                          //     DataCell(
                          //       TextFormField(
                          //         enabled: false,
                          //         initialValue: customerSnapshot
                          //             .requireData[selectedCustomerIdd].diachi,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          DataRow(cells: [
                            const DataCell(
                                Text("Khối lượng(kg)")), // Trường: Khối lượng
                            DataCell(
                              TextFormField(
                                controller: soluongInputContrroller,
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
                                "Vùng nguyên liệu")), // Trường: Vùng nguyên liệu
                            DataCell(
                              TextFormField(
                                controller: vungnguyenlieuInputController,
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            const DataCell(
                                Text("Chất lượng")), // Trường: Vùng nguyên liệu
                            DataCell(
                              TextFormField(
                                controller: chatluongInputController,
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Ngày")),
                            DataCell(
                              TextFormField(
                                controller: ngayInputController,
                                readOnly: true,
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
                            ),
                          ]),
                          
                          DataRow(cells: [
                            DataCell(Text("")), // Trường: (trống)
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
                                      style: ElevatedButton.styleFrom(
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
                  },
                );
              },
            );
          }),
    );
  }

  void update() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (soluongInputContrroller.text.trim().isEmpty ||
            vungnguyenlieuInputController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
      });

      DateTime ngay = DateFormat('yyyy/MM/dd').parse(ngayInputController.text);
      print('tokhaixuatxucamketId: ${widget.tokhai.tokhaixuatxucamketId}');
      print('phuongtienId: $selectedPhuongTienId');
      print('loaisanphamId: $selectedCategoryId');
      print('customerId: $selectedCustomerId');
      print('soluong: ${soluongInputContrroller.text}');
      print('vungnguyenlieu: ${vungnguyenlieuInputController.text}');
      print('chatluongnguyenlieu: ${chatluongInputController.text}');
      print('ngay: $ngay');

      _updateToKhaiFuture = _api.update(
        id: widget.tokhai.tokhaixuatxucamketId,
        phuongtien: selectedPhuongTienId!,
        loaisanpham: selectedCategoryId!,
        customer: selectedCustomerId!,
        soluong: soluongInputContrroller.text,
        vungnguyenlieu: vungnguyenlieuInputController.text,
        chatluongnguyenlieu: chatluongInputController.text,
        ngay: ngay,
      );

      _updateToKhaiFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật thành công'),
            ),
          );
        }
      });
    } catch (e, stackTrace) {
      print('Exception occurred: $e');
      print('Stack trace: $stackTrace');
      // Xử lý exception ở đây
    }
  }

  void create() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (soluongInputContrroller.text.trim().isEmpty ||
            vungnguyenlieuInputController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
      });

      DateTime ngay = DateFormat('yyyy/MM/dd').parse(ngayInputController.text);
      print('tokhaixuatxucamketId: ${widget.tokhai.tokhaixuatxucamketId}');
      print('phuongtienId: $selectedPhuongTienId');
      print('loaisanphamId: $selectedCategoryId');
      print('customerId: $selectedCustomerId');
      print('soluong: ${soluongInputContrroller.text}');
      print('vungnguyenlieu: ${vungnguyenlieuInputController.text}');
      print('chatluongnguyenlieu: ${chatluongInputController.text}');
      print('ngay: $ngay');

      _createToKhaiFuture = _api.create(
        phuongtien: selectedPhuongTienId!,
        loaisanpham: selectedCategoryId!,
        customer: selectedCustomerId!,
        soluong: soluongInputContrroller.text,
        vungnguyenlieu: vungnguyenlieuInputController.text,
        chatluongnguyenlieu: chatluongInputController.text,
        ngay: ngay,
      );

      _createToKhaiFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tạo mới thành công'),
            ),
          );
        }
      });
    } catch (e, stackTrace) {
      print('Exception occurred: $e');
      print('Stack trace: $stackTrace');
      // Xử lý exception ở đây
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
        _deleteToKhaiFuture = _api.delete(
          id: widget.tokhai.tokhaixuatxucamketId,
        );

        _deleteToKhaiFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Đã xóa mã số lô ${widget.tokhai.tokhaixuatxucamketId} thành công'),
              ),
            );
          }
        });
      });
    }
  }
}
