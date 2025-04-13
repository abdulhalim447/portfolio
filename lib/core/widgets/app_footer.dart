import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color:
          Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1A1F25)
              : const Color(0xFFF2F2F2),
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isMobile ? 20 : 80,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(
                FontAwesomeIcons.github,
                'https://github.com/abdulhalim447',
                context,
              ),
              const SizedBox(width: 24),
              _buildSocialIcon(
                FontAwesomeIcons.linkedin,
                'https://www.linkedin.com/in/dev-abdul-halim',
                context,
              ),
              const SizedBox(width: 24),
              _buildSocialIcon(
                FontAwesomeIcons.facebook,
                'https://www.facebook.com/abdulhalimbaccu',
                context,
              ),
             
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Abdul Halim © ${DateTime.now().year} | Flutter Developer',
            style: TextStyle(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white70
                      : AppTheme.textSecondaryColor,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Built with Flutter Web',
            style: TextStyle(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white54
                      : AppTheme.textSecondaryColor.withOpacity(0.7),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white10
                  : Colors.black.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 18,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppTheme.textPrimaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
