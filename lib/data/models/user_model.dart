class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final int studyStreakDays;
  final int todayGoalMinutes;
  final int todayCompletedMinutes;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    this.studyStreakDays = 0,
    this.todayGoalMinutes = 60,
    this.todayCompletedMinutes = 0,
  });

  String get firstName => name.split(' ').first;

  double get todayGoalProgress =>
      todayGoalMinutes == 0 ? 0 : (todayCompletedMinutes / todayGoalMinutes).clamp(0, 1);

  UserModel copyWith({
    String? name,
    String? email,
    String? avatarUrl,
    int? studyStreakDays,
    int? todayGoalMinutes,
    int? todayCompletedMinutes,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      studyStreakDays: studyStreakDays ?? this.studyStreakDays,
      todayGoalMinutes: todayGoalMinutes ?? this.todayGoalMinutes,
      todayCompletedMinutes: todayCompletedMinutes ?? this.todayCompletedMinutes,
    );
  }
}
