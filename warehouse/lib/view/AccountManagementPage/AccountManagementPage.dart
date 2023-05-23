import 'package:flutter/material.dart';
import 'package:warehouse/models/login_model.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  LoginModel? _user;

  Future<void> _getUserInfo() async {
    // Lấy thông tin user từ API
    // Cập nhật state _user
  }

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_user == null)
                const CircularProgressIndicator()
              else
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Họ và tên: ${_user!.message}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Email: ${_user!.token_type}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Xử lý đăng xuất
                      },
                      child: const Text('Đăng xuất'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}