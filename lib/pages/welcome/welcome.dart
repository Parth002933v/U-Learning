import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/welcome/notifire/welcome_notifire.dart';
import 'package:ulearning/pages/welcome/welcome_widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  // controller for PageView
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPageChanged: (value) {
                ref.read(indexDotProvider.notifier).changeIndex(value);
              },
              controller: _controller,
              children: [
                appOnBoardpage(
                  context: context,
                  Pagecontroller: _controller,
                  index: 1,
                  image: "assets/images/image1.png",
                  titalText: "First See Learning",
                  subTital:
                      "Forget about a for of paper all knowledge in one learning!",
                ),
                appOnBoardpage(
                  context: context,
                  Pagecontroller: _controller,
                  index: 2,
                  image: "assets/images/image2.png",
                  titalText: "Connect With Everyone",
                  subTital:
                      "Always keep in touch with your tutor & friend Let's get connected!",
                ),
                appOnBoardpage(
                  context: context,
                  Pagecontroller: _controller,
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
              height: h * 1.5,
              width: w * 0.95,
              child: DotsIndicator(
                dotsCount: 3,
                position: index,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
