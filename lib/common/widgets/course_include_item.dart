import 'package:flutter/material.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';

Row courseIncludeItem(
    {String image = ImageUtils.defaultImg, String text = 'Enter The Text'}) {
  return Row(
    children: [
      appIconImage(image: image, height: 35, width: 35),
      const SizedBox(width: 15),
      Text16Normal(text: text, fontWeight: FontWeight.w600),
    ],
  );
}
