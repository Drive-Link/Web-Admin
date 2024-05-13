import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/enumerators.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/provider/app_provider.dart';
import 'package:drivelink_admin/provider/auth_provider.dart';
import 'package:drivelink_admin/resources/assets_manager.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/dashboard/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/drivers/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/login/login_view.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/passengers/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/reviews/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/transactions/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/trips/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/verification/mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MobileSideMenu extends StatefulWidget {
  const MobileSideMenu({super.key});

  @override
  State<MobileSideMenu> createState() => _MobileSideMenuState();
}

class _MobileSideMenuState extends State<MobileSideMenu> {
  bool active1 = false;
  bool active2 = false;
  bool active3 = false;
  bool active4 = false;
  bool active5 = false;
  bool active6 = false;
  bool active7 = false;
  bool active8 = false;


  @override
  Widget build(BuildContext context) {
    //final AppProvider appProvider = Provider.of<AppProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
        child: Column(
          children: [
            Column(
              children: [
                DrawerListTile(
                  title: StringManager.dashboard,
                  imageSrc: AssetManager.dashboardSvg,
                  textColor: active1 ? Colors.white : textColor,
                  tileColor: active1 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active1 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileDashboardContent()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.drivers,
                  imageSrc: AssetManager.usersSvg,
                  textColor: active2 ? Colors.white : textColor,
                  tileColor: active2 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active2 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileDriversPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.passengers,
                  imageSrc: AssetManager.usersSvg,
                  textColor: active3 ? Colors.white : textColor,
                  tileColor: active3 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active3 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobilePassengersPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.trips,
                  imageSrc: AssetManager.tripsSvg,
                  textColor: active4 ? Colors.white : textColor,
                  tileColor: active4 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active4 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileTripsPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.verification,
                  imageSrc: AssetManager.verificationSvg,
                  textColor: active5 ? Colors.white : textColor,
                  tileColor: active5 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active5 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileVerificationPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.reviews,
                  imageSrc: AssetManager.reviewsSvg,
                  textColor: active6 ? Colors.white : textColor,
                  tileColor: active6 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active6 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileReviewsPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.transactions,
                  imageSrc: AssetManager.transactionsSvg,
                  textColor: active7 ? Colors.white : textColor,
                  tileColor: active7 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active7 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileTransactionsPage()),
                    );
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
                  textColor: active8 ? Colors.white : textColor,
                  tileColor: active8 ? newPrimaryColor : null,
                  press: (){
                    setState(() {
                      active8 = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MobileDashboardContent()),
                    );
                  },
                ),
                DrawerListTile(
                  title: StringManager.logout,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );

                  },
                ),
              ],
            )
          ],
        ));
  }
}

class DrawerListTile extends StatelessWidget {
   DrawerListTile({
    Key? key,
    required this.title,
    required this.imageSrc,
    this.textColor,
    this.tileColor,
    this.press,
  }) : super(key: key);

  final String title, imageSrc;
  Color? textColor, tileColor;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      tileColor: tileColor,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        imageSrc,
        color: textColor,
        height: 16,
        width: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
