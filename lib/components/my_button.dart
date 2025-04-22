import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color? color;

  const MyButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color ?? Theme.of(context).primaryColor,
      child: Text(textButton.toString()),
    );
  }
}
