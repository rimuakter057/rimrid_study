import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Circular user avatar that degrades gracefully to a person icon while
/// loading or if the network image fails (e.g. no connectivity).
class NetworkAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const NetworkAvatar({super.key, required this.imageUrl, this.size = 46});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (_, __) => _fallback(),
        errorWidget: (_, __, ___) => _fallback(),
      ),
    );
  }

  Widget _fallback() {
    return Container(
      width: size,
      height: size,
      color: AppColors.secondaryLight,
      child: Icon(Icons.person_rounded, size: size * 0.55, color: AppColors.primary),
    );
  }
}
