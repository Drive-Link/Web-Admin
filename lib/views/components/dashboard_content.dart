

import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(height: 20,)
          ],
        ));
  }
}
