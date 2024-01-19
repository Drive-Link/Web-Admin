import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFECFCF8)),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('drivers').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Loading());
            }

            var userModels = snapshot.data!.docs
                .map((doc) => UserModel.fromSnapshot(doc))
                .toList();

            return Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.5),
                  itemCount: userModels.length,
                  itemBuilder: (context, index) {
                    final UserModel user = userModels[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VerificationDetailsPage(user: user)),
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
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      'assets/images/dummy_image.png',
                                      height: 50,
                                      width: 50,
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
                                                overflow: TextOverflow.ellipsis,
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
    );
  }
}
