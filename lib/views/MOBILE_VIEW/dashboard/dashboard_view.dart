import 'package:drivelink_admin/views/MOBILE_VIEW/dashboard/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/login/mobile.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:drivelink_admin/views/components/dashboard_content.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const DashboardContent(),
        mobile: (BuildContext context) =>  const MobileDashboardContent()
    );
  }
}
