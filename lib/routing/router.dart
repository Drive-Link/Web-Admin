import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:drivelink_admin/views/auth/register.dart';
import 'package:drivelink_admin/views/components/dashboard_content.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:drivelink_admin/views/passengers/passengers_page.dart';
import 'package:drivelink_admin/views/reviews/reviews_page.dart';
import 'package:drivelink_admin/views/trips/trips_page.dart';
import 'package:drivelink_admin/views/verification/verification_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../views/home/dashboard_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case dashboardRoute:
      return _getPageRoute(const DashboardScreen());
    case driversRoute:
      return _getPageRoute(const DriversPage());
    case passengersRoute:
      return _getPageRoute(const PassengersPage());
    case tripsRoute:
      return _getPageRoute(const TripsPage());
    case verificationRoute:
      return _getPageRoute(const VerificationPage());
    case reviewsRoute:
      return _getPageRoute(const ReviewsPage());
    case pageControllerRoute:
      return _getPageRoute(const AppPagesController());
    case loginRoute:
      return _getPageRoute(const LoginScreen());
    case dashboardContentRoute:
      return _getPageRoute(const DashboardContent());
    case registerRoute:
      return _getPageRoute(const Register());
    default:
      return _getPageRoute(const LoginScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}