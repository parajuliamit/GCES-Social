class WriteBlogRequest {
  late String title;
  late String content;

  WriteBlogRequest({required this.title, required this.content});

  WriteBlogRequest.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["content"] = this.content;
    return data;
  }
}
