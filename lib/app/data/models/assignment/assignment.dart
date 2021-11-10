class Assignment {
  late int id;
  late String user;
  late String title;
  late String submissionDate;
  late String status;

  Assignment(
      {required this.id,
      required this.user,
      required this.title,
      required this.submissionDate,
      required this.status});

  Assignment.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.title = json["title"];
    this.submissionDate = json["submissionDate"];
    this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["title"] = this.title;
    data["submissionDate"] = this.submissionDate;
    data["status"] = this.status;
    return data;
  }
}
