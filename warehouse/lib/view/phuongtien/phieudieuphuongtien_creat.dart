// // Tạo danh mục sản phẩm

// import 'package:flutter/material.dart';

// import '../../apis/phieudieuphuongtien_api.dart';
// import '../../apis/phuongtien_api.dart';
// import '../../apis/product_api.dart';
// import '../../models/phieudieuphuongtien_model.dart';
// import '../../models/phuongtien_modell.dart';
// import '../../models/product_model.dart';

// class PhieuDieuPhuongTienCreatePage extends StatefulWidget {
//   const PhieuDieuPhuongTienCreatePage({super.key});

//   @override
//   State<PhieuDieuPhuongTienCreatePage> createState() =>
//       _PhieuDieuPhuongTienCreatePageState();
// }

// class _PhieuDieuPhuongTienCreatePageState
//     extends State<PhieuDieuPhuongTienCreatePage> {
//   final PhieuDieuPhuongTienApi _api = PhieuDieuPhuongTienApi();
//   final PhuongTienApi phuongtien_api = PhuongTienApi();
//   final ProductApi _productApi = ProductApi();
//   Future<List<PhuongTienModel>>? getPhuongTienListFuture;
//   Future<PhieuDieuPhuongTienModel?>? _createPhieuDieuPhuongTienFuture;
//   Future<List<ProductModel>>? getProductListFuture;

//   @override
//   void initState() {
//     super.initState();
//     // secletedPhuongTienId = widget..loaisanphamId;

//     getProductList();
//     getPhuongTienList();
//   }

//   getPhuongTienList() {
//     setState(() {
//       getPhuongTienListFuture = phuongtien_api.list();
//     });
//   }

//   getProductList() {
//     setState(() {
//       getProductListFuture = _productApi.list();
//     });
//   }

//   TextEditingController ngayxuatbenInputController = TextEditingController();
//   TextEditingController tennguyenlieuInputController = TextEditingController();
//   TextEditingController tennguoibanInputController = TextEditingController();
//   TextEditingController sohopdongController = TextEditingController();
//   TextEditingController diachivungController = TextEditingController();
//   TextEditingController daidienphuongtienController = TextEditingController();
//   TextEditingController soluongController = TextEditingController();

//   String? nameInputError;
//   String? descriptionInputError;
//   int? secletedPhuongTienId;
//   int? selectedProductId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tạo phiếu điều phương tiện"),
//       ),
//       body: FutureBuilder<List<PhuongTienModel>>(
//           future: getPhuongTienListFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (snapshot.hasError) {
//               return const Center(
//                 child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
//               );
//             }

//             if (snapshot.requireData.isEmpty) {
//               return const Center(
//                 child: Text("Không có dữ liệu hiển thị"),
//               );
//             }
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   DropdownButtonFormField<int>(
//                     items: List.generate(
//                       snapshot.requireData.length,
//                       (index) => DropdownMenuItem(
//                         value:
//                             snapshot.requireData.elementAt(index).phuongtienId,
//                         child: Text(
//                             snapshot.requireData.elementAt(index).sophuongtien),
//                       ),
//                     ),
//                     decoration: InputDecoration(
//                       labelText: "Chọn phương tiện",
//                       errorText: nameInputError,
//                     ),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           secletedPhuongTienId = value;
//                         });
//                       }
//                     },
//                   ),
//                   DropdownButtonFormField<int>(
//                     items: List.generate(
//                       snapshot.requireData.length,
//                       (index) => DropdownMenuItem(
//                         value:
//                             snapshot.requireData.elementAt(index).phuongtienId,
//                         child: Text(
//                             snapshot.requireData.elementAt(index).sophuongtien),
//                       ),
//                     ),
//                     decoration: InputDecoration(
//                       labelText: "",
//                       errorText: nameInputError,
//                     ),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           secletedPhuongTienId = value;
//                         });
//                       }
//                     },
//                   ),
//                   TextFormField(
//                     controller: ngayxuatbenInputController,
//                     decoration: InputDecoration(
//                       labelText: "Ngày xuất bến",
//                       errorText: nameInputError,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: tennguyenlieuInputController,
//                     decoration: InputDecoration(
//                       labelText: "Tên nguyên liệu",
//                       errorText: descriptionInputError,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: tennguoibanInputController,
//                     decoration: InputDecoration(
//                       labelText: "Tên người bán",
//                       errorText: descriptionInputError,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: sohopdongController,
//                     decoration: InputDecoration(
//                       labelText: "Số hợp đồng",
//                       errorText: descriptionInputError,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: diachivungController,
//                     decoration: InputDecoration(
//                       labelText: "địa chỉ vùng",
//                       errorText: descriptionInputError,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: create,
//                           child: const Text("Tạo"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }

//   void create() {
//     // Kiểm tra giá trị đầu vào
//     setState(() {
//       if (ngayxuatbenInputController.text.isEmpty) {
//         nameInputError = "Vui lòng nhập dữ liệu";
//       } else {
//         nameInputError = null;
//       }

//       if (tennguyenlieuInputController.text.isEmpty) {
//         descriptionInputError = "Vui lòng nhập dữ liệu";
//       } else {
//         descriptionInputError = null;
//       }
//     });
//     if (nameInputError == null && descriptionInputError == null) {
//       _createPhieuDieuPhuongTienFuture = _api.create(
//         phuongtienId: secletedPhuongTienId!,
//         sanphamId: 1,
//         ngayxuatben: ngayxuatbenInputController,
//         tennguyenlieu: tennguyenlieuInputController.text,
//         tennguoiban: tennguoibanInputController.text,
//         sohopdong: sohopdongController.text,
//         diachivung: diachivungController.text,
//         soluong: soluongController.text,
//         daidienphuongtien: daidienphuongtienController.text,
//       );

//       _createPhieuDieuPhuongTienFuture?.then((value) {
//         if (value != null) {
//           Navigator.of(context).pop(true);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Tạo phương tiện mới thành công'),
//             ),
//           );
//         }
//       });
//     }
//   }
// }
