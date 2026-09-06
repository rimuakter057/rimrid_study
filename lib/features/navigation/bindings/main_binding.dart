import 'package:get/get.dart';
import '../../ai_assistant/controllers/ai_assistant_controller.dart';
import '../../explore/controllers/explore_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../my_learning/controllers/my_learning_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/nav_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<MyLearningController>(() => MyLearningController());
    Get.lazyPut<AiAssistantController>(() => AiAssistantController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
