import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final int? maxLines;
  final TextOverflow? overflow;
  const Text16Normal({
    super.key,
    this.text = "Enter The Text",
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
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
  final FontWeight fontWeight;
  final double height;
  const Text14Normal({
    super.key,
    this.text = "Enter The Text",
    this.color = AppColors.primarySecondaryElementText,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.height = 1.35,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 14,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}

class Text12Normal extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const Text12Normal({
    super.key,
    this.text = "Enter Text",
    this.color = AppColors.primaryElementText,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const Text10Normal({
    super.key,
    this.text = "Enter Text",
    this.color = AppColors.primaryElementText,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 10,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const FadeText({
    super.key,
    this.text = "",
    this.color = AppColors.primaryElementText,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
