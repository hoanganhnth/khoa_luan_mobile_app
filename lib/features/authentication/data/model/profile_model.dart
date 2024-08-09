class ProfileModel {
  int? id;
  String? userName;
  String? email;
  String? address;
  String? phone;
  String? profileUrl;
  ProfileModel(
      {this.id,
      this.userName,
      this.email,
      this.address,
      this.phone,
      this.profileUrl});
  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userName = json["user_name"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    profileUrl = json["profileUrl"];
  }
}
