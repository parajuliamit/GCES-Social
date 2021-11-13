class Event {
  late String title;
  late String date;

  Event({required this.title, required this.date});

  Event.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["date"] = this.date;
    return data;
  }
}
