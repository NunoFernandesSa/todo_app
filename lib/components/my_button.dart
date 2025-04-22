import 'package:flutter/material.dart';

/// A custom button widget that wraps a MaterialButton.
/// It allows you to specify the button text, an onPressed callback,
class MyButton extends StatelessWidget {
  /// The text to be displayed on the button.
  /// This parameter is required and must not be null.
  final String textButton;

  /// The callback function to be executed when the button is pressed.
  /// This parameter is required and must not be null.
  final VoidCallback onPressed;

  /// The background color of the button.
  /// This parameter is optional and defaults to the primary color of the current theme if not provided.
  final Color? color;

  /// constructor for the MyButton widget.
  /// The [textButton] parameter is required and specifies the text to be displayed on the button.
  /// The [onPressed] parameter is required and specifies the callback function to be executed when the button is pressed.
  /// The [color] parameter is optional and specifies the button's background color.
  const MyButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.color,
  });

  /// The build method returns a MaterialButton widget.
  /// The button's text is set to the value of [textButton], and the onPressed callback is set to the value of [onPressed].
  /// If the [color] parameter is not provided, it defaults to the primary color of the current theme.
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(textButton.toString()),
    );
  }
}
