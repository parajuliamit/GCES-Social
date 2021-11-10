import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  final List<String> quotes = [
    '"You will never do anything in this world without courage. It is the greatest quality of the mind next to honor." - James Allen',
    '"Don\'t seek, don\'t avoid, don\'t expect. Take what comes and be happy." - Maxime Lagace',
    '"We know nothing of tomorrow, our business is to be good and happy today." - Sydney Smith',
    '"A goal without plan is just a wish." - Benjamin Franklin',
    '"The only thing we have to fear is fear itself." - Franklin D. Roosevelt',
    '"Each day your life grows a day shorter. Make every move count." - Ming-Dao Deng'
        '"Inspire yourself to be great. Being good isn\'t good enough." - Gurbaksh Chahal'
  ];
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
      quote ?? quotes[Random().nextInt(quotes.length)],
      //https://zenquotes.io/api/today
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          color: Colors.blueGrey),
    );
  }
}
