import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/style/box_decoration.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/course_include_item.dart';
import 'package:ulearning/common/widgets/shimmer_container.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';

class CourseIncludeContainer extends StatelessWidget {
  final CourseItem data;

  const CourseIncludeContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        courseIncludeItem(
            image: ImageUtils.video,
            text: '${data.videoLength ?? '0'} HOURS Video'),
        SizedBox(height: 10.h),
        courseIncludeItem(
            image: ImageUtils.file,
            text: 'Total ${data.lessonNum ?? '0'}+ Lesson'),
        SizedBox(height: 10.h),
        courseIncludeItem(
            image: ImageUtils.download,
            text: '${data.downloadeNum ?? '0'} Download resource'),
      ],
    );
  }
}

class CourseIncludesText extends StatelessWidget {
  const CourseIncludesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text16Normal(
      text: "The Course Includes",
      fontWeight: FontWeight.bold,
      color: AppColors.primaryText,
    );
  }
}

class CourseDescreption extends StatelessWidget {
  final CourseItem data;

  const CourseDescreption({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text14Normal(
      text: data.descreption ?? '',
      textAlign: TextAlign.start,
      color: AppColors.primarySecondaryElementText,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
  }
}

class CourseName extends StatelessWidget {
  final CourseItem data;
  const CourseName({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text16Normal(
      text: data.name!,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CourseDetailThumbnail extends StatelessWidget {
  final String thumbnail;
  const CourseDetailThumbnail({
    super.key,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: appIconImage(
        isNetwokImage: true,
        image: "${AppConstants.IMAGE_UPLOADS_PATH}$thumbnail",
        height: 200.h,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

class CourseStatus extends StatelessWidget {
  final CourseItem data;
  const CourseStatus({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: buildBoxDecoration(),
          child: const Text10Normal(
            text: 'BESTSEALER',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 30.w),
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child:
              appIconImage(height: 20.h, width: 20.w, image: ImageUtils.people),
        ),
        Text14Normal(
          // text: "5.7k",
          // text: data.follow.toString() ?? '0',
          text: data.follow == null ? '0' : data.follow.toString(),
          color: AppColors.primaryThirdElementText,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: 30.w),
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child:
              appIconImage(height: 20.h, width: 20.w, image: ImageUtils.star),
        ),
        Text14Normal(
          // text: "4.6",
          text: data.score == null ? '0.0' : data.score.toString(),
          color: AppColors.primaryThirdElementText,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}

class CourseDetailLoading extends StatelessWidget {
  const CourseDetailLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ShimmerContainer(
              height: 190.h,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 15.h),
          ShimmerContainer(width: 250),
          SizedBox(height: 15.h),
          ShimmerContainer(width: 80),
          SizedBox(height: 15.h),
          ShimmerContainer(height: 20, width: 200),
          SizedBox(height: 15.h),
          ShimmerContainer(height: 20, width: 240),
          SizedBox(height: 15.h),
          ShimmerContainer(height: 20, width: 260),
          SizedBox(height: 15.h),
          ShimmerContainer(width: 150),
          SizedBox(height: 15.h),
          Row(
            children: [
              courseIncludeItem(image: ImageUtils.video, text: ''),
              ShimmerContainer(height: 20)
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              courseIncludeItem(image: ImageUtils.video, text: ''),
              ShimmerContainer(height: 20)
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              courseIncludeItem(image: ImageUtils.video, text: ''),
              ShimmerContainer(height: 20)
            ],
          ),
          SizedBox(height: 20.h),
          ShimmerContainer(width: 100),
          SizedBox(height: 15.h),
          ShimmerContainer(width: double.infinity, height: 100),
        ],
      ),
    );
  }
}
