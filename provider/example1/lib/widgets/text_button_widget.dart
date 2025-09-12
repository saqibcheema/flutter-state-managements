import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  VoidCallback? onPressed = (){};
  TextButtonWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.blue)),
      ),
    );
  }
}
