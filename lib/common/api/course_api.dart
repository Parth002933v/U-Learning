import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/common/services/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    final response = await HttpUtil().post('api/course_list');

    return CourseListResponseEntity.fromJson(response);
  }
}
