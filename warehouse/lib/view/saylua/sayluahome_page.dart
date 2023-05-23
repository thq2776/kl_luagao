import 'package:flutter/material.dart';
import 'package:warehouse/view/phuongtien/phieudieuphuongtien_list.dart';
import 'package:warehouse/view/phuongtien/phuongtien_list_page.dart';
import 'package:warehouse/view/saylua/chitietgiamsatsaylua_list_page.dart';

import '../baocao/bcgiamsatsaylua/bcgiamsatsatlua_list_page.dart';
import '../login/login_page.dart';

class SayLuaHomePage extends StatefulWidget {
  const SayLuaHomePage({super.key});

  @override
  State<SayLuaHomePage> createState() => _SayLuaHomePageState();
}

class _SayLuaHomePageState extends State<SayLuaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý sấy lúa"),
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
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BcGiamSatSayLuaListPage(),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 198, 58, 58),
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://tse3.mm.bing.net/th?id=OIP.Rsp-KfKAuG8ojzzsHQDobwHaHa&pid=Api&P=0',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Báo cáo sấy lúa",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChiTietSayLuaListPage(),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 198, 58, 58),
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://tse3.mm.bing.net/th?id=OIP.1Xhzvir2cxHW7VManXTDDAAAAA&pid=Api&P=0',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Chi tiết giám sát",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
