import 'package:get/get.dart';
import '../../../data/mock/mock_certificates.dart';
import '../../../data/models/certificate_model.dart';
import '../../../core/routes/app_routes.dart';

class CertificatesController extends GetxController {
  List<CertificateModel> get certificates => MockCertificates.all;

  void openCertificate(CertificateModel certificate) {
    Get.toNamed(AppRoutes.certificateDetail, arguments: certificate.id);
  }
}
