import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/home_page.dart';
import 'package:portfolio/features/about/about_page.dart';
import 'package:portfolio/features/skills/skills_page.dart';
import 'package:portfolio/features/projects/projects_page.dart';
import 'package:portfolio/features/contact/contact_page.dart';
import 'package:portfolio/core/widgets/responsive_app_bar.dart';
import 'package:portfolio/core/widgets/app_drawer.dart';
import 'package:portfolio/core/widgets/app_footer.dart';

class AppRouter {
  final ValueNotifier<bool> isDarkModeNotifier;

  AppRouter({required this.isDarkModeNotifier});

  late final router = GoRouter(
    initialLocation: '/',
    routerNeglect: true, // Prevents hash usage in URLs
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(
            currentPath: state.uri.path,
            isDarkModeNotifier: isDarkModeNotifier,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                ),
          ),
          GoRoute(
            path: '/about',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const AboutPage(),
                ),
          ),
          GoRoute(
            path: '/skills',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const SkillsPage(),
                ),
          ),
          GoRoute(
            path: '/projects',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ProjectsPage(),
                ),
          ),
          GoRoute(
            path: '/contact',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ContactPage(),
                ),
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final String currentPath;
  final ValueNotifier<bool> isDarkModeNotifier;

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    required this.currentPath,
    required this.isDarkModeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = [
      'Home',
      'About',
      'Skills',
      'Projects',
      'Contact',
    ];
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      appBar: ResponsiveAppBar(
        menuItems: menuItems,
        currentPath: currentPath,
        isDarkModeNotifier: isDarkModeNotifier,
      ),
      endDrawer:
          isMobile
              ? AppDrawer(menuItems: menuItems, currentPath: currentPath)
              : null,
      body: child,
    );
  }
}
