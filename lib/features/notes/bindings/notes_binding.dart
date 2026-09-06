import 'package:get/get.dart';
import '../controllers/notes_controller.dart';

class NotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesController>(() => NotesController());
  }
}
