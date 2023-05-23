import 'package:flutter/material.dart';
import 'package:warehouse/view/customer/customer_list_page.dart';
import 'package:warehouse/view/login/login_page.dart';
import 'package:warehouse/view/masolo/masolo_list_page.dart';
import 'package:warehouse/view/phuongtien/phuongtienhome_page.dart';
import 'package:warehouse/view/product/product_list_page.dart';
import 'package:warehouse/view/product_category/danhmucsanpham_list_page.dart';
import 'package:warehouse/view/product_category/product_category_create_page.dart';
import 'package:warehouse/view/product_category/product_category_list_page.dart';
import 'package:warehouse/view/quytrinh/quytrinh_page.dart';
import 'package:warehouse/view/saylua/sayluahome_page.dart';
import 'package:warehouse/view/signup/doimatkhau.dart';
import 'package:warehouse/view/signup/signup_page.dart';

import 'masolo/masolo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Trang chủ"),
        backgroundColor: const Color.fromARGB(255, 48, 156, 238),
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
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuyTrinhPage(),
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
                      'https://tse1.mm.bing.net/th?id=OIP.uRmFwSfJxhGAMKpQMQ2OWQHaHa&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Quy trình",
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
                builder: (context) => const ProductCategoryListPage(),
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
                      'https://tse3.mm.bing.net/th?id=OIP.I6lSPfWno7_0wRWjRJsP8QHaED&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Quản lý danh mục",
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
                builder: (context) => const ProductListPage(),
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
                      'https://tse3.mm.bing.net/th?id=OIP.6i3Sx-MbWvIiGlkm--XfHQHaD3&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Quản lý sản phẩm",
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
                builder: (context) => const SayLuaHomePage(),
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
                  "Quản lý sấy lúa",
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
                builder: (context) => const MaSoLoListPage(),
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
                      'https://tse4.mm.bing.net/th?id=OIP.GPGhOKesSBNbgaJzKcdpegHaHQ&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Quản lý mã số lô",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PhuongTienPageHome(),
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
                      'https://tse1.mm.bing.net/th?id=OIP.m3ZDd2uBBDZNj2KAL5yZQAHaEk&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "QL phương tiện",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const danhmucsanpham(),
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
                      'https://tse4.mm.bing.net/th?id=OIP.GPGhOKesSBNbgaJzKcdpegHaHQ&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "QL DM sản phẩm",
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
                builder: (context) => const Customerlist(),
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
                      'https://tse4.mm.bing.net/th?id=OIP.8mxPLszJkIKL_mnrA4W-RwHaGl&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Nông hộ",
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Quản lý chuỗi cung ứng lúa gạo Cty Tấn Vương',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            ListTile(
              title: const Text('Đăng ký'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Đổi mật khẩu'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Quản lý tài khoản'),
              onTap: () {
                // Xử lý khi nhấp vào mục 2
              },
            ),
            ListTile(
              title: const Text('Đăng xuất'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ); // Xử lý khi nhấp vào mục 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
