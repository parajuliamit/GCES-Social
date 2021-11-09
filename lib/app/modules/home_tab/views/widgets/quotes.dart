import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  String? quote;
  void getQuote() async {
    try {
      var response = await Dio().get('https://zenquotes.io/api/today');

      var data = jsonDecode(response.toString());
      quote = data[0]['q'] + ' - ' + data[0]['a'];
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      quote ?? '"A goal without plan is just a wish."',
      //https://zenquotes.io/api/today
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          color: Colors.blueGrey),
    );
  }
}
