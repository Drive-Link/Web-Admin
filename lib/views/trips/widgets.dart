import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:flutter/material.dart';

class TripsCard extends StatelessWidget {
  final String text1, text2, name1, name2, amount, date, time;
  final Color amountColor;
  const TripsCard(
      {super.key,
        required this.name1,
        required this.name2,
        required this.text1,
        required this.text2,
        required this.amount,
        required this.date,
        required this.time,
        required this.amountColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.9),
                        fontFamily: StringManager.dmSans,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_sharp,
                    size: 10,
                    color: mainTextColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.9),
                        fontFamily: StringManager.dmSans,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                amount,
                style: TextStyle(
                    color: amountColor,
                    fontFamily: StringManager.dmSans,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'D: ',
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.9),
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/images/dummy_image.png',
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    name1,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.9),
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    'P: ',
                    style: TextStyle(
                        color: newPrimaryColor,
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/images/dummy_image.png',
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    name2,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.9),
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.8),
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        color: mainTextColor.withOpacity(0.8),
                        fontFamily: StringManager.dmSans,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(height: 1, color: light),
        ],
      ),
    );
  }
}