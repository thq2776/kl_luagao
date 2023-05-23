// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:warehouse/models/login_model.dart';
// import 'package:warehouse/models/signup_model.dart';

// import 'config.dart';

// class AuthApi {
//   Future<LoginModel?> login(
//       {required String email, required String password}) async {
//     try {
//       final url = "${ApiConfig.host}/api/dangnhap";
//       final response = await post(Uri.parse(url), body: {
//         "email": email,
//         "password": password,
//       });
//       final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

//       if (response.statusCode == 200) {
//         return LoginModel.fromMap(jsonData);
//       }

//       return null;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<SignupModel?> signup({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     var client = Client();

//     // Gửi yêu cầu tới cơ sở dữ liệu
//     try {
//       var response = await post(
//         Uri.parse("${ApiConfig.host}/api/dangky"),
//         body: {
//           "name": name,
//           "email": email,
//           "password": password,
//         },
//       );

//       final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

//       // Nếu server thực hiện yêu cầu thành công
//       if (response.statusCode == 200) {
//         var signupModel = SignupModel.fromJson(jsonData['data']);

//         return SignupModel.fromJson(jsonData["data"]);
//       } else {
//         return null;
//       }
//     }
//     // Xử lý các lỗi không rõ
//     catch (e) {
//       return null;
//     }
//     // Đóng kết nối
//     finally {
//       client.close();
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warehouse/models/login_model.dart';
import 'package:warehouse/models/signup_model.dart';

import 'config.dart';

class AuthApi {
  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      final url = "${ApiConfig.host}/api/dangnhap";
      final response = await http.post(Uri.parse(url), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final loginModel = LoginModel.fromMap(jsonData);

        // Lưu token vào SharedPreferences hoặc các giải pháp lưu trữ khác
        final token = loginModel.access_token;
        // TODO: Lưu token vào bộ nhớ hoặc lưu trữ tương ứng

        return loginModel;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<SignupModel?> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final url = "${ApiConfig.host}/api/dangky";
      final response = await http.post(Uri.parse(url), body: {
        "name": name,
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final signupModel = SignupModel.fromJson(jsonData["data"]);

        return signupModel;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    // Xóa token khỏi bộ nhớ hoặc lưu trữ tương ứng (trong trường hợp này, sử dụng SharedPreferences)
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}

class SharedPreferences {
  static SharedPreferences? _instance;

  static SharedPreferences getInstance() {
    _instance ??= SharedPreferences();
    return _instance!;
  }

  Future<void> remove(String key) async {
    // TODO: Xóa dữ liệu trong lưu trữ tương ứng
  }

  getString(String s) {}
}
