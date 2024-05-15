import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/passengers/mobile.dart';
import 'package:drivelink_admin/views/notifications/notifications_page.dart';
import 'package:drivelink_admin/views/passengers/passengers_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _LoginState();
}

class _LoginState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const NotificationsPage(),
        mobile: (BuildContext context) =>  const MobileNotificationsPage()
    );
  }
}