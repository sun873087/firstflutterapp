class UserModel {
  late String name;
  late String password;

  UserModel({
    required this.name,
  });

  UserModel.fromJson(Map<String, dynamic> data)
      : name = data["name"],
        password = data["password"];
}
