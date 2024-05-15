import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/transactions/tabs/drivers.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/transactions/tabs/users.dart';
import 'package:flutter/material.dart';

class MobileTransactionsPage extends StatefulWidget {
  const MobileTransactionsPage({Key? key}) : super(key: key);

  @override
  State<MobileTransactionsPage> createState() => _MobileTransactionsPageState();
}

class _MobileTransactionsPageState extends State<MobileTransactionsPage> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: fadedGreen,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.asset(
              'assets/images/drivelink_main.png',
              height: 20,
              width: 20,
            ),
          ),
          actions: [
            Image.asset(
              'assets/images/search.png',
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileNotificationsPage()),
                );
              },
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/bell.png",
                    height: 25,
                    width: 25,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/dummy_image.png',
                height: 25,
                width: 25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                child: Icon(Icons.menu)),
            SizedBox(
              width: 20,
            ),
          ]),
      endDrawer: const MobileSideMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              tabBarOption(tabController),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [UsersTransactions(), DriversTransactions()],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarOption(TabController tabController) {
    return Container(
      decoration: BoxDecoration(
        color: customTextFieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 50,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: TabBar(
          onTap: (value) {},
          controller: tabController,
          labelColor: primaryColor,
          unselectedLabelColor: mainTextColor,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          tabs: [
            Tab(
              child: Container(
                height: 38,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    StringManager.users,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                height: 38,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    StringManager.drivers,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}