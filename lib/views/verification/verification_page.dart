import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/models/driver_model.dart';
import 'package:drivelink_admin/views/verification/verification_details.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/loading.dart';
import '../../models/user_model.dart';
import '../../resources/string_manager.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Drivers",
                  helperStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                  ),
                  fillColor: customTextFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: textColor.withOpacity(0.5),
                  )),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            )),
            const SizedBox(
              width: 5,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/bell.png",
                  height: 30,
                  width: 30,
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
            const SizedBox(
              width: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0 / 2,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/dummy_image.png',
                      height: 38,
                      width: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Welcome, Mark',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
                            crossAxisCount: 5,
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
                                  height: 15,
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
                                      width: 10,
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
                                  height: 10,
                                ),
                                const Text(StringManager.driversLicense,
                                    style: TextStyle(
                                        color: newPrimaryColor,
                                        fontFamily: StringManager.dmSans,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16)),
                                const SizedBox(height: 10),
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
