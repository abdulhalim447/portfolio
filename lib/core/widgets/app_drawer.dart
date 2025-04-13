import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final List<String> menuItems;
  final String currentPath;

  const AppDrawer({
    super.key,
    required this.menuItems,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1E2329)
                : Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.primaryColor.withOpacity(0.9)
                        : AppTheme.primaryColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Abdul Halim',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children:
                    menuItems.map((item) {
                      final bool isSelected =
                          currentPath == '/${item.toLowerCase()}' ||
                          (currentPath == '/' && item.toLowerCase() == 'home');

                      return ListTile(
                        leading: _getIconForMenuItem(item),
                        title: Text(
                          item,
                          style: TextStyle(
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color:
                                isSelected
                                    ? AppTheme.secondaryColor
                                    : Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                          ),
                        ),
                        onTap: () {
                          if (item.toLowerCase() == 'home') {
                            context.go('/');
                          } else {
                            context.go('/${item.toLowerCase()}');
                          }
                          Navigator.pop(context); // Close drawer
                        },
                      );
                    }).toList(),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '© ${DateTime.now().year} Abdul Halim',
                style: TextStyle(
                  fontSize: 14,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.7)
                          : AppTheme.textSecondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon _getIconForMenuItem(String item) {
    switch (item.toLowerCase()) {
      case 'home':
        return const Icon(Icons.home);
      case 'about':
        return const Icon(Icons.person);
      case 'skills':
        return const Icon(Icons.code);
      case 'projects':
        return const Icon(Icons.work);
      case 'contact':
        return const Icon(Icons.mail);
      default:
        return const Icon(Icons.circle);
    }
  }
}
