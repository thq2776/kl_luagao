class SignupModel {
  SignupModel({
    required this.id,
    required this.name,
    required this.email,
  });

  int id;
  String name;
  String email;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
