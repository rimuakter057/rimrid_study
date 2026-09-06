import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/empty_state.dart';
import 'package:get/get.dart';
import '../controllers/certificates_controller.dart';
import '../widgets/certificate_card.dart';

class CertificatesView extends GetView<CertificatesController> {
  const CertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final certificates = controller.certificates;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Certificates')),
      body: certificates.isEmpty
          ? const EmptyState(
              icon: Icons.workspace_premium_outlined,
              title: 'No certificates yet',
              message: 'Complete a course to earn your first certificate.',
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl),
              itemCount: certificates.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final certificate = certificates[index];
                return CertificateCard(
                  certificate: certificate,
                  onTap: () => controller.openCertificate(certificate),
                );
              },
            ),
    );
  }
}
