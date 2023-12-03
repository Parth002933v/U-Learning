import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/style/textfield_box_decoration.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/app_textfield.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/features/home/controller/dot_index_provider.dart';
import 'package:ulearning/features/home/povider/course_list_provider.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/main.dart';

AppBar homeAppBar({required WidgetRef ref}) {
  final profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    elevation: 0,
    flexibleSpace: Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const appIconImage(image: ImageUtils.menu),
          profileState.when(
            data: (data) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                          "${AppConstants.SERVER_API_URL}${data.avatar!}"),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          )
        ],
      ),
    ),
  );
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Bold(text: 'Hello', color: AppColors.primaryThirdElementText);
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Bold(
      text: Global.storageServices.getUserProfileInfo().name.toString(),
    );
  }
}

Widget homeSearchBar() {
  return Row(
    children: [
      /// searchbar
      Container(
        height: 50.h,
        width: 305.w,
        decoration: textFieldBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: REdgeInsets.only(left: 15.w, right: 5.w),
              child: const appIconImage(image: ImageUtils.searchIcon),
            ),
            SizedBox(
              width: 240.w,
              child: appTextFieldOnly(
                hintText: 'Search Your course...',
                onchange: (value) {},
              ),
            )
          ],
        ),
      ),

      /// filter
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 10.w),
          child: const appIconImage(
              image: ImageUtils.filterIcon, width: 45, height: 45),
        ),
      ),
    ],
  );
}

Widget banner() {
  return Consumer(builder: (context, ref, child) {
    final indexP = ref.watch(homeBannerDotIndexProviderProvider);
    final indexN = ref.read(homeBannerDotIndexProviderProvider.notifier);

    PageController controller = PageController(initialPage: indexP);
    return Column(
      children: [
        SizedBox(
          height: 190.h,
          width: 370.w,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              indexN.onIndexChange(index);
            },
            children: const [
              BannerContainer(imagePath: ImageUtils.homeBanner0),
              BannerContainer(imagePath: ImageUtils.homeBanner2),
              BannerContainer(imagePath: ImageUtils.homeBanner3),
            ],
          ),
        ),
        DotsIndicator(
          onTap: (index) => controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          ),
          dotsCount: 3,
          position: indexP,
          decorator: DotsDecorator(
            size: Size.square(9.0.spMin),
            activeSize: Size(19.0.spMin, 9.0.spMin),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  });
}

class BannerContainer extends StatelessWidget {
  final String imagePath;

  const BannerContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 20.w,
      // color: Colors.red,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// see all
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: 'Choice your course',
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text14Normal(
                  text: 'See all',
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
            ],
          ),
        ),

        ///course items button
        Row(
          children: [
            courseItemContainer(text: 'All', isSelect: true),
            courseItemContainer(text: 'Popular', isSelect: false),
            courseItemContainer(text: 'Newest', isSelect: false),
          ],
        ),

        ///course grive view
      ],
    );
  }

  Container courseItemContainer({
    required String text,
    required bool isSelect,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: isSelect
            ? Border.all(color: AppColors.primarySecondaryElementText)
            : null,
        color: isSelect ? AppColors.primaryElement : AppColors.primarBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text14Normal(
        text: text,
        color: isSelect ? Colors.white : AppColors.primarySecondaryElementText,
      ),
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseListP = ref.watch(homeCourseListProvider);

    return courseListP.when(
      data: (courseList) {
        if (courseList == null) {
          return Center(
            heightFactor: 18.h,
            child: const Text('No data found'),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 20.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courseList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 13,
              childAspectRatio: 1.5,
              // mainAxisExtent: 120,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  navkey.currentState!.pushNamed(
                      AppRouteConstants.COURSE_DETAIL,
                      arguments: {'id': courseList[index].id});
                },
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    appIconImage(
                        key: key,
                        isNetwokImage: true,
                        image:
                            "${AppConstants.IMAGE_UPLOADS_PATH}${courseList[index].thumbnail}"),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 15.w, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FadeText(text: courseList[index].name!),
                          FadeText(
                            text: "${courseList[index].lessonNum!} Lessons",
                            fontSize: 10,
                            color: AppColors.primaryFourthElementText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      error: (error, stackTrace) {
        return const Center(child: Text('There Is an error in loading data'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
