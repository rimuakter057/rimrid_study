import 'package:get/get.dart';
import '../controllers/certificates_controller.dart';

class CertificatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CertificatesController>(() => CertificatesController());
  }
}
