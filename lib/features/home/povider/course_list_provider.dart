import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/api/course_api.dart';

import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/global.dart';

import '../../../common/model/entitites.dart';

final homeUserProfileProvider =
    FutureProvider.autoDispose<UserProfile>((ref) async {
  return Global.storageServices.getUserProfileInfo();
});

//==============================================================================
///[for getting List of course after login]
class CourseService {
  static Future<List<CourseItem>?> getCourseList() async {
    final response = await CourseApi.courseList();

    if (response.code == 200) {
      return response.data;
    }
    return null;
  }
}

final homeCourseListProvider = FutureProvider<List<CourseItem>?>((ref) async {
  return CourseService.getCourseList();
});
