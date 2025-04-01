import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_flutter/utils/dimnesons.dart';

class ResponsiveLaout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLaout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScrennSize) {
          //web screen
          return webScreenLayout;
        } else {
          // mobile Screen
          return mobileScreenLayout;
        }
      },
    );
  }
}
