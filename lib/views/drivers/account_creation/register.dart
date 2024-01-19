import 'package:drivelink_admin/views/drivers/account_creation/upload_documents.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/custom_textfield.dart';
import '../../../resources/string_manager.dart';

class DriversRegistration extends StatefulWidget {
  const DriversRegistration({super.key});

  @override
  State<DriversRegistration> createState() => _DriversRegistrationState();
}

class _DriversRegistrationState extends State<DriversRegistration> {
  bool obscurePassword = true;
  bool obscurePassword2 = true;

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
                StringManager.stepOne,
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
                StringManager.driversInfo,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: StringManager.firstName,
                      suffixIcon: Icon(
                        Icons.person,
                        color: showHideColor,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: StringManager.lastName,
                      suffixIcon: Icon(
                        Icons.person,
                        color: showHideColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: StringManager.emailAddress,
                suffixIcon: Icon(
                  Icons.email,
                  color: showHideColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: StringManager.phoneNumber,
                suffixIcon: Icon(
                  Icons.phone,
                  color: showHideColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: StringManager.country,
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  color: showHideColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: StringManager.state,
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  color: showHideColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: StringManager.city,
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  color: showHideColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: StringManager.password,
                obscureText: obscurePassword,
                suffixIcon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: showHideColor,
                  size: 20,
                ),
                showHideTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: StringManager.confirmPassword,
                obscureText: obscurePassword2,
                suffixIcon: Icon(
                  obscurePassword2 ? Icons.visibility : Icons.visibility_off,
                  color: showHideColor,
                  size: 20,
                ),
                showHideTap: () {
                  setState(() {
                    obscurePassword2 = !obscurePassword2;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadDocuments(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: newPrimaryColor,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Center(
                    child: Text(StringManager.next.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: StringManager.dmSans,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ),
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
