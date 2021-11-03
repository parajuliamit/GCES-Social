class Suggestion {
  late bool isAnonymous;
  late String content;

  Suggestion({required this.isAnonymous, required this.content});

  Suggestion.fromJson(Map<String, dynamic> json) {
    this.isAnonymous = json["is_anonymous"];
    this.content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["is_anonymous"] = this.isAnonymous;
    data["content"] = this.content;
    return data;
  }
}
