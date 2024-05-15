import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/dashboard/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/drivers/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/trips/pages/all_trips.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/trips/pages/cancelled_trips.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/trips/pages/completed_trips.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/verification/mobile.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:drivelink_admin/views/auth/register.dart';
import 'package:drivelink_admin/views/components/dashboard_content.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:drivelink_admin/views/notifications/notifications_page.dart';
import 'package:drivelink_admin/views/passengers/passengers_details.dart';
import 'package:drivelink_admin/views/passengers/passengers_page.dart';
import 'package:drivelink_admin/views/reviews/reviews_page.dart';
import 'package:drivelink_admin/views/transactions/tabs/drivers.dart';
import 'package:drivelink_admin/views/transactions/tabs/users.dart';
import 'package:drivelink_admin/views/transactions/transactions.dart';
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
    case transactionsRoute:
      return _getPageRoute(const TransactionsPage());
    case pageControllerRoute:
      return _getPageRoute(const AppPagesController());
    case loginRoute:
      return _getPageRoute(const LoginScreen());
    case dashboardContentRoute:
      return _getPageRoute(const DashboardContent());
    case registerRoute:
      return _getPageRoute(const Register());
    case notificationsRoute:
      return _getPageRoute(const NotificationsPage());
    case mobileDashboardContentRoute:
      return _getPageRoute(const MobileDashboardContent());
    case mobileDriversRoute:
      return _getPageRoute(const MobileDriversPage());
    case allTripsRoute:
      return _getPageRoute(const AllTripsPage());
    case completedTripsRoute:
      return _getPageRoute(const CompletedTripsPage());
    case cancelledTripsRoute:
      return _getPageRoute(const CancelledTripsPage());
    case mobileNotificationsRoute:
      return _getPageRoute(const MobileNotificationsPage());
      default:
      return _getPageRoute(const LoginScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}