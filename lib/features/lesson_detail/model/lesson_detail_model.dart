import 'package:ulearning/common/model/Data.dart';

class LessonVideoState {
  // final void initializeVideoPlayer;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;
  final String? url;
  final List<Video> videoList;
  final int? index;
  LessonVideoState({
    this.initializeVideoPlayer,
    this.isPlay = false,
    this.url = '',
    this.videoList = const <Video>[],
    this.index = 0,
  });

  LessonVideoState copyWith({
    Future<void>? initializeVideoPlayer,
    bool? isPlay,
    String? url,
    List<Video>? videoList,
    int? index,
  }) {
    return LessonVideoState(
        initializeVideoPlayer:
            initializeVideoPlayer ?? this.initializeVideoPlayer,
        isPlay: isPlay ?? this.isPlay,
        url: url ?? this.url,
        videoList: videoList ?? this.videoList,
        index: index ?? this.index);
  }
}
