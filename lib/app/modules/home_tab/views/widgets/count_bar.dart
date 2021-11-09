// import 'package:flutter/material.dart';
// import 'package:gces_social/app/modules/home/controllers/home_controller.dart';
// import 'package:gces_social/app/routes/app_pages.dart';
// import 'package:get/get.dart';

// import 'column_text.dart';

// class CountBar extends StatelessWidget {
//   const CountBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 4,
//               offset: const Offset(-1, 3)),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           ColumnText(
//               count: 8,
//               title: 'Notices',
//               onPress: () {
//                 Get.find<HomeController>().goToAnnouncements();
//               }),
//           ColumnText(
//             count: 5,
//             title: 'Assignments',
//             onPress: () {
//               Get.toNamed(Routes.ASSIGNMENT_SCREEN);
//             },
//           ),
//           ColumnText(
//             count: 2,
//             title: 'Messages',
//             onPress: () {
//               // Get.find<HomeController>().goToMessage();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
