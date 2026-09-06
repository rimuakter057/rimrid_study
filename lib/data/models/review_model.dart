class ReviewModel {
  final String id;
  final String userName;
  final String avatarUrl;
  final double rating;
  final String comment;
  final DateTime date;

  const ReviewModel({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
