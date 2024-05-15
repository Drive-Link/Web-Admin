import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/models/driver_model.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/transactions/mobile.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:drivelink_admin/views/components/side_menu.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/navigation_service.dart';


class MobileDashboardContent extends StatefulWidget {
  const MobileDashboardContent({super.key});

  @override
  State<MobileDashboardContent> createState() => _MobileDashboardContentState();
}

class _MobileDashboardContentState extends State<MobileDashboardContent> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 1;
  int totalDriversCount = 0;
  int totalPassengersCount = 0;
  int totalPendingDriversCount = 0;
  int totalCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchTotalDriversCount();
    _fetchTotalPassengersCount();
    _fetchTotalCounts();
  }

  Future<void> _fetchTotalDriversCount() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('drivers').get();
    setState(() {
      totalDriversCount = snapshot.size;
    });
  }

  Future<void> _fetchTotalPassengersCount() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      totalPassengersCount = snapshot.size;
    });
  }

  Future<void> _fetchTotalCounts() async {
    final QuerySnapshot driversSnapshot =
    await FirebaseFirestore.instance.collection('drivers').get();
    final QuerySnapshot passengersSnapshot =
    await FirebaseFirestore.instance.collection('users').get();
    final QuerySnapshot pendingDriversSnapshot = await FirebaseFirestore
        .instance
        .collection('drivers')
        .where('isVerified', isEqualTo: false)
        .get();

    setState(() {
      totalDriversCount = driversSnapshot.size;
      totalPassengersCount = passengersSnapshot.size;
      totalPendingDriversCount = pendingDriversSnapshot.size;
      totalCount = totalDriversCount + totalPassengersCount;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.asset('assets/images/drivelink_main.png',height: 20, width: 20,),
            ),
        actions: [
          Image.asset('assets/images/search.png', height: 25, width: 25,),
          SizedBox(width: 15,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MobileNotificationsPage()),
              );
            },
            child: Stack(
              children: [
                Image.asset("assets/images/bell.png",
                  height: 25, width: 25,),
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
          SizedBox(width: 15,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/dummy_image.png',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15,),
          GestureDetector(
            onTap: (){
              scaffoldKey.currentState!.openEndDrawer();
            },
              child: Icon(Icons.menu)
          ),
          SizedBox(width: 20,),
        ]),
      endDrawer: MobileSideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    children: [
                      customUserWidget(
                          'assets/images/blue.png',
                          'Total Users',
                          newPrimaryColor,
                          'assets/images/blue_faint.png',
                          totalCount.toString(),
                          newPrimaryColor),
                      customUserWidget(
                          'assets/images/wine.png',
                          'Pending Drivers',
                          wineColor,
                          'assets/images/wine_faint.png',
                          totalPendingDriversCount.toString(),
                          wineColor),
                      customUserWidget(
                          'assets/images/green.png',
                          'Passengers',
                          tealColor,
                          'assets/images/green_faint.png',
                          totalPassengersCount.toString(),
                          tealColor),
                      customUserWidget(
                          'assets/images/orange.png',
                          'Drivers',
                          orangeColor,
                          'assets/images/orange_faint.png',
                          totalDriversCount.toString(),
                          orangeColor),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringManager.usersActivity,
                            style: TextStyle(
                                color: newPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: StringManager.dmSans),
                          ),
                          Image.asset(
                            'assets/images/chart.png',
                            height: 300,
                            width: 600,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringManager.topDrivers,
                                style: TextStyle(
                                    color: newPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: StringManager.dmSans),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        StringManager.sN,
                                        style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                            StringManager.dmSans),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        StringManager.name,
                                        style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                            StringManager.dmSans),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    StringManager.rides,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        TopDriversCard(name: 'Mark Folahan', rides: '80'),
                        Divider(
                            height: 1,
                            color: light,
                            indent: 15.0,
                            endIndent: 10.0),
                        TopDriversCard(name: 'Mark Folahan', rides: '75'),
                        Divider(
                            height: 1,
                            color: light,
                            indent: 15.0,
                            endIndent: 10.0),
                        TopDriversCard(name: 'Mark Folahan', rides: '64'),
                        Divider(
                            height: 1,
                            color: light,
                            indent: 15.0,
                            endIndent: 10.0),
                        TopDriversCard(name: 'Mark Folahan', rides: '64'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('drivers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Loading());
                      }

                      var driverModels = snapshot.data!.docs
                          .map((doc) => DriverModel.fromSnapshot(doc))
                          .toList();

                      // Paginate the data
                      int startIndex = (_currentPage - 1) * _rowsPerPage;
                      int endIndex = startIndex + _rowsPerPage;
                      List<DriverModel> paginatedData = driverModels.sublist(
                          startIndex, endIndex.clamp(0, driverModels.length));

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 400,
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: PaginatedDataTable(
                                  horizontalMargin: 12,
                                  header: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        StringManager.drivers,
                                        style: TextStyle(
                                            color: newPrimaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: StringManager.dmSans),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const DriversPage()),
                                            );
                                          },
                                          child: const Text(
                                            StringManager.seeAll,
                                            style: TextStyle(
                                                color: newPrimaryColor,
                                                fontFamily: StringManager.dmSans,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ))
                                    ],
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label: Text(
                                          StringManager.sN,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          StringManager.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          StringManager.emailAddress,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          StringManager.phoneNumber,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          StringManager.status,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          StringManager.location,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ],
                                  source: DriversTableSource(
                                    paginatedData,
                                    onRowTap: (driver) {

                                    },
                                  ),
                                  // rowsPerPage: _rowsPerPage,
                                  // availableRowsPerPage: const [5, 10, 20],
                                  // onPageChanged: (int pageIndex) {
                                  //   setState(() {
                                  //     _currentPage = pageIndex + 1;
                                  //   });
                                  // },
                                  // onRowsPerPageChanged: (int? selectedRowsPerPage) {
                                  //   setState(() {
                                  //     _rowsPerPage = selectedRowsPerPage!;
                                  //   });
                                  // },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  customUserWidget(smallImage, userText, userTextColor, bigImage, userValue,
      containerColor) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      width: 250,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  smallImage,
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(userText,
                    style: TextStyle(
                        color: userTextColor,
                        fontFamily: StringManager.dmSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 14)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              bigImage,
              height: 35,
              width: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userValue,
                    style: const TextStyle(
                        color: mainTextColor,
                        fontFamily: StringManager.dmSans,
                        fontWeight: FontWeight.w400,
                        fontSize: 22)),
                Container(
                  width: 100,
                  height: 5,
                  color: containerColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopDriversCard extends StatelessWidget {
  final String name;
  final String rides;

  const TopDriversCard({super.key, required this.name, required this.rides});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Transform.scale(
            scale: 0.8, child: Image.asset('assets/images/dummy_image.png')),
        title: Text(
          name,
          style: TextStyle(
              color: mainTextColor.withOpacity(0.9),
              fontFamily: StringManager.dmSans,
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rides,
              style: const TextStyle(
                  color: mainTextColor,
                  fontFamily: StringManager.dmSans,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DriversTableSource extends DataTableSource {
  final List<DriverModel> _driverModels;
  final Function(DriverModel) onRowTap;

  DriversTableSource(this._driverModels, {required this.onRowTap});

  @override
  DataRow? getRow(int index) {
    if (index >= _driverModels.length) {
      return null;
    }
    final DriverModel driver = _driverModels[index];
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(driver);
            },
            child: Text('${driver.firstName} ${driver.lastName}'))),
        DataCell(Text(driver.emailAddress)),
        DataCell(Text(driver.phoneNumber)),
        DataCell(Text(driver.verificationStatus ? 'Not Verified' : 'Verified')),
        DataCell(Text('${driver.state}, ${driver.country}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _driverModels.length;

  @override
  int get selectedRowCount => 0;
}
