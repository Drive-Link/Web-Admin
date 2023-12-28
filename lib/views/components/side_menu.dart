import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/string_manager.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.drivers,
                imageSrc: AssetManager.usersSvg,
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.passengers,
                imageSrc: AssetManager.usersSvg,
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.trips,
                imageSrc: AssetManager.tripsSvg,
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.verification,
                imageSrc: AssetManager.verificationSvg,
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.reviews,
                imageSrc: AssetManager.reviewsSvg,
                press: () {},
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              DrawerListTile(
                title: StringManager.settings,
                imageSrc: AssetManager.settingsSvg,
                press: () {},
              ),
              DrawerListTile(
                title: StringManager.logout,
                imageSrc: AssetManager.logoutSvg,
                press: () {},
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
  }) : super(key: key);

  final String title, imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
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
