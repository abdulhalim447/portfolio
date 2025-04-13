import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/widgets/app_button.dart';
import 'package:portfolio/core/widgets/page_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet =
        MediaQuery.of(context).size.width < 1024 &&
        MediaQuery.of(context).size.width >= 768;

    return PageWrapper(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.85,
            constraints: const BoxConstraints(minHeight: 600),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF0D1117)
                      : Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -80,
                  left: -80,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          isMobile
                              ? 20
                              : isTablet
                              ? 60
                              : 120,
                    ),
                    child:
                        isMobile
                            ? _buildMobileHeroSection(context)
                            : _buildDesktopHeroSection(context),
                  ),
                ),
              ],
            ),
          ),
          _buildFeaturedSection(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopHeroSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, I\'m',
                style: TextStyle(
                  fontSize: 24,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : AppTheme.textSecondaryColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Abdul Halim',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Expert in ',
                    style: TextStyle(
                      fontSize: 24,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppTheme.textPrimaryColor,
                    ),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flutter Development',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondaryColor,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'Mobile App Development',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondaryColor,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'UI/UX Design',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondaryColor,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Passionate Flutter developer with expertise in creating beautiful, functional and user-friendly mobile applications.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : AppTheme.textSecondaryColor,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  AppButton(
                    text: 'View Projects',
                    onPressed: () => context.go('/projects'),
                    icon: Icons.work,
                  ),
                  const SizedBox(width: 16),
                  AppButton(
                    text: 'Contact Me',
                    onPressed: () => context.go('/contact'),
                    isOutlined: true,
                    icon: Icons.email,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Container(
            height: 380,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppTheme.primaryColor.withOpacity(0.2)
                      : AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppTheme.primaryColor.withOpacity(0.3)
                            : AppTheme.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(160),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 280,
                    height: 400,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ClipOval(
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/dev.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeroSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppTheme.primaryColor.withOpacity(0.2)
                    : AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(110),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppTheme.primaryColor.withOpacity(0.3)
                          : AppTheme.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
              Positioned(
                bottom: -30,
                child: Container(
                  width: 200,
                  height: 260,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/dev.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Hello, I\'m',
          style: TextStyle(
            fontSize: 20,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white70
                    : AppTheme.textSecondaryColor,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Abdul Halim',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Expert in ',
                style: TextStyle(
                  fontSize: 18,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.secondaryColor,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TyperAnimatedText(
                    'Mobile Apps',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.secondaryColor,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TyperAnimatedText(
                    'UI/UX',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.secondaryColor,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Passionate Flutter developer with expertise in creating beautiful, functional and user-friendly mobile applications.',
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white70
                    : AppTheme.textSecondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            AppButton(
              text: 'View Projects',
              onPressed: () => context.go('/projects'),
              icon: Icons.work,
              isFullWidth: true,
            ),
            const SizedBox(height: 12),
            AppButton(
              text: 'Contact Me',
              onPressed: () => context.go('/contact'),
              isOutlined: true,
              icon: Icons.email,
              isFullWidth: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      color:
          Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF111821)
              : const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 80,
      ),
      child: Column(
        children: [
          const Text(
            'EXPERTISE',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.secondaryColor,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Specialized in Mobile Excellence',
            style: TextStyle(
              fontSize: isMobile ? 24 : 30,
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppTheme.textPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                context,
                Icons.phone_android,
                'Flutter Development',
                'Expert in building cross-platform applications with Flutter framework.',
                isMobile,
              ),
              _buildFeatureCard(
                context,
                Icons.code,
                'Clean Architecture',
                'Implementing scalable and maintainable code architecture.',
                isMobile,
              ),
              _buildFeatureCard(
                context,
                Icons.palette,
                'UI/UX Design',
                'Creating beautiful and intuitive user interfaces with Material Design.',
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A202C)
                : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 28),
          ),
          const SizedBox(height: 20),
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
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 12),
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
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}
