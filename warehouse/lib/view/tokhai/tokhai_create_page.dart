// Tạo danh mục sản phẩm

import 'package:flutter/material.dart';
import 'package:warehouse/apis/masolo_api.dart';
import '../../models/masolo_model.dart';

class MaSoLoCreatPage extends StatefulWidget {
  const MaSoLoCreatPage({super.key});

  @override
  State<MaSoLoCreatPage> createState() => _MaSoLoCreatPageState();
}

class _MaSoLoCreatPageState extends State<MaSoLoCreatPage> {
  final MaSoLoApi _api = MaSoLoApi();

  Future<MaSoLoModel?>? _createMaSoLoFuture;

  TextEditingController loaisanphamInPutController = TextEditingController();
  TextEditingController trangthaiInPutController = TextEditingController();
  TextEditingController tenInPutController = TextEditingController();
  TextEditingController masoloInPutController = TextEditingController();
  TextEditingController motaInPutController = TextEditingController();

  String? nameInputError;
  String? descriptionInputError;

  // @override
  // void initState() {
  //   super.initState();

  // // tenInPutController.text = widget.
  //   // tenInPutController = widget.masolo.ten.toString();
  //   // masoloInPutController = widget.masolo.masolo.toString();
  //   // motaInPutControlle = widget.masolo.mota);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo mã số lô"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: loaisanphamInPutController,
              decoration: InputDecoration(
                labelText: "Tên lô",
                errorText: nameInputError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: trangthaiInPutController,
              decoration: InputDecoration(
                labelText: "Tên lô",
                errorText: nameInputError,
              ),
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
              controller: motaInPutController,
              decoration: InputDecoration(
                labelText: "Mô tả",
                errorText: descriptionInputError,
              ),
            ),
            const SizedBox(height: 16),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: create,
            //         child: const Text("Tạo"),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

//   void create() {
//     // Kiểm tra giá trị đầu vào
//     setState(() {
//       if (tenInPutController.text.isEmpty) {
//         nameInputError = "Vui lòng nhập dữ liệu";
//       } else {
//         nameInputError = null;
//       }

//       if (masoloInPutController.text.isEmpty) {
//         descriptionInputError = "Vui lòng nhập dữ liệu";
//       } else {
//         descriptionInputError = null;
//       }
//     });
//     if (nameInputError == null && descriptionInputError == null) {
//       _createMaSoLoFuture = _api.create(
//         loaisanpham: loaisanphamInPutController.t,
//         trangthai: trangthaiInPutController.text,
//         ten: tenInPutController.text,
//         mosolo: masoloInPutController.text,
//         mota: motaInPutController.text,
//       );

//       _createMaSoLoFuture?.then((value) {
//         if (value != null) {
//           Navigator.of(context).pop(true);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Tạo mã số lô "${value.masolo}"  thành công'),
//             ),
//           );
//         }
//       });
//     }
//   }
}
