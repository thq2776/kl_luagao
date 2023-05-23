// // Tạo danh mục sản phẩm

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:warehouse/apis/customer_api.dart';
// import 'package:warehouse/models/customer_model.dart';
// import 'package:warehouse/models/product_category_model.dart';

// import '../../apis/product_category_api.dart';

// class CustomerCreatePage extends StatefulWidget {
//   const CustomerCreatePage({super.key});

//   @override
//   State<CustomerCreatePage> createState() => _CustomerCreatePageState();
// }

// class _CustomerCreatePageState extends State<CustomerCreatePage> {
//   final KhachHangApi _api = KhachHangApi();

//   Future<KhachHangModel?>? _createKhachHangFuture;

//   TextEditingController tenInputController = TextEditingController();
//   TextEditingController diachiInputController = TextEditingController();
//   TextEditingController sdtInputController = TextEditingController();
//   TextEditingController ghichuInputController = TextEditingController();

//   int? sdt;
//   String? nameInputError;
//   String? descriptionInputError;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tạo mới nông hộ"),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: tenInputController,
//               decoration: InputDecoration(
//                 hintText: 'Họ và tên',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
//                 filled: true,
//                 labelText: "Họ và tên",
//                 errorText: nameInputError,
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               controller: diachiInputController,
//               decoration: InputDecoration(
//                 hintText: 'Địa chỉ',
//                 fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 labelText: "Địa chỉ",
//                 errorText: descriptionInputError,
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               controller: sdtInputController,
//               decoration: InputDecoration(
//                 hintText: 'Sdt',
//                 fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 labelText: "Sdt",
//                 errorText: descriptionInputError,
//               ),
//               inputFormatters: [
//                 FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
//               ],
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               controller: ghichuInputController,
//               decoration: InputDecoration(
//                 hintText: 'Gì cũng đc',
//                 fillColor: const Color.fromRGBO(109, 197, 132, 0.2),
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0), // tạo góc tròn
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 146, 213, 98), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 129, 204, 75), width: 2.0),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 labelText: "...",
//                 errorText: descriptionInputError,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: create,
//                     child: const Text("Tạo"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void create() {
//     // Kiểm tra giá trị đầu vào
//     setState(() {
//       if (tenInputController.text.isEmpty) {
//         nameInputError = "Vui lòng nhập dữ liệu";
//       } else {
//         nameInputError = null;
//       }

//       if (diachiInputController.text.isEmpty) {
//         descriptionInputError = "Vui lòng dữ liệu";
//       } else {
//         descriptionInputError = null;
//       }
//     });
//     if (nameInputError == null && descriptionInputError == null) {
//       _createKhachHangFuture = _api.create(
//         ten: tenInputController.text,
//         diachi: diachiInputController.text,
//         sdt: int.parse(sdtInputController.text),
//         ghichu: ghichuInputController.text,
//       );

//       _createKhachHangFuture?.then((value) {
//         if (value != null) {
//           Navigator.of(context).pop(true);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Tạo mới nông hộ thành công'),
//             ),
//           );
//         }
//       });
//     }
//   }
// }
