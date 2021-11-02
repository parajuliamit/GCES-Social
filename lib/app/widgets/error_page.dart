import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback onPress;
  final String errorMessage;
  const ErrorPage(
    this.errorMessage,
    this.onPress, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/error.json',
            repeat: false,
            width: 150,
            height: 150,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(height: 30),
          const Text(
            'Oops!',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.blueGrey),
          ),
          Text(
            errorMessage,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.blueGrey),
          ),
          const SizedBox(height: 30),
          MaterialButton(
              elevation: 0,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.red[800],
              onPressed: onPress),
        ],
      ),
    );
  }
}
