class LoginResponse {
  late String refresh;
  late String access;
  late int id;
  late String email;
  late String name;
  late String token;

  LoginResponse(
      {required this.refresh,
      required this.access,
      required this.id,
      required this.email,
      required this.name,
      required this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.refresh = json["refresh"];
    this.access = json["access"];
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];
    this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["refresh"] = this.refresh;
    data["access"] = this.access;
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    data["token"] = this.token;
    return data;
  }
}
