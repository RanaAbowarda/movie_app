class UserModel {
  String userName;
  String id;
  String email;

  UserModel({required this.id, required this.email, required this.userName});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(userName: json["userName"], id: json["id"], email: json["email"]);

  Map<String, dynamic> toJson() {
    return {"userName": userName, "email": email, "id": id};
  }
}
