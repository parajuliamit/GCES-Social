class VerifyOtp {
  late String otp;
  late String user;

  VerifyOtp({required this.otp, required this.user});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    this.otp = json["otp"];
    this.user = json["user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["otp"] = this.otp;
    data["user"] = this.user;
    return data;
  }
}
