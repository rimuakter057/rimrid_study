import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/mock/mock_certificates.dart';
import '../../../data/mock/mock_user.dart';
import '../../../shared/widgets/custom_button.dart';

class CertificateDetailView extends StatelessWidget {
  const CertificateDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments as String?;
    final certificate = id == null
        ? MockCertificates.all.first
        : (MockCertificates.byId(id) ?? MockCertificates.all.first);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Certificate')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
            AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl),
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: AppColors.primaryDark, width: 6),
            ),
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              children: [
                const Icon(Icons.workspace_premium_rounded,
                    size: 56, color: Colors.white),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Certificate of Completion',
                  style: AppTextStyles.h3.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'This certifies that',
                  style: AppTextStyles.bodyRegular
                      .copyWith(color: Colors.white.withValues(alpha: 0.8)),
                ),
                const SizedBox(height: 4),
                Text(
                  MockUser.current.name,
                  style: AppTextStyles.h2.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'has successfully completed',
                  style: AppTextStyles.bodyRegular
                      .copyWith(color: Colors.white.withValues(alpha: 0.8)),
                ),
                const SizedBox(height: 4),
                Text(
                  certificate.courseTitle,
                  style: AppTextStyles.h3.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  child: CachedNetworkImage(
                    imageUrl: certificate.thumbnailUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _DetailRow(
            label: 'Instructor',
            value: certificate.instructorName,
            icon: Icons.person_outline_rounded,
          ),
          _DetailRow(
            label: 'Completion date',
            value: DateFormat('MMMM d, yyyy').format(certificate.completionDate),
            icon: Icons.calendar_today_rounded,
          ),
          _DetailRow(
            label: 'Course duration',
            value: '${certificate.durationHours.toStringAsFixed(0)} hours',
            icon: Icons.schedule_rounded,
          ),
          _DetailRow(
            label: 'Credential ID',
            value: certificate.credentialId,
            icon: Icons.verified_outlined,
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: 'Download',
                  icon: Icons.download_rounded,
                  onPressed: () => Get.snackbar(
                    'Certificate downloaded',
                    'Saved to your device (mock).',
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: CustomButton(
                  label: 'Share',
                  variant: CustomButtonVariant.outlined,
                  icon: Icons.share_outlined,
                  onPressed: () => Get.snackbar(
                    'Share certificate',
                    'Sharing is not available yet.',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DetailRow({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTextStyles.bodyRegular),
          const Spacer(),
          Text(value, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
