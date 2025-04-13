import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import 'package:portfolio/core/widgets/app_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/widgets/page_wrapper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'About Me', isCenter: false),
            const SizedBox(height: 20),
            isMobile
                ? _buildMobileAboutSection(context)
                : _buildDesktopAboutSection(context),
            const SizedBox(height: 60),
            const SectionTitle(title: 'My Journey', isCenter: false),
            const SizedBox(height: 40),
            _buildTimelineSection(context, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopAboutSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Mobile Developer with 5+ Years Experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                ),
              ),
              const SizedBox(height: 20),
              _buildAboutText(context),
              const SizedBox(height: 30),
              Row(
                children: [
                  AppButton(
                    text: 'Download CV',
                    onPressed: () => _launchUrl('https://example.com/cv.pdf'),
                    icon: Icons.download,
                  ),
                  const SizedBox(width: 16),
                  AppButton(
                    text: 'My Projects',
                    onPressed: () {},
                    isOutlined: true,
                    icon: Icons.work,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppTheme.primaryColor.withOpacity(0.1)
                      : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: AppTheme.primaryColor.withOpacity(0.2),
                height: 300,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: AppTheme.primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppTheme.primaryColor.withOpacity(0.1)
                    : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: AppTheme.primaryColor.withOpacity(0.2),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: AppTheme.primaryColor.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
        Text(
          'Flutter Mobile Developer with 5+ Years Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 20),
        _buildAboutText(context),
        const SizedBox(height: 30),
        Column(
          children: [
            AppButton(
              text: 'Download CV',
              onPressed: () => _launchUrl('https://example.com/cv.pdf'),
              icon: Icons.download,
              isFullWidth: true,
            ),
            const SizedBox(height: 12),
            AppButton(
              text: 'My Projects',
              onPressed: () {},
              isOutlined: true,
              icon: Icons.work,
              isFullWidth: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutText(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      height: 1.7,
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.white70
              : AppTheme.textSecondaryColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I\'m Abdul Halim, a passionate Flutter developer with expertise in creating beautiful, functional, and user-friendly mobile applications.',
          style: textStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'With over 5 years of experience in mobile development, I specialize in building cross-platform applications using Flutter that deliver exceptional user experiences. I have a strong foundation in clean architecture principles, state management, and UI/UX design.',
          style: textStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'I\'ve worked on a variety of projects including fintech applications, e-commerce platforms, and social networking apps. My goal is to create software that not only meets business requirements but also delights users with its performance and design.',
          style: textStyle,
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildInfoItem('Name', 'Abdul Halim'),
            _buildInfoItem('Email', 'contact@abdulhalim.com'),
            _buildInfoItem('From', 'Bangladesh'),
            _buildInfoItem('Experience', '5+ Years'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return SizedBox(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: AppTheme.textPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection(BuildContext context, bool isMobile) {
    return Column(
      children: [
        _buildTimelineItem(
          context,
          '2023 - Present',
          'Senior Flutter Developer',
          'TechFin Solutions',
          'Leading the development of fintech mobile applications, implementing clean architecture with BLoC pattern, and mentoring junior developers.',
          isMobile,
        ),
        _buildTimelineItem(
          context,
          '2020 - 2023',
          'Flutter Developer',
          'Mobile Apps Inc.',
          'Developed and maintained multiple cross-platform applications, implemented state management solutions, and worked closely with design teams.',
          isMobile,
        ),
        _buildTimelineItem(
          context,
          '2018 - 2020',
          'Mobile App Developer',
          'Dev Studio',
          'Started my journey in mobile development, worked on both Android and iOS applications, and gradually transitioned to Flutter development.',
          isMobile,
        ),
        _buildTimelineItem(
          context,
          '2014 - 2018',
          'Computer Science Degree',
          'University of Technology',
          'Completed my bachelor\'s degree in Computer Science with a focus on mobile application development and software engineering principles.',
          isMobile,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String period,
    String title,
    String company,
    String description,
    bool isMobile, {
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile) ...[
          SizedBox(
            width: 150,
            child: Text(
              period,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
        ],
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: isMobile ? 140 : 120,
                color: AppTheme.primaryColor.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMobile) ...[
                Text(
                  period,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondaryColor,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                company,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
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
              SizedBox(height: isLast ? 0 : (isMobile ? 24 : 16)),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
