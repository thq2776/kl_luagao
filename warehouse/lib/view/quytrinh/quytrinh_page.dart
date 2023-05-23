import 'package:flutter/material.dart';
import 'package:warehouse/apis/tokhai_api.dart';
import 'package:warehouse/view/baocao/TachHat/tachhat_list.dart';
import 'package:warehouse/view/baocao/bcgstiepnha/bcgstiepnhan_list.dart';
import 'package:warehouse/view/baocao/laubong/laubong_list.dart';
import 'package:warehouse/view/gstiepnhan/gsbocvo.dart';
import 'package:warehouse/view/gstiepnhan/gsdonggoi.dart';
import 'package:warehouse/view/gstiepnhan/gslaubong.dart';
import 'package:warehouse/view/gstiepnhan/gsnhaplo.dart';
import 'package:warehouse/view/gstiepnhan/gsrakimloai.dart';
import 'package:warehouse/view/gstiepnhan/gstachda.dart';
import 'package:warehouse/view/gstiepnhan/gstiepnhan_update_page.dart';
import 'package:warehouse/view/gstiepnhan/ktphuongtienvanchuyenthanhpham.dart';
import 'package:warehouse/view/login/login_page.dart';
import 'package:warehouse/view/masolo/masolo_list_page.dart';
import 'package:warehouse/view/phuongtien/phieudieuphuongtien_list.dart';
import 'package:warehouse/view/phuongtien/phuongtienhome_page.dart';
import 'package:warehouse/view/product/product_list_page.dart';
import 'package:warehouse/view/product_category/danhmucsanpham_list_page.dart';
import 'package:warehouse/view/product_category/product_category_create_page.dart';
import 'package:warehouse/view/product_category/product_category_list_page.dart';
import 'package:warehouse/view/saylua/sayluahome_page.dart';
import 'package:warehouse/view/tokhai/tokhai_list_page.dart';

import '../baocao/nhaplo/nhaplo_list_page.dart';

class QuyTrinhPage extends StatelessWidget {
  const QuyTrinhPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quy trình"),
          backgroundColor: const Color.fromARGB(255, 48, 156, 238),
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
                  builder: (context) => const ToKhaiListPage(),
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
                        'https://tse4.mm.bing.net/th?id=OIP.wkmUd8yLkmv6YcjMOl7ySAHaHa&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1. Tờ khai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhieuDieuPhuongTienListPage(),
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
                        'https://tse1.mm.bing.net/th?id=OIP.WP7vyFdy0fmc2n3wTF_BvAAAAA&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "2.Phiếu điều phương tiện",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BcGsTiepNhan(),
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
                        'https://tse4.mm.bing.net/th?id=OIP.sgA2-C0PBr1JPfzUrTdx_AHaHa&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "3.Giám sát tiếp nhận",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
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
                    "4.Giám sát sấy lúa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NhapLo(),
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
                        'https://tse2.mm.bing.net/th?id=OIP.a9hsLTK_jDtsbeyPjeSFNQAAAA&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "5.Gs Nhập lô",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GsBocVoTacHat(),
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
                        'https://tse3.mm.bing.net/th?id=OIP.L7mZ-0f9zIH5Z3QFHbnh3wAAAA&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "6.Gs bóc vỏ tách hạt",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LauBong(),
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
                        'https://tse1.mm.bing.net/th?id=OIP.ewg1JAleigtBj09cT_YJHgHaHZ&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "7.Gs lau bóng",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GsTachDa(),
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
                        'https://png.pngtree.com/png-clipart/20220529/original/pngtree-agriculture-wheat-logo-template-vector-icon-design-png-image_7723452.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "8.Gs tách đá - màu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GsDongGoi(),
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
                        'https://tse1.mm.bing.net/th?id=OIP.kbCqVSUSU9UzsMTHkmoWUgHaGs&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "9.Gs đóng gói",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GsRaKimLoai(),
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
                        'https://tse2.mm.bing.net/th?id=OIP.6pBClMA7qjTDN-EKD4dWqQAAAA&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "10.Gs rà kim loại",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => KTPhuongtienvanchuyenthanhpham(),
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
                        'https://tse4.mm.bing.net/th?id=OIP.oyhuDFCWzvooDc77MYxAkAHaHa&pid=Api&P=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "11. Kiểm tra phương tiện",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
