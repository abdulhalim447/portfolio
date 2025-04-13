import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import 'package:portfolio/core/widgets/page_wrapper.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

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
            const SectionTitle(title: 'My Skills', hasUnderline: true),
            const SizedBox(height: 20),
            Text(
              'I have expertise in various technologies and tools for mobile app development,\nwith a focus on Flutter and related tech stack.',
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
            const SizedBox(height: 60),
            _buildSkillsSection(context, isMobile),
            const SizedBox(height: 80),
            const SectionTitle(title: 'Technical Skills', hasUnderline: true),
            const SizedBox(height: 50),
            _buildTechnicalSkillsSection(context, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, bool isMobile) {
    return Wrap(
      spacing: isMobile ? 20 : 40,
      runSpacing: isMobile ? 20 : 40,
      alignment: WrapAlignment.center,
      children: [
        _buildSkillCard(
          context,
          'Flutter',
          'Advanced',
          95,
          FontAwesomeIcons.flutter,
          const Color(0xFF02569B),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'Dart',
          'Advanced',
          90,
          FontAwesomeIcons.cube,
          const Color(0xFF0175C2),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'Firebase',
          'Advanced',
          85,
          FontAwesomeIcons.fire,
          const Color(0xFFFFA000),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'API Integration',
          'Advanced',
          90,
          FontAwesomeIcons.plugCircleBolt,
          const Color(0xFF6772E5),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'UI/UX Design',
          'Intermediate',
          80,
          FontAwesomeIcons.wandMagicSparkles,
          const Color(0xFFFF7262),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'Git & GitHub',
          'Advanced',
          85,
          FontAwesomeIcons.github,
          const Color(0xFF24292E),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'Clean Architecture',
          'Advanced',
          90,
          FontAwesomeIcons.diagramProject,
          const Color(0xFF3F51B5),
          isMobile,
        ),
        _buildSkillCard(
          context,
          'State Management',
          'Advanced',
          90,
          FontAwesomeIcons.cloudArrowUp,
          const Color(0xFF7952B3),
          isMobile,
        ),
      ],
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    String skill,
    String level,
    int percentage,
    IconData icon,
    Color color,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : 250,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: FaIcon(icon, color: color, size: 24)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill,
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
                      level,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white70
                                : AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage / 100,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicalSkillsSection(BuildContext context, bool isMobile) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Frontend',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildSkillChip(context, 'Flutter'),
                        _buildSkillChip(context, 'Dart'),
                        _buildSkillChip(context, 'Widget Testing'),
                        _buildSkillChip(context, 'Material Design'),
                        _buildSkillChip(context, 'Responsive UI'),
                        _buildSkillChip(context, 'Animations'),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 40),
              if (!isMobile)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'State Management',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildSkillChip(context, 'BLoC/Cubit'),
                          _buildSkillChip(context, 'Provider'),
                          _buildSkillChip(context, 'Riverpod'),
                          _buildSkillChip(context, 'GetX'),
                          _buildSkillChip(context, 'MobX'),
                          _buildSkillChip(context, 'Redux'),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (isMobile) const SizedBox(height: 30),
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'State Management',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildSkillChip(context, 'BLoC/Cubit'),
                    _buildSkillChip(context, 'Provider'),
                    _buildSkillChip(context, 'Riverpod'),
                    _buildSkillChip(context, 'GetX'),
                    _buildSkillChip(context, 'MobX'),
                    _buildSkillChip(context, 'Redux'),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Backend Integration',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildSkillChip(context, 'RESTful APIs'),
                        _buildSkillChip(context, 'GraphQL'),
                        _buildSkillChip(context, 'Firebase'),
                        _buildSkillChip(context, 'WebSockets'),
                        _buildSkillChip(context, 'OAuth'),
                        _buildSkillChip(context, 'JWT'),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 40),
              if (!isMobile)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tools & Others',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildSkillChip(context, 'Git & GitHub'),
                          _buildSkillChip(context, 'CI/CD'),
                          _buildSkillChip(context, 'Agile/Scrum'),
                          _buildSkillChip(context, 'Jira'),
                          _buildSkillChip(context, 'Figma'),
                          _buildSkillChip(context, 'VS Code'),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (isMobile) const SizedBox(height: 30),
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tools & Others',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildSkillChip(context, 'Git & GitHub'),
                    _buildSkillChip(context, 'CI/CD'),
                    _buildSkillChip(context, 'Agile/Scrum'),
                    _buildSkillChip(context, 'Jira'),
                    _buildSkillChip(context, 'Figma'),
                    _buildSkillChip(context, 'VS Code'),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : AppTheme.textPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppTheme.primaryColor.withOpacity(0.2)
              : AppTheme.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    );
  }
}
