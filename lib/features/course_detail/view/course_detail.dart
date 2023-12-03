import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/style/box_decoration.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/common/widgets/shimmer_container.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/features/course_detail/provider/provder.dart';
import 'package:ulearning/features/course_detail/widgets/widgets.dart';

class CourseDetaild extends ConsumerStatefulWidget {
  const CourseDetaild({super.key});

  @override
  ConsumerState<CourseDetaild> createState() => _CourseDetaildState();
}

class _CourseDetaildState extends ConsumerState<CourseDetaild> {
  late int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    id = arg['id'];
  }

  @override
  Widget build(BuildContext context) {
    final courseDetailP = ref.watch(courseDetailProvider(id.toInt()));
    final data = ref.watch(lessonListProvider(id.toInt()));
    return Scaffold(
      appBar: buildAppBar(tital: 'Course'),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return await ref.refresh(courseDetailProvider(id.toInt()));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                courseDetailP.when(data: (data) {
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
                          ],
                        );
                }, error: (error, stackTrace) {
                  return const Text('Error while retrieving data');
                }, loading: () {
                  return const CourseDetailLoading();
                }),
                SizedBox(height: 20.h),
                data.when(
                  data: (data) {
                    return data == null
                        ? const Text16Normal(
                            text: "Lesson List is empty",
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          )
                        : LessonList(lessonList: data, ref: ref);
                  },
                  error: (error, stackTrace) {
                    return const Text('Error while retrieving data');
                  },
                  loading: () {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerContainer(width: 100),
                          SizedBox(height: 15.h),
                          ShimmerContainer(width: double.infinity, height: 100),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
