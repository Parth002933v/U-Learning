import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/api/course_api.dart';
import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/features/lesson_detail/model/lesson_detail_model.dart';
import 'package:ulearning/features/lesson_detail/view/lesson_detail.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController? videoPlayerController;

final lessonDetailProvider = FutureProvider.autoDispose.family<void, int>(
  (ref, int lessonID) async {
    LessonDetailRequestEntity requestEntity = LessonDetailRequestEntity();
    requestEntity.lessonID = lessonID;

    final response = await CourseApi.lessonDetail(requestEntity);

    if (response.code == 200) {
      //
      var url =
          "${AppConstants.IMAGE_UPLOADS_PATH}${response.data?.video?.first.url}";

      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

      final initializeVideoPlayer = videoPlayerController?.initialize();

      videoPlayerController?.play();
      final lessonVideoState = LessonVideoState(
        initializeVideoPlayer: initializeVideoPlayer,
        isPlay: true,
        videoList: response.data!.video!,
        url: url,
      );

      ref
          .read(lessonDetailVideoProvider.notifier)
          .updateLessonData(lessonVideoState);

      // ref.read(lessonDetailVideoProvider.notifier);
    } else {
      ref.read(lessonDetailVideoProvider.notifier).fail();
    }
  },
);

///=====================lessonDetailVideoProvider===============================
class LessonDetailVideoNotifire
    extends StateNotifier<AsyncValue<LessonVideoState?>> {
  LessonDetailVideoNotifire() : super(const AsyncValue.data(null));

  void updateLessonData(LessonVideoState lessonVideoState) {
    state = state.whenData(
      (currentState) {
        return LessonVideoState().copyWith(
          videoList: lessonVideoState.videoList,
          url: lessonVideoState.url,
          isPlay: lessonVideoState.isPlay,
          initializeVideoPlayer: lessonVideoState.initializeVideoPlayer,
        );
      },
    );
  }

  void playNext({required int index, required String url}) {
    if (videoPlayerController != null) {
      videoPlayerController!.pause();
      videoPlayerController!.dispose();
    }
    state = AsyncValue.data(
      state.value!.copyWith(isPlay: false, initializeVideoPlayer: null),
    );

    var Vidurl = "${AppConstants.IMAGE_UPLOADS_PATH}$url";

    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(Vidurl));

    final initializeVideoPlayer = videoPlayerController?.initialize();

    state = AsyncValue.data(
      state.value!.copyWith(
        isPlay: true,
        initializeVideoPlayer: initializeVideoPlayer,
        index: index,
      ),
    );

    videoPlayerController!.play();
  }

  Future<void> fail() async {
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncValue.data(LessonVideoState());
  }
}

final lessonDetailVideoProvider = StateNotifierProvider.autoDispose<
    LessonDetailVideoNotifire, AsyncValue<LessonVideoState?>>(
  (ref) => LessonDetailVideoNotifire(),
);
