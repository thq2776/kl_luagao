// // Xem danh sách danh mục sản phẩm

// import 'package:flutter/material.dart';
// import 'package:warehouse/models/TachHat_model.dart';
// import '../../../apis/tachhat_api.dart';

// class TachHatListPage extends StatefulWidget {
//   const TachHatListPage({super.key});

//   @override
//   State<TachHatListPage> createState() => _TachHatListPageState();
// }

// class _TachHatListPageState extends State<TachHatListPage> {
//   final TachHattApi _tachhat = TachHattApi();
//   Future<List<TachHatModel>>? _getTachHatList;

//   @override
//   void initState() {
//     super.initState();

//     getBcGsTiepNhanList();
//   }

//   getBcGsTiepNhanList() {
//     setState(() {
//       _getTachHatList = _tachhat.list();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Báo cáo giám sát tiếp nhận"),
//       ),
//       body: 
//       FutureBuilder<List<TachHatModel>>(
//         future: _getTachHatList,
//         builder: (context, tachhatsnapshot) {
//           if (tachhatsnapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (tachhatsnapshot.hasError) {
//             return const Center(
//               child: Text("Có lỗi khi gọi dữ liệu, vui lòng thử lại"),
//             );
//           }

//           if (tachhatsnapshot.requireData.isEmpty) {
//             return const Center(
//               child: Text("Không có dữ liệu hiển thị"),
//             );
//           }

//           return GridView.builder(
//             padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//             scrollDirection: Axis.vertical,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 1.5,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//             ),
//             itemCount: tachhatsnapshot.requireData.length,
//             itemBuilder: (BuildContext context, int index) {
//               // Chỉ mục riêng cho LauBongid
//               var tachhatid = tachhatsnapshot.requireData.elementAt(index);

//               return Column(
//                 children: [
//                   Card(
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                     child: ListTile(
//                       title: Column(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: ClipOval(
//                               child: Image.network(
//                                 'https://tse1.mm.bing.net/th?id=OIP.ewg1JAleigtBj09cT_YJHgHaHZ&pid=Api&P=0',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             "Bc bóc vỏ tách hạt",
//                             style: TextStyle(
//                               fontSize: 8,
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.italic,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       // onTap: () async {
//                       //   bool? update = await Navigator.of(context).push(
//                       //     MaterialPageRoute(
//                       //       builder: (context) => LauBongUpdate(
//                       //         laubongid: LauBongid,
//                       //       ),
//                       //     ),
//                       //   );

//                       //   if (update == true) {
//                       //     getTachHatList();
//                       //     setState(() {});
//                       //   }
//                       // },
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// // 