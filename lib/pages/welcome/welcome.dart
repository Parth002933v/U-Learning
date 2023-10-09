import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/welcome/notifire/welcome_notifire.dart';
import 'package:ulearning/pages/welcome/welcome_widgets.dart';

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
    // watch the changes of page index on provider
    final index = ref.watch(indexDotProvider);

    // with the screen information to the global variable
    mq = MediaQuery.of(context).size;
    h = mq.height;
    w = mq.width;

    return Scaffold(
      body: SafeArea(
        // stack to add dot indicator with pages
        child: Stack(
          children: [
            // welcome pages
            PageView(
              physics: const RangeMaintainingScrollPhysics(),
              onPageChanged: (value) {
                ref.read(indexDotProvider.notifier).changeIndex(value);
              },
              controller: _controller,
              children: [
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 1,
                  image: "assets/images/image1.png",
                  titalText: "First See Learning",
                  subTital:
                      "Forget about a for of paper all knowledge in one learning!",
                ),
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 2,
                  image: "assets/images/image2.png",
                  titalText: "Connect With Everyone",
                  subTital:
                      "Always keep in touch with your tutor & friend Let's get connected!",
                ),
                appOnBoardpage(
                  pagecontroller: _controller,
                  index: 3,
                  image: "assets/images/image3.jpg",
                  titalText: " Always Fascinated Learning",
                  subTital:
                      "Anywhere anytime the time is at your discretion. So study whenever you want",
                ),
              ],
            ),

            // dot Indicator
            Positioned(
              // height: h * 1.5,
              // width: w * 0.95,
              height: 1.h,
              width: 0.95.w,
              child: DotsIndicator(
                onTap: (value) {
                  _controller.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                dotsCount: 3,
                position: index,
                decorator: DotsDecorator(
                  size: Size.square(9.0.sp),
                  activeSize: const Size(19.0, 9.0),
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
