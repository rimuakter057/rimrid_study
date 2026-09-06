class InstructorModel {
  final String id;
  final String name;
  final String avatarUrl;
  final String title;
  final double rating;
  final int studentsCount;
  final int coursesCount;
  final String bio;

  const InstructorModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.title,
    this.rating = 4.8,
    this.studentsCount = 0,
    this.coursesCount = 0,
    this.bio = '',
  });
}
