import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final Padding? padding;

  const CustomText({
    Key? key,
    required this.title,
    this.color,
    this.fontStyle,
    this.textAlign,
    this.padding,
    this.fontWeight,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.white,
        fontFamily: 'Poppins',
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: 20,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
