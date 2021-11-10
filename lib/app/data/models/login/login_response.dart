class LoginResponse {
  late int id;
  late String email;
  late String name;
  late String token;

  LoginResponse(
      {required this.id,
      required this.email,
      required this.name,
      required this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];
    this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    data["token"] = this.token;
    return data;
  }
}
