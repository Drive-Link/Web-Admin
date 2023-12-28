import 'package:drivelink_admin/constants/responsive.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:drivelink_admin/views/components/dashboard_content.dart';
import 'package:drivelink_admin/views/components/side_menu.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(child: SideMenu()),
            const Expanded(flex: 5, child: DashboardContent())
          ],
        ),
      ),
    );
  }
}
