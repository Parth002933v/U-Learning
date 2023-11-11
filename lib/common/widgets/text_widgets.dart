import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';

Widget text24Bold({
  String text = "First See Learning",
  Color color = AppColors.primaryText,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24.spMin,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget text20Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 20.spMin,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize:
            16, // Assuming you have a defined conversion from sp to pixels
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;

  const Text14Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize:
            14, // Assuming you have a defined conversion from sp to pixels
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }
}
