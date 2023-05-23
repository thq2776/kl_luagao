import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? oldPasswordError;
  String? newPasswordError;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đổi mật khẩu"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu cũ",
                errorText: oldPasswordError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu mới",
                errorText: newPasswordError,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Xác nhận mật khẩu mới",
                errorText: confirmPasswordError,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: changePassword,
              child: const Text("Đổi mật khẩu"),
            ),
          ],
        ),
      ),
    );
  }

  void changePassword() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (oldPasswordController.text.isEmpty) {
        oldPasswordError = "Vui lòng nhập mật khẩu cũ";
      } else {
        oldPasswordError = null;
      }

      if (newPasswordController.text.isEmpty) {
        newPasswordError = "Vui lòng nhập mật khẩu mới";
      } else {
        newPasswordError = null;
      }

      if (confirmPasswordController.text.isEmpty) {
        confirmPasswordError = "Vui lòng xác nhận mật khẩu mới";
      } else if (confirmPasswordController.text != newPasswordController.text) {
        confirmPasswordError = "Mật khẩu xác nhận không khớp";
      } else {
        confirmPasswordError = null;
      }
    });

    if (oldPasswordError == null &&
        newPasswordError == null &&
        confirmPasswordError == null) {
      // Gọi API để đổi mật khẩu

      // Sau khi đổi mật khẩu thành công, có thể hiển thị thông báo hoặc chuyển đến màn hình khác
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Thành công"),
            content: const Text("Mật khẩu đã được thay đổi thành công"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Đóng dialog và quay lại màn hình trước đó
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
