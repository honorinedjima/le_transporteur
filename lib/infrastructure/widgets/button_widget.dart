import 'package:flutter/material.dart';
import 'package:le_transporteur/infrastructure/widgets/text_widget.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextWidget(
        text: text,
        textColor: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
      ),
    );
  }
}
