class Routine {
  late String day;
  late String time;
  Subject? subject;

  Routine({required this.day, required this.time, this.subject});

  Routine.fromJson(Map<String, dynamic> json) {
    this.day = json["day"];
    this.time = json["time"];
    this.subject =
        json["subject"] == null ? null : Subject.fromJson(json["subject"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["day"] = this.day;
    data["time"] = this.time;
    if (this.subject != null) data["subject"] = this.subject!.toJson();
    return data;
  }
}

class Subject {
  late String name;
  late String teacher;

  Subject({required this.name, required this.teacher});

  Subject.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.teacher = json["teacher"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["teacher"] = this.teacher;
    return data;
  }
}

class ClassRoutine {
  late List<Days> day;
  ClassRoutine(List<Routine> routines) {
    List<Days> newDays = [];
    // List<String> weekDays = [];
    final List<String> weekDays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];
    // for (var routine in routines) {
    //   if (!weekDays.contains(routine.day)) {
    //     weekDays.add(routine.day);
    //   }
    // }
    for (var week in weekDays) {
      List<Period> period = [];
      for (var routine in routines) {
        if (routine.subject == null) {
          continue;
        }
        if (routine.day == week) {
          period.add(Period(
              teacher: routine.subject!.teacher,
              time: routine.time,
              name: routine.subject!.name));
        }
      }
      newDays.add(Days(period: period, name: week));
    }
    day = newDays;
  }
}

class Days {
  String name;
  List<Period> period;
  Days({required this.period, required this.name});
}

class Period {
  String teacher;
  String time;
  String name;

  Period({
    required this.teacher,
    required this.time,
    required this.name,
  });
}
