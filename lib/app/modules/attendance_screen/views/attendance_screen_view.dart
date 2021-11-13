// import 'package:flutter/material.dart';
// import 'package:gces_social/app/data/models/attendance.dart';

// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// import '../controllers/attendance_screen_controller.dart';

// List<Attendance> classes = [
//   Attendance(
//       subjectName: 'Object Oriented Software Development',
//       totalClasses: 35,
//       presentClasses: 20),
//   Attendance(subjectName: 'Computer Network'),
//   Attendance(
//       subjectName: 'Principles of Programming Language',
//       totalClasses: 25,
//       presentClasses: 22),
//   Attendance(
//       subjectName: 'Engineering Economics',
//       totalClasses: 45,
//       presentClasses: 20),
//   Attendance(
//       subjectName: 'Multimedia Systems', totalClasses: 25, presentClasses: 20),
// ];

// class AttendanceScreenView extends GetView<AttendanceScreenController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: const Text('Attendance'),
//         ),
//         body: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: ListView.builder(
//               itemCount: classes.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 2,
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 20, horizontal: 10),
//                     child: Column(
//                       children: [
//                         Text(
//                           classes[index].subjectName,
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             NumberText(
//                               text: 'Total Classes',
//                               number: '${classes[index].totalClasses}',
//                             ),
//                             NumberText(
//                               text: 'Present',
//                               number: '${classes[index].presentClasses}',
//                             ),
//                             NumberText(
//                               text: 'Absent',
//                               number: '${classes[index].absentClasses}',
//                             ),
//                             CircularPercentIndicator(
//                               radius: 55.0,
//                               lineWidth: 5.0,
//                               percent: classes[index].percentage / 100,
//                               center: Text(
//                                 "${classes[index].percentage}%",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               progressColor: classes[index].percentage >= 80
//                                   ? Colors.green
//                                   : Colors.red,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ));
//   }
// }

// class NumberText extends StatelessWidget {
//   final String text;
//   final String number;

//   const NumberText({Key? key, required this.text, required this.number})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           number,
//           style: const TextStyle(fontSize: 18),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(text),
//       ],
//     );
//   }
// }
