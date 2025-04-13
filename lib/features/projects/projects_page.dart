import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import 'package:portfolio/core/widgets/app_button.dart';
import 'package:portfolio/core/widgets/page_wrapper.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  // Use the same contact email as in the contact page
  static const String contactEmail = 'deve.abdulhalim@gmail.com';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return PageWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 40,
        ),
        child: Column(
          children: [
            const SectionTitle(title: 'My Projects', hasUnderline: true),
            const SizedBox(height: 20),
            Text(
              'Here are some of the projects I\'ve worked on as a Flutter developer',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : AppTheme.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildProjectCard(
                  context,
                  'Profile Picture Frame',
                  'A Native android app that allows users to add a frame to their profile picture.',
                  'assets/images/profile_frame.png',
                  ['Java', 'XML', 'Firebase', 'MYSQL with php ', 'REST API'],
                  isMobile,
                  playStoreUrl:
                      'https://play.google.com/store/apps/details?id=com.technicalbrobd.profilepictureframe&pcampaignid=web_share',
                ),
                _buildProjectCard(
                  context,
                  'World Bank',
                  'A Financial mobile application for digital loan and money transfers with secure authentication.',
                  'assets/images/worldbank.png',
                  [
                    'Flutter',
                    'BLoC',
                    'Provider',
                    'Laravel as backend',
                    'REST API',
                  ],
                  isMobile,
                  projectUrl: 'https://wblloanschema.com',
                  githubUrl: '',
                  playStoreUrl: '',
                ),
                _buildProjectCard(
                  context,
                  'Asian Development Bank ',
                  'A mobile application for digital loan and money transfers with secure authentication.',
                  'assets/images/asian_development_bank.png',
                  [
                    'Flutter',
                    'BLoC',
                    'Provider',
                    'Laravel as backend',
                    'REST API',
                  ],
                  isMobile,
                  projectUrl: 'https://app.wbli.org/',
                ),
                _buildProjectCard(
                  context,
                  'Climax IT',
                  'This is a micro service app from where the user can make deposits and here he can earn income by doing micro jobs, can take SIM offers, can buy various premium apps and can take digital services.',
                  'assets/images/climax_it.png',
                  [
                    'Flutter',
                    'GetX',
                    'Hive',
                    'Firebase',
                    'Php with mysql',
                    'REST API',
                  ],
                  isMobile,
                  projectUrl: 'https://climaxitbd.com/',
                ),
                _buildProjectCard(
                  context,
                  'GO Wallet',
                  'This app converts foreign currency into Bangladeshi currency.',
                  'assets/images/go_wallet.png',
                  ['Flutter', 'GetX', 'Hive', 'Php with mysql', 'REST API'],
                  isMobile,
                  projectUrl: 'https://gowalletapp.com',
                ),
                _buildProjectCard(
                  context,
                  'Trust Wallet',
                  'This app is a foriegn currency wallet app that allows users to store, send, and receive money from anywhere in the the bangladeshi currency.',
                  'assets/images/trust_wallet.png',
                  [
                    'Flutter',
                    'GetX',
                    'Shared Preferences',

                    'Php with mysql',
                    'REST API',
                  ],
                  isMobile,
                  projectUrl: 'https://mostsecurewalletapp.com/',
                ),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF1A202C)
                        : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Interested in working together?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'I\'m always open to discussing new projects, creative ideas or opportunities to be part of your vision.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white70
                              : AppTheme.textSecondaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: 'Get In Touch',
                    onPressed: () => _launchUrl('mailto:$contactEmail'),
                    icon: Icons.mail,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    String imagePath,
    List<String> technologies,
    bool isMobile, {
    String? projectUrl,
    String? githubUrl,
    String? playStoreUrl,
  }) {
    return Container(
      width: isMobile ? double.infinity : 350,
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A202C)
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Container(
              height: 200,
              width: double.infinity,
              color: AppTheme.primaryColor.withOpacity(0.1),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // If image fails to load, show fallback
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getIconForProject(title),
                          size: 80,
                          color: AppTheme.primaryColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppTheme.primaryColor.withOpacity(0.2)
                                    : AppTheme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : AppTheme.primaryColor,
                            ),
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    AppButton(
                      text: 'View Project',
                      onPressed:
                          projectUrl != null && projectUrl.isNotEmpty
                              ? () => _launchUrl(projectUrl)
                              : () {},
                      isOutlined: true,
                      icon: Icons.visibility,
                    ),
                    const Spacer(),
                    if (githubUrl != null && githubUrl.isNotEmpty)
                      IconButton(
                        onPressed: () => _launchUrl(githubUrl),
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: AppTheme.textSecondaryColor,
                        ),
                        tooltip: 'GitHub Repository',
                      ),
                    if (playStoreUrl != null && playStoreUrl.isNotEmpty)
                      IconButton(
                        onPressed: () => _launchUrl(playStoreUrl),
                        icon: const FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: AppTheme.textSecondaryColor,
                        ),
                        tooltip: 'Google Play',
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForProject(String projectName) {
    switch (projectName) {
      case 'FinPay':
        return Icons.account_balance_wallet;
      case 'ShopZone':
        return Icons.shopping_cart;
      case 'TaskMaster':
        return Icons.check_circle;
      case 'TravelBuddy':
        return Icons.flight;
      case 'FitTrack':
        return Icons.fitness_center;
      case 'ChatConnect':
        return Icons.chat;
      default:
        return Icons.code;
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
