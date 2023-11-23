import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/features/home/povider/course_list_provider.dart';
import 'package:ulearning/features/home/view/widgets/widgets.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: homeAppBar(ref: ref),
      body: RefreshIndicator(
        onRefresh: () async {
          return await ref.refresh(homeCourseListProvider);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            primary: false,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                const HelloText(),
                const UserName(),
                SizedBox(height: 10.h),
                homeSearchBar(),
                SizedBox(height: 20.h),
                banner(),
                SizedBox(height: 10.h),
                const HomeMenuBar(),
                CourseItemGrid(ref: ref)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
