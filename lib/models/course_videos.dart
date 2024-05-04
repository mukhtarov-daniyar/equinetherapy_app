// models/course_videos.dart
class CourseVideos {
  final String courseName;
  final List<String> videoIds;

  CourseVideos({required this.courseName, required this.videoIds});
}

List<CourseVideos> courses = [
  CourseVideos(courseName: '1 курс', videoIds: ['TD2R9ZyeZX4', '7Xo3QdR-Mn0']),
  CourseVideos(courseName: '2 курс', videoIds: ['TD2R9ZyeZX4', '7Xo3QdR-Mn0']),
  CourseVideos(courseName: '3 курс', videoIds: ['TD2R9ZyeZX4', '7Xo3QdR-Mn0']),
];
