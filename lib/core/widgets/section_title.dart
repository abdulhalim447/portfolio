import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isCenter;
  final bool hasUnderline;

  const SectionTitle({
    super.key,
    required this.title,
    this.isCenter = true,
    this.hasUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
        ),
        if (hasUnderline)
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 24),
            width: isCenter ? 80 : 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }
}
