import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/model/Data.dart';
import 'package:ulearning/features/course_detail/repo/course_detail_repo.dart';

final courseDetailProvider =
    FutureProvider.autoDispose.family<CourseItem?, int>((ref, int id) async {
  //
  CourseDetailRequestEntity courseRequestEntity = CourseDetailRequestEntity();

  courseRequestEntity.id = id;

  final resopnse = await CourseDetailRepo.courseDetail(courseRequestEntity);

  if (resopnse.code == 200) {
    return resopnse.data;
  }

  return null;
});

// final Provider = FutureProvider.autoDispose.family<, >((ref, ) async {
//   return ;
// });

// final courseDetailProvider = FutureProvider.autoDispose.family({ref,} async {
//   return ;
// });
