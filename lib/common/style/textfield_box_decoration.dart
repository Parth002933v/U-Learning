import 'package:flutter/material.dart';
import 'package:ulearning/common/style/app_colors.dart';

BoxDecoration textFieldBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: AppColors.primaryFourthElementText,
    ),
    boxShadow: customBoxShadow(),
    borderRadius: BorderRadius.circular(15),
    //color: Colors.red
  );
}

List<BoxShadow> customBoxShadow({MaterialColor color = Colors.grey}) {
  return [
    BoxShadow(
      color: color.shade200,
      blurRadius: 5,
      spreadRadius: 1,
      offset: const Offset(0, 2),
    ),
  ];
}
