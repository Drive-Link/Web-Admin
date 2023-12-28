import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/components/profile_info.dart';
import 'package:drivelink_admin/views/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../constants/responsive.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          const Text(
            StringManager.appName,
            style: TextStyle(color: primaryColor),
          ),
        const Expanded(child: SearchField()),
        const ProfileInfo()
      ],
    );
  }
}
