import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/apis/customer_api.dart';
import 'package:warehouse/models/customer_model.dart';

class CustomerUpdatePage extends StatefulWidget {
  const CustomerUpdatePage({Key? key, required this.category})
      : super(key: key);

  final KhachHangModel category;

  @override
  State<CustomerUpdatePage> createState() => _CustomerUpdatePageState();
}

class _CustomerUpdatePageState extends State<CustomerUpdatePage> {
  final KhachHangApi _api = KhachHangApi();
  Future<bool>? _createCustomerFuture;
  Future<bool?>? _updateCustomerFuture;
  Future<bool?>? _deleteCustomerFuture;

  TextEditingController tenInputController = TextEditingController();
  TextEditingController diachiInputController = TextEditingController();
  TextEditingController sdtInputController = TextEditingController();
  TextEditingController ghichuInputController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  @override
  void initState() {
    super.initState();
    tenInputController.text = widget.category.ten;
    diachiInputController.text = widget.category.diachi;
    sdtInputController.text = widget.category.sdt.toString();
    ghichuInputController.text = widget.category.ghichu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.ten),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DataTable(
                columnSpacing: 30, // Khoảng cách giữa hai cột
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 124, 31, 31)),
                  borderRadius: BorderRadius.circular(4),
                ),
                columns: [
                  DataColumn(
                    label: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Trường',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Thông tin',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Tên nông hộ')),
                    DataCell(
                      TextFormField(
                        controller: tenInputController,
                        decoration: InputDecoration(
                          errorText: nameInputError,
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Địa chỉ')),
                    DataCell(
                      TextFormField(
                        controller: diachiInputController,
                        decoration: InputDecoration(
                          errorText: descriptionInputError,
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sdt(+84)')),
                    DataCell(
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        controller: sdtInputController,
                        decoration: InputDecoration(
                          errorText: descriptionInputError,
                        ),
                        maxLength: 9, // Giới hạn độ dài là 9
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Ghi chú')),
                    DataCell(
                      TextFormField(
                        controller: ghichuInputController,
                        decoration: InputDecoration(
                          errorText: descriptionInputError,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: create,
                      child: Text("Tạo mới"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: update,
                      child: Text("Cập nhật"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: delete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Xoá"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void update() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (sdtInputController.text.trim().isEmpty ||
            tenInputController.text.trim().isEmpty ||
            diachiInputController.text.trim().isEmpty ||
            ghichuInputController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
      });
      if (sdtInputController.text.length != 9) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sdt phải có 9 số'),
          ),
        );
        return;
      }

      if (tenInputController.text != widget.category.ten) {
        final isDuplicateName =
            await _api.checkKhachHangname(tenInputController.text);

        if (isDuplicateName) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tên đã tồn tại'),
            ),
          );
          return;
        }
      }

      _updateCustomerFuture = _api.update(
        id: widget.category.khachhangId,
        ten: tenInputController.text,
        diachi: diachiInputController.text,
        sdt: int.tryParse(sdtInputController.text) ?? 0,
        ghichu: ghichuInputController.text,
      );

      _updateCustomerFuture?.then((value) {
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

  void create() async {
    try {
      // Kiểm tra giá trị đầu vào
      setState(() {
        if (sdtInputController.text.trim().isEmpty ||
            tenInputController.text.trim().isEmpty ||
            diachiInputController.text.trim().isEmpty ||
            ghichuInputController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng nhập đầy đủ thông tin'),
            ),
          );
          throw Exception('Vui lòng nhập đầy đủ thông tin'); // Ném ngoại lệ
        }
        if (sdtInputController.text.length != 9) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sdt phải có 9 số'),
            ),
          );
          return;
        }
      });

      final isDuplicateName =
          await _api.checkKhachHangname(tenInputController.text);

      if (isDuplicateName) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tên đã tồn tại'),
          ),
        );
        return;
      }

      _createCustomerFuture = _api.create(
        ten: tenInputController.text,
        diachi: diachiInputController.text,
        sdt: int.tryParse(sdtInputController.text) ?? 0,
        ghichu: ghichuInputController.text,
      );

      _createCustomerFuture?.then((value) {
        if (value == true) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tạo thành công'),
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
        content: const Text("Bạn có muốn xoá dữ liệu này không?"),
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
        _deleteCustomerFuture = _api.delete(
          id: widget.category.khachhangId,
        );

        _deleteCustomerFuture?.then((value) {
          if (value != null) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Đã xóa khách hàng ${widget.category.ten} thành công',
                ),
              ),
            );
          }
        });
      });
    }
  }
}
  // void delete() async {
  //   bool? isConfirm = await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Thông báo"),
  //       content: const Text("Bạn có có muốn xoá dữ liệu này không?"),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: const Text("Quay lại"),
  //         ),
  //         ElevatedButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.red,
  //           ),
  //           child: const Text("Xoá"),
  //         ),
  //       ],
  //     ),
  //   );

  //   if (isConfirm == true) {
  //     setState(() {
  //       _deleteProductCategoryFuture = _api.delete(
  //         id: widget.category.loaisanphamId,
  //       );

  //       _deleteProductCategoryFuture?.then((value) {
  //         if (value != null) {
  //           Navigator.of(context).pop(true);
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               content: Text(
  //                   'Đã xóa danh mục ${widget.category.tenloai} thành công'),
  //             ),
  //           );
  //         }
  //       });
  //     });
  //   }
  // }

