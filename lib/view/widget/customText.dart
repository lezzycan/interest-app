import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 26.sp,
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight ?? FontWeight.bold),
    );
  }
}