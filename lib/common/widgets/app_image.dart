import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/shimmer_container.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';

// Widget AppImage({
//   String image = ImageUtils.defaultImg,
//   double height = 20,
//   double width = double.infinity,
//   bool isIcon = false,
//   BoxFit fit = BoxFit.fitWidth,
// }) {
//   final ImageProvider myImage = AssetImage(image);
//
//   return Image(
//     image: myImage,
//     fit: fit,
//     height: isIcon ? 30.h : height,
//     width: isIcon ? 20.w : width,
//   );
// }
class AppImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final bool isIcon;
  final BoxFit fit;
  final bool isNetwokImage;

  const AppImage({
    Key? key,
    this.image = ImageUtils.defaultImg,
    this.height = 20,
    this.width = double.infinity,
    this.isIcon = false,
    this.fit = BoxFit.fitWidth,
    this.isNetwokImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageProvider myImage = AssetImage(image);

    return Image(
      image: myImage,
      fit: fit,
      height: isIcon ? 30 : height,
      width: isIcon ? 20 : width,
    );
  }
}

// Widget appIconImage({
//   String image = ImageUtils.defaultImg,
//   double width = 20,
//   double height = 20,
// }) {
//   final ImageProvider myImage = AssetImage(image);
//   return Image.asset(
//     image,
//     fit: BoxFit.fill,
//     height: height.h,
//     width: width.w,
//   );
// }
class appIconImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final bool isNetwokImage;
  final BoxFit fit;

  const appIconImage({
    Key? key,
    this.image = ImageUtils.defaultImg,
    this.width = 20,
    this.fit = BoxFit.fill,
    this.height = 20,
    this.isNetwokImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNetwokImage
        ? CachedNetworkImage(
            key: key,
            imageUrl: image,
            // placeholder: (context, url) => ShimmerContainer(),
            errorWidget: (context, url, error) => const appIconImage(
              image: ImageUtils.defaultImg,
            ),
            width: width,
            fit: fit,
            height: height,
          )
        : Image.asset(
            image,
            fit: fit,
            height: height,
            width: width,
          );
  }
}

class AppNetworImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final bool isCircle;
  final double height;
  final double width;
  final CourseItem? course;
  final void Function()? onTap;
  const AppNetworImage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.isCircle = false,
    this.height = 40,
    this.width = 40,
    this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        key: UniqueKey(),
        padding: EdgeInsets.only(left: 10.w, right: 15.w, bottom: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(
              imagePath,
            ),
            fit: fit,
          ),
        ),
        child: course == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeText(text: course!.name!),
                  FadeText(
                    text: "${course!.lessonNum!} Lessons",
                    fontSize: 10,
                    color: AppColors.primaryFourthElementText,
                  ),
                ],
              ),
      ),
    );
  }
}
