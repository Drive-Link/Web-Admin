import 'package:drivelink_admin/views/MOBILE_VIEW/dashboard/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/drivers/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/login/mobile.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:drivelink_admin/views/components/dashboard_content.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Drivers extends StatefulWidget {
  const Drivers({Key? key}) : super(key: key);

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const DriversPage(),
        mobile: (BuildContext context) =>  const MobileDriversPage()
    );
  }
}
