import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/app_footer.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [child, const AppFooter()]),
    );
  }
}
