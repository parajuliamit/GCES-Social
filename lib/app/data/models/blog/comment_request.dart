class CommentRequest {
  late String comment;
  late String blog;

  CommentRequest({required this.comment, required this.blog});

  CommentRequest.fromJson(Map<String, dynamic> json) {
    this.comment = json["comment"];
    this.blog = json["blog"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["comment"] = this.comment;
    data["blog"] = this.blog;
    return data;
  }
}
