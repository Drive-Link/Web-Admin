import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/models/driver_model.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/verification/mobile_verification_details.dart';
import 'package:flutter/material.dart';


class MobileVerificationPage extends StatefulWidget {
  const MobileVerificationPage({super.key});

  @override
  State<MobileVerificationPage> createState() => _MobileVerificationPageState();
}

class _MobileVerificationPageState extends State<MobileVerificationPage> {
  String _searchQuery = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFECFCF8)),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('drivers').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Loading());
              }

              var driverModels = snapshot.data!.docs
                  .map((doc) => DriverModel.fromSnapshot(doc))
                  .where((user) =>
                      user.firstName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()) ||
                      user.lastName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                  .toList();

              return Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1.5),
                    itemCount: driverModels.length,
                    itemBuilder: (context, index) {
                      final DriverModel user = driverModels[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VerificationDetailsPage(driver: user)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      child: user.profilePicture != null
                                          ? Image.network(
                                              user.profilePicture!,
                                              height: 25,
                                              width: 25,
                                            )
                                          : Image.asset(
                                              'assets/images/dummy_image.png',
                                              height: 25,
                                              width: 25,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${user.firstName} ${user.lastName}',
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      StringManager.dmSans,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('${user.state}, ${user.country}',
                                              style: TextStyle(
                                                  color: mainTextColor
                                                      .withOpacity(0.9),
                                                  fontFamily:
                                                      StringManager.dmSans,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(StringManager.driversLicense,
                                    style: TextStyle(
                                        color: newPrimaryColor,
                                        fontFamily: StringManager.dmSans,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16)),
                                const SizedBox(height: 3),
                                const Text(StringManager.identificationCard,
                                    style: TextStyle(
                                        color: newPrimaryColor,
                                        fontFamily: StringManager.dmSans,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),
      ),
    );
  }
}
