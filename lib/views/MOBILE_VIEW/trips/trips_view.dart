import 'package:drivelink_admin/views/MOBILE_VIEW/trips/mobile.dart';
import 'package:drivelink_admin/views/trips/trips_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TripsView extends StatefulWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const TripsPage(),
        mobile: (BuildContext context) =>  const MobileTripsPage()
    );
  }
}