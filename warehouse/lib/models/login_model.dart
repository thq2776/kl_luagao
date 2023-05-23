// ignore_for_file: non_constant_identifier_names

class LoginModel {
  final String message;
  final String access_token;
  final String token_type;

  LoginModel(this.message, this.access_token, this.token_type);

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'access_token': access_token,
      'token_type': token_type,
    };
  }

  factory LoginModel.fromMap(Map<dynamic, dynamic> map) {
    return LoginModel(
      map['message'] ?? '',
      map['access_token'] ?? '',
      map['token_type'] ?? '',
    );
  }
}
