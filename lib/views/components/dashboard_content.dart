import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
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
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('drivers').get();
    setState(() {
      totalDriversCount = snapshot.size;
    });
  }

  Future<void> _fetchTotalPassengersCount() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppbar(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 680,
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
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                StringManager.sN,
                                                style: TextStyle(
                                                    color: mainTextColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: StringManager.dmSans),
                                              ),
                                              SizedBox(width: 20,),
                                              Text(
                                                StringManager.name,
                                                style: TextStyle(
                                                    color: mainTextColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: StringManager.dmSans),
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
                                Divider(height: 1, color: light, indent: 15.0, endIndent: 10.0),
                                TopDriversCard(name: 'Mark Folahan', rides: '75'),
                                Divider(height: 1, color: light, indent: 15.0, endIndent: 10.0),
                                TopDriversCard(name: 'Mark Folahan', rides: '64'),
                                Divider(height: 1, color: light, indent: 15.0, endIndent: 10.0),
                                TopDriversCard(name: 'Mark Folahan', rides: '64'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: StringManager.dmSans),
                                    ),
                                  )
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        StringManager.sN,
                                        style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: StringManager.dmSans),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        StringManager.name,
                                        style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: StringManager.dmSans),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.emailAddress,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.phoneNumber,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.status,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.location,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  customUserWidget(smallImage, userText, userTextColor, bigImage, userValue, containerColor) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      width: 250,
      height: 210,
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
                const SizedBox(height: 5,),
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
              height: 70,
              width: 70,
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

  const TopDriversCard(
      {super.key,
        required this.name,
        required this.rides});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Transform.scale(scale: 0.8, child: Image.asset('assets/images/dummy_image.png')),
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