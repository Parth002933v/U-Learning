import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/features/application/provider/navigation_bar_notifire.dart';
import 'package:ulearning/features/application/view/widget/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarProvider);
    return Scaffold(
      appBar: buildAppBar(tital: 'Home'),
      body: ScreenOfIndex(index: index, context: context),
      bottomNavigationBar: Container(
        width: 350.w,
        height: 62.h,
        decoration: const BoxDecoration(color: Colors.red),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (index) =>
              ref.read(navBarProvider.notifier).onChangeIndex(index),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryElement,
          unselectedItemColor: AppColors.primaryFourthElementText,
          items: bottomTab,
        ),
      ),
    );
  }
}
