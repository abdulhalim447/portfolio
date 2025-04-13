import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  // Use path URLs instead of hash (#) URLs
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<bool> _isDarkModeNotifier;
  late AppRouter _router;

  @override
  void initState() {
    super.initState();
    _isDarkModeNotifier = ValueNotifier<bool>(false);
    _router = AppRouter(isDarkModeNotifier: _isDarkModeNotifier);
  }

  @override
  void dispose() {
    _isDarkModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
        return MaterialApp.router(
          title: 'Abdul Halim - Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: _router.router,
          builder:
              (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                    start: 1921,
                    end: double.infinity,
                    name: '4K',
                  ),
                ],
              ),
        );
      },
    );
  }
}
