import 'package:drivelink_admin/views/drivers/account_creation/profile_picture.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/elevated_button.dart';
import '../../../resources/string_manager.dart';
import 'account_details.dart';
import 'drivers_license.dart';
import 'identification_card.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: newPrimaryColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          StringManager.createDriver,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: StringManager.dmSans),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                StringManager.stepTwo,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                StringManager.uploadDocuments,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 25,
              ),
              VerificationSteps(
                  text: StringManager.profilePicture,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePicturePage(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              VerificationSteps(
                  text: StringManager.driversLicense,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DriversLicense(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              VerificationSteps(
                  text: StringManager.identificationCard,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IdentificationCard(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              VerificationSteps(
                  text: StringManager.medicalReport,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MedicalReport(),
                    //   ),
                    // );
                  }),
              const SizedBox(
                height: 10,
              ),
              VerificationSteps(
                  text: StringManager.accountDetails,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountDetails(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: newPrimaryColor,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: Text(StringManager.finish.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: StringManager.dmSans,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationSteps extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const VerificationSteps(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: light),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: mainTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: StringManager.dmSans),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 22,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
