import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_flutter/providers/userProvider.dart';
import 'package:instagram_flutter/utils/dimnesons.dart';
import 'package:provider/provider.dart';

class ResponsiveLaout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLaout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });

  @override
  State<ResponsiveLaout> createState() => _ResponsiveLaoutState();
}

class _ResponsiveLaoutState extends State<ResponsiveLaout> {
  void initState() {
    // TODO: implement initState
    super.initState();

    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);

    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScrennSize) {
          //web screen
          return widget.webScreenLayout;
        } else {
          // mobile Screen
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
