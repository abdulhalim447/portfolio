import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> menuItems;
  final String currentPath;
  final ValueNotifier<bool> isDarkModeNotifier;

  const ResponsiveAppBar({
    super.key,
    required this.menuItems,
    required this.currentPath,
    required this.isDarkModeNotifier,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Text(
              'Abdul Halim',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (!isMobile) ..._buildDesktopMenuItems(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ValueListenableBuilder<bool>(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.textPrimaryColor,
                ),
                onPressed: () {
                  isDarkModeNotifier.value = !isDarkMode;
                },
              );
            },
          ),
        ),
        if (isMobile)
          Builder(
            builder:
                (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppTheme.textPrimaryColor,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        const SizedBox(width: 16),
      ],
    );
  }

  List<Widget> _buildDesktopMenuItems(BuildContext context) {
    return menuItems.map((item) {
      final bool isSelected =
          currentPath == '/${item.toLowerCase()}' ||
          (currentPath == '/' && item.toLowerCase() == 'home');

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton(
          onPressed: () {
            if (item.toLowerCase() == 'home') {
              context.go('/');
            } else {
              context.go('/${item.toLowerCase()}');
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: isSelected ? AppTheme.secondaryColor : null,
          ),
          child: Text(
            item,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      );
    }).toList();
  }
}
