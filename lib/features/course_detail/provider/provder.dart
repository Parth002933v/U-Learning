import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/api/course_api.dart';
import 'package:ulearning/common/model/Data.dart';

final courseDetailProvider =
    FutureProvider.autoDispose.family<CourseItem?, int>((ref, int id) async {
  //
  CourseDetailRequestEntity courseRequestEntity = CourseDetailRequestEntity();

  courseRequestEntity.id = id;

  final resopnse = await CourseApi.courseDetail(courseRequestEntity);

  if (resopnse.code == 200) {
    return resopnse.data;
  }

  return null;
});

///=============================================================================
final lessonListProvider = FutureProvider.autoDispose
    .family<List<LessonItem>?, int>((ref, int id) async {
//
  LessonListRequestEntity lessonListRequestEntity = LessonListRequestEntity();
  lessonListRequestEntity.courseID = id;

  final response = await CourseApi.lessonList(lessonListRequestEntity);

  if (response.code == 200) {
    return response.data;
  }
  return null;
});
