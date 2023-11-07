import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/features/welcome/provider/welcome_notifire.dart';
import 'package:ulearning/features/welcome/view/widget/welcome_widgets.dart';


class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
  // controller for PageView
  final PageController _controller = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final indexN = ref.read(indexDotProvider.notifier);
    final indexP = ref.watch(indexDotProvider);

    // with the screen information to the global variable

    return Scaffold(
      body: SafeArea(
        // stack to add dot indicator with pages
        child: Stack(
          children: [
            // welcome pages

            PageView(
              physics: const RangeMaintainingScrollPhysics(),
              onPageChanged: (value) {
                indexN.changeIndex(value);
              },
              controller: _controller,
              children: [
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 1,
                  image: WelcomeImageConstant.onboardImage1,
                  titalText: "First See Learning",
                  subTital:
                      "Forget about a for of paper all knowledge in one learning!",
                ),
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 2,
                  image: WelcomeImageConstant.onboardImage2,
                  titalText: "Connect With Everyone",
                  subTital:
                      "Always keep in touch with your tutor & friend Let's get connected!",
                ),
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 3,
                  image: WelcomeImageConstant.onboardImage3,
                  titalText: " Always Fascinated Learning",
                  subTital:
                      "Anywhere anytime the time is at your discretion. So study whenever you want",
                ),
              ],
            ),

            // dot Indicator
            PositionedDirectional(
              start: 170.w,
              bottom: 150.h,
              child: DotsIndicator(
                onTap: (value) {
                  _controller.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                dotsCount: 3,
                position: indexP,
                decorator: DotsDecorator(
                  size: Size.square(9.0.spMin),
                  activeSize: Size(19.0.spMin, 9.0.spMin),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
