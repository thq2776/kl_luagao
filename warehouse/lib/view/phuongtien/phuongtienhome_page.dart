import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/apis/phieudieuphuongtien_api.dart';
import 'package:warehouse/view/phuongtien/phieudieuphuongtien_list.dart';
import 'package:warehouse/view/phuongtien/phuongtien_list_page.dart';

import '../login/login_page.dart';

class PhuongTienPageHome extends StatefulWidget {
  const PhuongTienPageHome({super.key});

  @override
  State<PhuongTienPageHome> createState() => _PhuongTienPageHomeState();
}

class _PhuongTienPageHomeState extends State<PhuongTienPageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý phương tiện"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: const Color.fromARGB(255, 186, 219, 241),
              child: ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PhuongTienListPage())),
                leading: const Icon(Icons.category),
                title: const Text("Phương tiện"),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 186, 219, 241),
              child: ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PhieuDieuPhuongTienListPage())),
                leading: const Icon(Icons.category),
                title: const Text("Phiếu điều phương tiện"),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
