import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/services/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    final response = await HttpUtil().post('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      CourseDetailRequestEntity requestEntity) async {
    final response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: requestEntity.toJson(),
    );

    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity> lessonList(
      LessonListRequestEntity requestEntity) async {
    final response = await HttpUtil().post(
      "api/lessonList",
      queryParameters: requestEntity.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail(
      LessonDetailRequestEntity requestEntity) async {
    final resopnse = await HttpUtil().post(
      "api/lessonDetail",
      queryParameters: requestEntity.toJson(),
    );

    return LessonDetailResponseEntity.fromJson(resopnse);
  }
}
