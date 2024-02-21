import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text, this.fontWeight, this.fontSize, this.textAlign, this.textColor})
      : super(key: key);
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize:  fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
