import 'package:flutter/material.dart';

class ResponsiveUtils extends StatelessWidget {
  static const double mobileWidthLimit = 650.0;
  static const double tabletWidthLimit = 1100.0;

  final Widget screenWeb;
  final Widget screenTablet;
  final Widget screenMobile;

  const ResponsiveUtils(
      {Key? key,
      required this.screenWeb,
      required this.screenTablet,
      required this.screenMobile})
      : super(key: key);

  static bool isScreenWeb(final BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletWidthLimit;

  static bool isScreenTablet(final BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileWidthLimit &&
      MediaQuery.of(context).size.width <= tabletWidthLimit;

  static bool isScreenMobile(final BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileWidthLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > tabletWidthLimit) {
          return screenWeb;
        }
        if (constraints.maxWidth > mobileWidthLimit) {
          return screenTablet;
        } else {
          return screenMobile;
        }
      },
    );
  }
}
