import 'package:flutter/material.dart';
import 'package:warehouse/apis/auth_api.dart';
import 'package:warehouse/models/login_model.dart';
import 'package:warehouse/view/home_page.dart';
import 'package:warehouse/view/signup/signup_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<LoginModel?>? _loginFuture;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  String? emailInputError;
  String? passwordInputError;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 60,
              ),
              // Màu của SizedBox
              SizedBox(
                height: 150,
                child: Image.network(
                  'https://tse3.mm.bing.net/th?id=OIP.NkQD4dKH6iWFKiDROIXh2QHaHa&pid=Api&P=0',
                  fit: BoxFit.contain, // Thiết lập kiểu hiển thị của ảnh
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text(
              //   "Đăng nhập",
              //   style: TextStyle(
              //     color: Colors.blue, // Màu chữ của label
              //     fontSize: 24, // Kích thước chữ của label
              //     fontWeight: FontWeight.bold, // Độ đậm của chữ của label
              //   ),
              // ),
              const SizedBox(height: 16),
              TextField(
                focusNode: emailFocusNode,
                controller: emailInputController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: emailInputError,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Thiết lập viền tròn
                    borderSide:
                        const BorderSide(color: Colors.blue), // Thiết lập màu viền
                  ),
                ),
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordInputController,
                obscureText: !_showPassword,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  errorText: passwordInputError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Thiết lập viền tròn
                    borderSide:
                        const BorderSide(color: Colors.blue), // Thiết lập màu viền
                  ),
                ),
                onEditingComplete: login,
              ),

              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(
                            double.infinity, 48), // Cài đặt chiều cao của nút
                      ),
                      child: const Text("Đăng nhập"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Expanded(
                  //   child: OutlinedButton(
                  //     onPressed: signup,
                  //     child: const Text("Đăng ký"),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    // setState dùng để thay đổi trang thái của giao diện.

    // Kiểm tra giá trị đầu vào
    setState(() {
      if (emailInputController.text.isEmpty) {
        emailInputError = "Vui lòng nhập email";
      } else {
        emailInputError = null;
      }

      if (passwordInputController.text.isEmpty) {
        passwordInputError = "Vui lòng nhập mật khẩu";
      } else {
        passwordInputError = null;
      }
    });

    // Đăng nhập
    if (emailInputError == null && passwordInputError == null) {
      AuthApi authApi = AuthApi();

      setState(() {
        _loginFuture = authApi.login(
          email: emailInputController.text,
          password: passwordInputController.text,
        );

        _loginFuture?.then((value) {
          // Nếu thành công
          if (value != null) {
            //
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                    Text("Sai tài khoản hoặc mật khẩu, vui lòng nhập lại")));
          }
        });
      });
    }
  }

  void signup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupPage()));
  }
}
