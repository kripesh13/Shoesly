import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget? mobileScreen;
  final Widget? tabScreen;
  final Widget? webScreen;

  ResponsiveLayoutBuilder({
     this.mobileScreen,
    super.key,
    this.tabScreen,
    this.webScreen,
  });

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTabScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isMScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return webScreen!;
        } else if (constraints.maxWidth < 1100 && constraints.maxWidth > 800) {
          return tabScreen!;
        } else {
          return mobileScreen!;
        }
      },
    );
  }
}
