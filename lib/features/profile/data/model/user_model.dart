class UserModel {
  int? id;
  String? userName;
  String? email;
  String? role;
  UserModel({
    this.email,
    this.role,
    this.userName
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userName = json["user_name"];
    email = json["email"];
    role = json["role"];
  }
}
