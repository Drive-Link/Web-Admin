import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/resources/assets_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../helpers/enumerators.dart';
import '../../locator.dart';
import '../../provider/app_provider.dart';
import '../../provider/auth_provider.dart';
import '../../resources/string_manager.dart';
import '../../services/navigation_service.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(width: 200.0),
      child: Drawer(
          child: Column(
        children: [
          Column(
            children: [
              DrawerListTile(
                title: StringManager.dashboard,
                imageSrc: AssetManager.dashboardSvg,
                active:
                    appProvider.currentPage == DisplayedPage.DASHBOARDCONTENT,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.DASHBOARDCONTENT);
                  locator<NavigationService>()
                      .navigateTo(dashboardContentRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.drivers,
                imageSrc: AssetManager.usersSvg,
                active: appProvider.currentPage == DisplayedPage.DRIVERS,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.DRIVERS);
                  locator<NavigationService>().navigateTo(driversRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.passengers,
                imageSrc: AssetManager.usersSvg,
                active: appProvider.currentPage == DisplayedPage.PASSENGERS,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.PASSENGERS);
                  locator<NavigationService>().navigateTo(passengersRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.trips,
                imageSrc: AssetManager.tripsSvg,
                active: appProvider.currentPage == DisplayedPage.TRIPS,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.TRIPS);
                  locator<NavigationService>().navigateTo(tripsRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.verification,
                imageSrc: AssetManager.verificationSvg,
                active: appProvider.currentPage == DisplayedPage.VERIFICATION,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.VERIFICATION);
                  locator<NavigationService>().navigateTo(verificationRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.reviews,
                imageSrc: AssetManager.reviewsSvg,
                active: appProvider.currentPage == DisplayedPage.REVIEWS,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.REVIEWS);
                  locator<NavigationService>().navigateTo(reviewsRoute);
                },
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              DrawerListTile(
                title: StringManager.settings,
                imageSrc: AssetManager.settingsSvg,
                active: appProvider.currentPage == DisplayedPage.SETTINGS,
                press: () {
                  appProvider.changeCurrentPage(DisplayedPage.SETTINGS);
                  locator<NavigationService>().navigateTo(settingsRoute);
                },
              ),
              DrawerListTile(
                title: StringManager.logout,
                active: appProvider.currentPage == DisplayedPage.LOGOUT,
                imageSrc: AssetManager.logoutSvg,
                press: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: Loading(),
                      );
                    },
                  );

                  await authProvider.signOut();
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.pop(context);
                  locator<NavigationService>()
                      .globalNavigateTo(loginRoute, context);
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.imageSrc,
    required this.press,
    required this.active,
  }) : super(key: key);

  final String title, imageSrc;
  final bool active;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      tileColor: active ? newPrimaryColor : null,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        imageSrc,
        color: textColor,
        height: 16,
        width: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: textColor),
      ),
    );
  }
}
