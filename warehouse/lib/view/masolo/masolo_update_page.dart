// Xem danh mục + Chỉnh sửa + Xoá

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../apis/masolo_api.dart';
import '../../apis/product_category_api.dart';
import '../../models/masolo_model.dart';
import '../../models/product_category_model.dart';
import '../product_category/product_category_create_page.dart';

class MaSoLoUpdatePage extends StatefulWidget {
  const MaSoLoUpdatePage({super.key, required this.masolo});

  final MaSoLoModel masolo;

  @override
  State<MaSoLoUpdatePage> createState() => _MaSoLoUpdatePageState();
}

class _MaSoLoUpdatePageState extends State<MaSoLoUpdatePage> {
  final MaSoLoApi _api = MaSoLoApi();
  Future<bool>? _updateMaSoLoFuture;
  Future<bool>? _createMaSoLoFuture;

  Future<bool?>? _deleteMaSoLoFuture;

  Future<List<MaSoLoModel>>? _getMSLListFuture;
  Future<List<ProductCategoryModel>>? _getProductCategoryListFuture;
  final ProductCategoryApi _productCategoryApi = ProductCategoryApi();
  final MaSoLoApi _maSoLoApi = MaSoLoApi();

  TextEditingController loaisanphamInPutController = TextEditingController();
  TextEditingController trangthaiInPutController = TextEditingController();
  TextEditingController tenInPutController = TextEditingController();
  TextEditingController masoloInPutController = TextEditingController();
  TextEditingController khoiluongInPutController = TextEditingController();
  TextEditingController khoiluongsudungInPutController =
      TextEditingController();
  TextEditingController motaInPutController = TextEditingController();
  bool isMasoloChanged = false;
  TextEditingController idInPutController = TextEditingController();

  int? selectedCategoryId;
  int? khoiluong;
  int? khoiluongdadung;

  String? nameInputError;
  String? descriptionInputError;
  String? categoryIdInputError;

  @override
  void initState() {
    super.initState();
    loaisanphamInPutController.text = widget.masolo.loaisanphamId.toString();
    trangthaiInPutController.text = widget.masolo.trangthai.toString();
    tenInPutController.text = widget.masolo.ten;
    masoloInPutController.text = widget.masolo.masolo;
    motaInPutController.text = widget.masolo.mota;
    khoiluongInPutController.text = widget.masolo.khoiluong.toString();
    khoiluongsudungInPutController.text =
        widget.masolo.khoiluongdadung.toString();
    selectedCategoryId = widget.masolo.loaisanphamId;
    khoiluong = widget.masolo.khoiluong;
    khoiluongdadung = widget.masolo.khoiluongdadung;

// Trạng thái hiển thị
    check();
    getProductCategoryList();
    getMSL();
  }

  getMSL() {
    setState(() {
      _getMSLListFuture = _maSoLoApi.list();
    });
  }

