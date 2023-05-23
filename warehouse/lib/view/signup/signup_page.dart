import 'package:flutter/material.dart';
import 'package:warehouse/apis/auth_api.dart';
import 'package:warehouse/models/login_model.dart';
import 'package:warehouse/models/signup_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Future<SignupModel?>? _signupFuture;

  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  String? nameInputError;
  String? emailInputError;
  String? passwordInputError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Đăng ký"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameInputController,
                decoration: InputDecoration(
                  labelText: "Họ & tên",
                  errorText: nameInputError,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailInputController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: emailInputError,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordInputController,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  errorText: passwordInputError,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: signup,
                      child: const Text("Đăng ký"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signup() {
    // Kiểm tra giá trị đầu vào
    setState(() {
      if (nameInputController.text.isEmpty) {
        nameInputError = "Vui lòng nhập họ & tên";
      } else {
        nameInputError = null;
      }

      if (emailInputController.text.isEmpty) {
        emailInputError = "Vui lòng nhập họ & tên";
      } else {
        emailInputError = null;
      }

      if (passwordInputController.text.isEmpty) {
        passwordInputError = "Vui lòng nhập mật khẩu";
      } else {
        passwordInputError = null;
      }
    });

    if (nameInputError == null &&
        emailInputError == null &&
        passwordInputError == null) {
      print("Hello World");

      AuthApi authApi = AuthApi();

      setState(() {
        _signupFuture = authApi.signup(
          name: nameInputController.text,
          email: emailInputController.text,
          password: passwordInputController.text,
        );
      });

      _signupFuture?.then((value) {
        print(value);

        // Nếu đăng ký thành công
        if (value != null) {
          // Đóng trang hiện tại => quay lại trang trước
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Đăng ký thành công, vui lòng đăng nhập lại"),
            ),
          );
        } else {
          //
        }
      });
    }
  }
}


///  STACK ///
/// 
/// 
/// SignUp => trở về trang Login
/// Login => push trang Signup