import 'package:get/get.dart';
import '../../../data/mock/mock_analytics.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/mock/mock_user.dart';
import '../../../data/models/study_activity_model.dart';
import '../../../data/models/user_model.dart';

class ProgressController extends GetxController {
  UserModel get user => MockUser.current;

  List<DailyActivityModel> get weeklyActivity => MockAnalytics.weeklyActivity;
  List<TopicMasteryModel> get strongTopics => MockAnalytics.strongTopics;
  List<TopicMasteryModel> get weakTopics => MockAnalytics.weakTopics;

  double get weeklyTotalHours => MockAnalytics.weeklyTotalHours;
  int get coursesCompleted => MockAnalytics.coursesCompleted;
  int get lessonsCompleted => MockAnalytics.lessonsCompleted;
  double get quizAverage => MockAnalytics.quizAverage;
  double get overallProgress => MockAnalytics.overallProgress;
  int get coursesInProgress => MockCourses.inProgress.length;
}
