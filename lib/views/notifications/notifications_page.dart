
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/custom_textfield.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  String userValue = 'Users';
  var userType = ['Users', 'Drivers'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fadedGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
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
                            Icon(Icons.arrow_back_sharp, size: 20, color: newPrimaryColor,),
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
                        Text(
                            StringManager.kindly,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 600,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: customTextFieldColor
                          ),
                          height: 45,
                          child: DropdownButton(
                            items: userType.map((String item){
                              return DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(
                                          color: mainTextColor,
                                          fontFamily: StringManager.dmSans,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14)
                                  )
                              );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                userValue = newValue!;
                              });
                            },
                            value: userValue,
                            borderRadius: BorderRadius.circular(10),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 510),
                              child: Icon(Icons.keyboard_arrow_down, color: mainTextColor.withOpacity(0.9)),
                            ),
                            iconSize: 20,
                            underline: Container(),
                            padding: const EdgeInsets.only(left: 10),
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
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: newPrimaryColor
                          ),
                          height: 45,
                          child: Center(
                              child: Text(
                                StringManager.send.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: StringManager.dmSans,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              )

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }


  Widget textBox(hintText, maxLines){
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