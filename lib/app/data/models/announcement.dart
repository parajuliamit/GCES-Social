class Announcement {
  late int id;
  late String user;
  late String title;
  late String content;
  late String? image;
  late String createdAt;
  late String category;

  Announcement(
      {required this.id,
      required this.user,
      required this.title,
      required this.content,
      this.image,
      required this.createdAt,
      required this.category});

  Announcement.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.title = json["title"];
    this.content = json["content"];
    this.image = json["image"];
    this.createdAt = json["createdAt"];
    this.category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["title"] = this.title;
    data["content"] = this.content;
    data["image"] = this.image;
    data["createdAt"] = this.createdAt;
    data["category"] = this.category;
    return data;
  }
}
