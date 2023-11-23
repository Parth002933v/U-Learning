import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/services/http_util.dart';

class CourseDetailRepo {
  static Future<CourseDetailResponseEntity> courseDetail(
      CourseDetailRequestEntity requestEntity) async {
    final response = await HttpUtil()
        .post('api/course_detail', queryParameters: requestEntity.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }
}
