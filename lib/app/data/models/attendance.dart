class Attendance {
  String subjectName;
  int totalClasses;
  int presentClasses;
  late int absentClasses;
  late int percentage;

  Attendance(
      {required this.subjectName,
      this.presentClasses = 0,
      this.totalClasses = 0}) {
    absentClasses = totalClasses - presentClasses;
    if (totalClasses == 0) {
      percentage = 100;
    } else {
      percentage = ((presentClasses / totalClasses) * 100).truncate();
    }
  }
}
