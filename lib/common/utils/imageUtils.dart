import 'package:flutter/material.dart';

class ImageUtils {
  static Future<void> precacheAssetImages(
      BuildContext context, List<String> assetPaths) {
    return Future.wait(
      assetPaths.map((path) => precacheImage(AssetImage(path), context)),
    );
  }
}
