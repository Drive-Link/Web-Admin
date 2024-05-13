import 'package:drivelink_admin/views/MOBILE_VIEW/passengers/mobile.dart';
import 'package:drivelink_admin/views/passengers/passengers_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Passengers extends StatefulWidget {
  const Passengers({Key? key}) : super(key: key);

  @override
  State<Passengers> createState() => _LoginState();
}

class _LoginState extends State<Passengers> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const PassengersPage(),
        mobile: (BuildContext context) =>  const MobilePassengersPage()
    );
  }
}