import 'package:drivelink_admin/constants/responsive.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/views/components/side_menu.dart';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../../routing/router.dart';
import '../../services/navigation_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(child: SideMenu()),
            Expanded(
                flex: 5,
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: dashboardContentRoute,
                ))
          ],
        ),
      ),
    );
  }
}
