import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileNotificationsPage extends StatefulWidget {
  const MobileNotificationsPage({super.key});

  @override
  State<MobileNotificationsPage> createState() => _MobileNotificationsPageState();
}

class _MobileNotificationsPageState extends State<MobileNotificationsPage> {
  String userValue = 'Users';
  var userType = ['Users', 'Drivers'];

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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                size: 20,
                                color: newPrimaryColor,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Send Notifications',
                            style: TextStyle(
                                color: newPrimaryColor,
                                fontFamily: StringManager.dmSans,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(StringManager.kindly,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: customTextFieldColor),
                        height: 45,
                        child: Row(
                          children: [
                            DropdownButton(
                              items: userType.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: mainTextColor,
                                            fontFamily: StringManager.dmSans,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  userValue = newValue!;
                                });
                              },
                              value: userValue,
                              borderRadius: BorderRadius.circular(10),
                              icon: Padding(
                                  padding: const EdgeInsets.only(left: 260),
                                  child: Icon(Icons.keyboard_arrow_down,
                                      color: mainTextColor.withOpacity(0.9)),
                                ),
                              iconSize: 20,
                              underline: Container(),
                              padding: const EdgeInsets.only(left: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textBox(StringManager.notificationTitle, 1),
                      const SizedBox(
                        height: 20,
                      ),
                      textBox(StringManager.message, 5),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: newPrimaryColor),
                        height: 45,
                        child: Center(
                            child: Text(
                          StringManager.send.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: StringManager.dmSans,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      endDrawer: const MobileSideMenu(),
      backgroundColor: fadedGreen,
    );
  }

  Widget textBox(hintText, maxLines) {
    return SizedBox(
      width: 600,
      child: TextFormField(
        maxLength: 600,
        maxLines: maxLines,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
          fontSize: 16,
          letterSpacing: 0.4,
          fontFamily: StringManager.dmSans,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontFamily: StringManager.dmSans,
            fontSize: 14,
          ),
          filled: true,
          fillColor: customTextFieldColor,
        ),
        textAlign: TextAlign.start,
        //validator: validator,
      ),
    );
  }
}

//Group SizedBox
//Create PR
//Check renderFlex
