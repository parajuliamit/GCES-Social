class BlogResponse {
  late int id;
  late String user;
  late String title;
  late String createdAt;
  late int likes;
  late int commentCount;

  BlogResponse(
      {required this.id,
      required this.user,
      required this.title,
      required this.createdAt,
      required this.likes,
      required this.commentCount});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.title = json["title"];
    this.createdAt = json["createdAt"];
    this.likes = json["likes"];
    this.commentCount = json["comment_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["title"] = this.title;
    data["createdAt"] = this.createdAt;
    data["likes"] = this.likes;
    data["comment_count"] = this.commentCount;
    return data;
  }
}
