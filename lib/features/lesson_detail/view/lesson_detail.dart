// import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/style/box_decoration.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/common/widgets/shimmer_container.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/features/lesson_detail/provider/lesson_detail_provider.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  // late final int lessonID;
  late ChewieController chewieController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // var arg = ModalRoute.of(context)!.settings.arguments as Map;
    // lessonID = arg['id'];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoPlayerController?.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessondetailVideoP = ref.watch(lessonDetailVideoProvider);
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: lessondetailVideoP.value == null
            ? const Center(child: CircularProgressIndicator())
            : lessondetailVideoP.when(
                data: (data) {
                  if (data!.videoList.isEmpty) {
                    return const Center(child: Text('lessons is empty'));
                  }

                  return ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: data.initializeVideoPlayer,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                /// play video
                                return handleVideoPlayer();
                              }
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                enabled: true,
                                child: Center(
                                  child: ShimmerContainer(
                                    height: 190.h,
                                    width: double.infinity,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.videoList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                ref
                                    .read(lessonDetailVideoProvider.notifier)
                                    .playNext(
                                        url: data.videoList[index].url!,
                                        index: index);
                              },
                              child: Container(
                                height: 90.h,
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                decoration: buildBoxDecoration(
                                    color: data.index == index
                                        ? Colors.black12
                                        : Colors.white,
                                    giveShadow: true),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    appIconImage(
                                      isNetwokImage: true,
                                      image:
                                          "${AppConstants.IMAGE_UPLOADS_PATH}${data.videoList[index].thumbnail}",
                                      height: 70.h,
                                      width: 70.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    SizedBox(
                                      width: 210.w,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text14Normal(
                                          text: data.videoList[index].name!,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryText,
                                          maxLines: 1,
                                        ),
                                      ),
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
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
                error: (error, stackTrace) {
                  return const Center(child: Text('error'));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
      ),
    );
  }

  AspectRatio handleVideoPlayer() {
    chewieController = ChewieController(
      aspectRatio: videoPlayerController!.value.aspectRatio,
      videoPlayerController: videoPlayerController!,
    );
    return AspectRatio(
      aspectRatio: videoPlayerController!.value.aspectRatio,
      child: Stack(
        children: [
          Chewie(
            controller: chewieController,
          )
        ],
      ),
    );
  }
}
