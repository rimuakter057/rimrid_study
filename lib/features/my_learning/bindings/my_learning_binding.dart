import 'package:get/get.dart';
import '../controllers/my_learning_controller.dart';

class MyLearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLearningController>(() => MyLearningController());
  }
}
