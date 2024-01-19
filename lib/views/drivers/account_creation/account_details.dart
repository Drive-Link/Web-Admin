

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/custom_textfield.dart';
import '../../../helpers/new_elevated_button.dart';
import '../../../resources/string_manager.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          StringManager.accountDetails,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 24,
              fontFamily: StringManager.dmSans,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
          color: newPrimaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringManager.accountDetailsInfo,
              style: TextStyle(
                  color: mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: StringManager.dmSans),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: StringManager.bank,
              suffixIcon: Icon(
                Icons.food_bank_rounded,
                color: showHideColor,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              hintText: StringManager.accountNumber,
              suffixIcon: Icon(
                Icons.confirmation_number_outlined,
                color: showHideColor,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              hintText: StringManager.accountName,
              suffixIcon: Icon(
                Icons.person,
                color: showHideColor,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            NewBtnElevated(
              onPressed: (){

              },
              child: Text(
                StringManager.finish.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: StringManager.dmSans,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
