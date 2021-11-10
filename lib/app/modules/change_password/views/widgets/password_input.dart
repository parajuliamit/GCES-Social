import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const PasswordInput({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: !showPassword,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child:
                  Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            ),
            label: Text(widget.label),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
