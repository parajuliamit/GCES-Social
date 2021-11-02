import 'package:flutter/material.dart';

const baseUrl = 'http://06d5-27-34-108-177.ngrok.io/api/';

final TextStyle kDrawerTitleText =
    TextStyle(fontSize: 17, color: Colors.grey[700]);
const TextStyle kSmallText = TextStyle(color: Colors.white, fontSize: 16);
const TextStyle kMediumText = TextStyle(
    color: Colors.black45,
    fontSize: 22,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5);
const TextStyle kLargeText = TextStyle(
  color: Colors.white70,
  fontSize: 30,
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.0, 3.0),
      blurRadius: 3.0,
      color: Colors.grey,
    ),
    Shadow(
      offset: Offset(2.0, 3.0),
      blurRadius: 8.0,
      color: Color.fromARGB(125, 0, 0, 100),
    ),
  ],
);

const Color kGreenishBlue = Color(0xEE49adc4);
const Color kBackgroundColor = Color(0xFF323061);

const kInputDecoration = InputDecoration(
  counterText: '',
  counterStyle: TextStyle(fontSize: 0),
  hintStyle: TextStyle(color: Color(0xAAFFFFFF)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
);

const kBlogInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.5),
  ),
);

const TextStyle kInputTextStyle = TextStyle(color: Colors.white, fontSize: 20);

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays > 1) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays == 1) {
    return 'A day ago';
  } else if (diff.inHours > 1) {
    return '${diff.inHours} hours ago';
  } else if (diff.inHours == 1) {
    return '${diff.inHours} hour ago';
  } else if (diff.inMinutes == 1) {
    return '${diff.inMinutes} minute ago';
  } else if (diff.inMinutes > 1) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inSeconds > 1) {
    return '${diff.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
