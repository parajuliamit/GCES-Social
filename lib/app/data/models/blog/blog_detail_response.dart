class BlogDetailResponse {
  late int? id;
  late String user;
  late String title;
  late String createdAt;
  late int likes;
  late int commentCount;
  late String content;
  late List<Comment>? comment;

  BlogDetailResponse(
      {this.id,
      this.user = 'Anonymous',
      this.title = 'Unknown',
      this.createdAt = 'Now',
      this.likes = 0,
      this.commentCount = 0,
      this.content = 'Null',
      this.comment});

  BlogDetailResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.title = json["title"];
    this.createdAt = json["createdAt"];
    this.likes = json["likes"];
    this.commentCount = json["comment_count"];
    this.content = json["content"];
    this.comment = json["comment"] == null
        ? null
        : (json["comment"] as List).map((e) => Comment.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["title"] = this.title;
    data["createdAt"] = this.createdAt;
    data["likes"] = this.likes;
    data["comment_count"] = this.commentCount;
    data["content"] = this.content;
    if (this.comment != null)
      data["comment"] = this.comment!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Comment {
  late int id;
  late String user;
  late String comment;
  late String createdAt;

  Comment(
      {required this.id,
      required this.user,
      required this.comment,
      required this.createdAt});

  Comment.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.user = json["user"];
    this.comment = json["comment"];
    this.createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user"] = this.user;
    data["comment"] = this.comment;
    data["createdAt"] = this.createdAt;
    return data;
  }
}
