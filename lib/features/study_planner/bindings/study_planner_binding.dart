import 'package:get/get.dart';
import '../controllers/study_planner_controller.dart';

class StudyPlannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyPlannerController>(() => StudyPlannerController());
  }
}
