import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.text,
      required this.color,
      required this.weight,
      required this.fontSize,
      this.textAlign});
  final String text;
  final Color color;
  final FontWeight weight;
  final double fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(color: color, fontWeight: weight, fontSize: fontSize),
    );
  }
}
