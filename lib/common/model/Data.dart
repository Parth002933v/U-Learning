// class CourseListResponseEntity {
//   final int? code;
//   final String? msg;
//   final List<CourseItem>? data;
//
//   CourseListResponseEntity({
//     this.code,
//     this.msg,
//     this.data,
//   });
//
//   factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) =>
//       CourseListResponseEntity(
//         code: json["code"],
//         msg: json["msg"],
//         data: json["data"] == null
//             ? []
//             : List<CourseItem>.from(
//                 json["data"]!.map((x) => CourseItem.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "msg": msg,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
// To parse this JSON data, do
//
//     final courseListResponseEntity = courseListResponseEntityFromJson(jsonString);

class CourseListResponseEntity {
  final int? code;
  final String? msg;
  final List<CourseItem>? data;

  CourseListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CourseItem>.from(
                json["data"]!.map((x) => CourseItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CourseItem {
  final int? id;
  final String? userToken;
  final String? name;
  final String? thumbnail;
  final String? video;
  final String? descreption;
  final int? typeId;
  final int? price;
  final int? lessonNum;
  final int? videoLength;
  final int? follow;
  final double? score;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? downloadeNum;

  CourseItem({
    this.id,
    this.userToken,
    this.name,
    this.thumbnail,
    this.video,
    this.descreption,
    this.typeId,
    this.price,
    this.lessonNum,
    this.videoLength,
    this.follow,
    this.score,
    this.createdAt,
    this.updatedAt,
    this.downloadeNum,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        id: json["id"],
        userToken: json["user_token"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        video: json["video"],
        descreption: json["descreption"],
        typeId: json["type_id"],
        price: json["price"],
        lessonNum: json["lesson_num"],
        videoLength: json["video_length"],
        follow: json["follow"],
        score: json["score"]?.toDouble(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        downloadeNum: json["downloade_num"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_token": userToken,
        "name": name,
        "thumbnail": thumbnail,
        "video": video,
        "descreption": descreption,
        "type_id": typeId,
        "price": price,
        "lesson_num": lessonNum,
        "video_length": videoLength,
        "follow": follow,
        "score": score,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "downloade_num": downloadeNum,
      };
}

///=============================================================================
class CourseDetailRequestEntity {
  int? id;

  CourseDetailRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class CourseDetailResponseEntity {
  final int? code;
  final String? msg;
  final CourseItem? data;

  CourseDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? null : CourseItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data?.toJson(),
      };
}

///=============================================================================

class LessonListRequestEntity {
  int? courseID;

  LessonListRequestEntity({
    this.courseID,
  });

  Map<String, dynamic> toJson() => {
        "courseID": courseID,
      };
}

class LessonListResponseEntity {
  final int? code;
  final String? msg;
  final List<LessonItem>? data;

  LessonListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonItem>.from(
                json["data"]!.map((x) => LessonItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LessonItem {
  final int? id;
  final int? courseId;
  final String? name;
  final String? thumbnail;
  final String? description;
  final List<Video>? video;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LessonItem({
    this.id,
    this.courseId,
    this.name,
    this.thumbnail,
    this.description,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) => LessonItem(
        id: json["id"],
        courseId: json["course_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        video: json["video"] == null
            ? []
            : List<Video>.from(json["video"]!.map((x) => Video.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "name": name,
        "thumbnail": thumbnail,
        "description": description,
        "video": video == null
            ? []
            : List<dynamic>.from(video!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Video {
  final String? name;
  final String? thumbnail;
  final String? url;

  Video({
    this.name,
    this.thumbnail,
    this.url,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        name: json["name"],
        thumbnail: json["thumbnail"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "thumbnail": thumbnail,
        "url": url,
      };
}

///=============================================================================

class LessonDetailRequestEntity {
  int? lessonID;

  LessonDetailRequestEntity({
    this.lessonID,
  });

  Map<String, dynamic> toJson() => {
        "lessonID": lessonID,
      };
}

class LessonDetailResponseEntity {
  final int? code;
  final String? msg;
  final LessonItem? data;

  LessonDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? null : LessonItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data?.toJson(),
      };
}
