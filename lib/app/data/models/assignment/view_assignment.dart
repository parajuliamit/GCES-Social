class ViewAssignment {
  late int id;
  late String user;
  late String title;
  late String createdAt;
  late String description;
  String? file;
  late String submissionDate;
  late List<Submissions> submissions;

  ViewAssignment(
      {required this.id,
      required this.user,
      required this.title,
      required this.createdAt,
      required this.description,
      this.file,
      required this.submissionDate,
      required this.submissions});

  ViewAssignment.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.title = json["title"];
    this.createdAt = json["createdAt"];
    this.description = json["description"];
    this.file = json["file"];
    this.submissionDate = json["submissionDate"];
    this.submissions = (json["submissions"] == null
        ? null
        : (json["submissions"] as List)
            .map((e) => Submissions.fromJson(e))
            .toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["title"] = this.title;
    data["createdAt"] = this.createdAt;
    data["description"] = this.description;
    data["file"] = this.file;
    data["submissionDate"] = this.submissionDate;
    if (this.submissions != null)
      data["submissions"] = this.submissions.map((e) => e.toJson()).toList();
    return data;
  }
}

class Submissions {
  late int id;
  String? file;
  late String createdAt;
  bool? isApproved;
  String? teacherComment;
  late int assignment;
  late int user;

  Submissions(
      {required this.id,
      this.file,
      required this.createdAt,
      this.isApproved,
      this.teacherComment,
      required this.assignment,
      required this.user});

  Submissions.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.file = json["file"];
    this.createdAt = json["createdAt"];
    this.isApproved = json["is_approved"];
    this.teacherComment = json["teacher_comment"];
    this.assignment = json["assignment"];
    this.user = json["user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["file"] = this.file;
    data["createdAt"] = this.createdAt;
    data["is_approved"] = this.isApproved;
    data["teacher_comment"] = this.teacherComment;
    data["assignment"] = this.assignment;
    data["user"] = this.user;
    return data;
  }
}
