import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/mock/mock_certificates.dart';
import '../../../shared/widgets/network_avatar.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../navigation/controllers/nav_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  void _comingSoon(String feature) {
    Get.snackbar(feature, 'Available in a later build phase');
  }

  @override
  Widget build(BuildContext context) {
    final user = controller.user;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                NetworkAvatar(imageUrl: user.avatarUrl, size: 80),
                const SizedBox(height: AppSpacing.sm),
                Text(user.name, style: AppTextStyles.h3),
                const SizedBox(height: 2),
                Text(user.email, style: AppTextStyles.bodyRegular),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.local_fire_department_rounded,
                  value: '${user.studyStreakDays}',
                  label: 'Day streak',
                  accentColor: AppColors.warning,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Expanded(
                child: StatCard(
                  icon: Icons.school_rounded,
                  value: '3',
                  label: 'Courses',
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  icon: Icons.workspace_premium_rounded,
                  value: '${MockCertificates.all.length}',
                  label: 'Certificates',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _MenuSection(
            items: [
              _MenuItemData(Icons.school_outlined, 'My Courses',
                  () => Get.find<NavController>().changeIndex(2)),
              _MenuItemData(Icons.bar_chart_rounded, 'My Progress',
                  () => Get.toNamed(AppRoutes.progress)),
              _MenuItemData(Icons.workspace_premium_outlined, 'Certificates',
                  () => Get.toNamed(AppRoutes.certificates)),
              _MenuItemData(Icons.bookmark_outline_rounded, 'Saved Courses',
                  () => Get.find<NavController>().changeIndex(2)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _MenuSection(
            items: [
              _MenuItemData(Icons.settings_outlined, 'Settings', () => _comingSoon('Settings')),
              _MenuItemData(Icons.notifications_outlined, 'Notifications',
                  () => Get.toNamed(AppRoutes.notifications)),
              _MenuItemData(Icons.help_outline_rounded, 'Help & Support', () => _comingSoon('Help & Support')),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _MenuSection(
            items: [
              _MenuItemData(
                Icons.logout_rounded,
                'Logout',
                controller.logout,
                isDestructive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  _MenuItemData(this.icon, this.label, this.onTap, {this.isDestructive = false});
}

class _MenuSection extends StatelessWidget {
  final List<_MenuItemData> items;
  const _MenuSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              ListTile(
                leading: Icon(
                  item.icon,
                  color: item.isDestructive ? AppColors.error : AppColors.primary,
                ),
                title: Text(
                  item.label,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: item.isDestructive ? AppColors.error : AppColors.textPrimary,
                  ),
                ),
                trailing: item.isDestructive
                    ? null
                    : const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                onTap: item.onTap,
              ),
              if (index != items.length - 1)
                const Divider(height: 1, indent: AppSpacing.md, endIndent: AppSpacing.md),
            ],
          );
        }),
      ),
    );
  }
}
