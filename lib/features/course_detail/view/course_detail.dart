import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/style/box_decoration.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/features/course_detail/provider/provder.dart';
import 'package:ulearning/features/course_detail/widgets/widgets.dart';

class CourseDetaild extends ConsumerStatefulWidget {
  const CourseDetaild({super.key});

  @override
  ConsumerState<CourseDetaild> createState() => _CourseDetaildState();
}

class _CourseDetaildState extends ConsumerState<CourseDetaild> {
  late final int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    id = arg['id'];
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(courseDetailProvider(id.toInt()));
    return Scaffold(
      appBar: buildAppBar(tital: 'Course'),
      body: RefreshIndicator(
        onRefresh: () async {
          return await ref.refresh(courseDetailProvider(id.toInt()));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.when(
                  data: (data) {
                    return data == null
                        ? const Center(child: Text('No data Found'))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CourseDetailThumbnail(thumbnail: data.thumbnail!),
                              SizedBox(height: 15.h),
                              CourseStatus(data: data),
                              SizedBox(height: 30.h),
                              CourseName(data: data),
                              SizedBox(height: 15.h),
                              CourseDescreption(data: data),
                              SizedBox(height: 20.h),
                              const AppButton(buttonName: 'Go Buy'),
                              SizedBox(height: 20.h),
                              const CourseIncludesText(),
                              SizedBox(height: 15.h),
                              CourseIncludeContainer(data: data),
                              SizedBox(height: 20.h),
                            ],
                          );
                  },
                  error: (error, stackTrace) {
                    return const Text('Error while retrieving data');
                  },
                  loading: () {
                    return const CourseDetailLoading();
                  },
                ),
                const Text16Normal(
                  text: "Lesson List",
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 90.h,
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: buildBoxDecoration(
                      color: AppColors.primarBackground, giveShadow: true),
                  child: Row(
                    children: [
                      appIconImage(
                          image: ImageUtils.lesson, height: 70.h, width: 70.w),
                      const SizedBox(width: 10),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text14Normal(
                            text: "What are UI Design",
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                          Text12Normal(
                            text: 'What are UI design ?',
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const appIconImage(
                        image: ImageUtils.arrowRight,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
