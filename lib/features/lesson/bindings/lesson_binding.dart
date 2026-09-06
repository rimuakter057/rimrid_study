import 'package:get/get.dart';
import '../controllers/lesson_controller.dart';

class LessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonController>(() => LessonController());
  }
}
