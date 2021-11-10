class RegisterRequest {
  late String name;
  late String email;
  late String password;

  RegisterRequest(
      {required this.name, required this.email, required this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.email = json["email"];
    this.password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
