class UserModel {
  int? id;
  String? username, fullname, email, phone, avatar;

  UserModel({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.phone,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      fullname: json["fullname"],
      email: json["email"],
      phone: json["phone"],
      avatar: json["avatar"],
    );
  }
}
