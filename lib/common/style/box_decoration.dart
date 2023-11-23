import 'package:flutter/material.dart';
import 'package:ulearning/common/style/app_colors.dart';

BoxDecoration buildBoxDecoration(
    {Color color = AppColors.primaryElement, bool giveShadow = false}) {
  return BoxDecoration(
    border: Border.all(
      color: Colors.transparent,
    ),
    color: color,
    borderRadius: BorderRadius.circular(6),
    boxShadow: giveShadow == false
        ? null
        : [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 9,
              spreadRadius: 1,
              offset: const Offset(-2, 2),
            ),
          ],
  );
}