  getProductCategoryList() {
    setState(() {
      _getProductCategoryListFuture = _productCategoryApi.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    String trangthai = widget.masolo.trangthai;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.masolo.ten.toString()),
      ),
      body: FutureBuilder<List<ProductCategoryModel>>(
        future: _getProductCategoryListFuture,
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

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: selectedCategoryId,
                        items: List.generate(
                          snapshot.requireData.length,
                          (index) => DropdownMenuItem(
                            value: snapshot.requireData
                                .elementAt(index)
                                .loaisanphamId,
                            child: Text(
                                snapshot.requireData.elementAt(index).tenloai),
                          ),
                        ),
                        decoration: InputDecoration(
                          labelText: "Danh mục sản phẩm",
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
                    const SizedBox(width: 16),
                    TextButton.icon(
                      onPressed: () async {
                        bool? update = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProductCategoryCreatePage(),
                          ),
                        );

                        if (update == true) {
                          getProductCategoryList();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Thêm"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: tenInPutController,
                  decoration: InputDecoration(
                    labelText: "Tên lô",
                    errorText: nameInputError,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: masoloInPutController,
                  decoration: InputDecoration(
                    labelText: "Mã số lô",
                    errorText: descriptionInputError,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: khoiluongInPutController,
                  decoration: InputDecoration(
                    labelText: "Khối lượng (kg)",
                    errorText: descriptionInputError,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  enabled: false,
                  controller: khoiluongsudungInPutController,
                  decoration: InputDecoration(
                    labelText: "Khối lượng sử dụng (kg)",
                    errorText: descriptionInputError,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: motaInPutController,
                  decoration: const InputDecoration(
                    labelText: "Mô tả",
                    // errorText: descriptionInputError,
                  ),
                ),
                const SizedBox(height: 16),
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Trạng thái',
                    errorText: nameInputError,
                    border: const OutlineInputBorder(),
                  ),
                  child: TextFormField(
                    controller: trangthaiInPutController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
          );
        },
      ),
    );
  }

  void update() async {
    try {
      // Kiểm tra giá trị đầu vào
      if (tenInPutController.text.isEmpty ||
          masoloInPutController.text.isEmpty ||
          khoiluongInPutController.text.isEmpty ||
          motaInPutController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
      }

      if (masoloInPutController.text != widget.masolo.masolo) {
        final maSoLoExists = await _api.checkMaSoLo(masoloInPutController.text);

        if (maSoLoExists) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Mã số lô đã tồn tại'),
            ),
          );
          return;
        }
      }

      // int khoiluongValue = 0;
      // if (khoiluongInPutController.text.isNotEmpty) {
      //   khoiluongValue = int.tryParse(khoiluongInPutController.text) ?? 0;
      // }

      // int khoiluongsudungValue = 0;
      // if (khoiluongsudungInPutController.text.isNotEmpty) {
      //   khoiluongsudungValue =
      //       int.tryParse(khoiluongsudungInPutController.text) ?? 0;
      // }
      // int khoiluongcapnhat = int.parse(khoiluongsudungInPutController.text) -
      //     widget.masolo.khoiluongdadung;

      int khoiluongdauvao = 0;
      if (khoiluongInPutController.text.isNotEmpty) {
        khoiluongdauvao = int.tryParse(khoiluongInPutController.text) ?? 0;
      }
      int khoiluongcapnhat = khoiluongdauvao - widget.masolo.khoiluong;
      // print(khoiluongValue);
      // print(khoiluongsudungValue);
      print('1: $khoiluongInPutController');
      print('2:$khoiluongsudungInPutController');
      print('3:$khoiluongdadung');
      print('4:$khoiluong');
      print('5:$khoiluongcapnhat');

      _updateMaSoLoFuture = _api.update(
        id: widget.masolo.masoloId,
        loaisanpham: selectedCategoryId!,
        trangthai: widget.masolo.trangthai,
        ten: tenInPutController.text,
        masolo: masoloInPutController.text,
        khoiluong: khoiluongcapnhat,
        khoiluongdadung: 0,
        mota: motaInPutController.text,
      );

      _updateMaSoLoFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật sản phẩm thành công'),
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

// Callback được gọi khi giá trị của masoloInPutController thay đổi
  void create() async {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (tenInPutController.text.isEmpty ||
          masoloInPutController.text.isEmpty ||
          khoiluongInPutController.text.isEmpty ||
          motaInPutController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập đầy đủ thông tin'),
          ),
        );
        return;
      }
    });

    if (masoloInPutController.text.isNotEmpty) {
      final maSoLoExists = await _api.checkMaSoLo(masoloInPutController.text);

      if (maSoLoExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mã số lô đã tồn tại. Kh thể tạo'),
          ),
        );
        return;
      }
    }

    _createMaSoLoFuture = _api.create(
      loaisanpham: selectedCategoryId!,
      trangthai: "Hoạt động",
      ten: tenInPutController.text,
      masolo: masoloInPutController.text,
      khoiluong: int.parse(khoiluongInPutController.text),
      khoiluongdadung: 0,
      mota: motaInPutController.text,
    );

    _createMaSoLoFuture?.then((value) {
      if (value == true) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tạo lô sản phẩm thành công'),
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
        _deleteMaSoLoFuture = _api.delete(
          id: widget.masolo.masoloId,
        );

        _deleteMaSoLoFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã xóa mã số lô thành công'),
              ),
            );
          }
        });
      });
    }
  }

  void check() async {
    // Kiểm tra giá trị đầu vào
    setState(() {});

    int khoiluong = int.tryParse(khoiluongInPutController.text) ?? 0;
    int khoiluongdadung =
        int.tryParse(khoiluongsudungInPutController.text) ?? 0;
    print(khoiluong - khoiluongdadung);
    print(khoiluongdadung);
    if (khoiluongdadung >= khoiluong) {
      _api.update(
        id: widget.masolo.masoloId,
        loaisanpham: selectedCategoryId!,
        trangthai: "Đã đóng",
        ten: tenInPutController.text,
        masolo: masoloInPutController.text,
        khoiluong: 0,
        khoiluongdadung: 0,
        mota: motaInPutController.text,
      );
      getMSL();
    } else if (khoiluongdadung < khoiluong) {
      _api.update(
        id: widget.masolo.masoloId,
        loaisanpham: selectedCategoryId!,
        trangthai: "Hoạt động",
        ten: tenInPutController.text,
        masolo: masoloInPutController.text,
        khoiluong: 0,
        khoiluongdadung: 0,
        mota: motaInPutController.text,
      );
    }

    // Gửi yêu cầu cập nhật dữ liệu lên máy chủ

    // Kiểm tra kết quả cập nhật và xử lý thông báo
  }
}
