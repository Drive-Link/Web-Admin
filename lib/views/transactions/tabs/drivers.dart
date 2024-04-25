import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/assets_manager.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:drivelink_admin/views/drivers/drivers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriversTransactions extends StatefulWidget {
  const DriversTransactions({super.key});

  @override
  State<DriversTransactions> createState() => _DriversTransactionsState();
}

class _DriversTransactionsState extends State<DriversTransactions> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        customUserWidget(
                            newPrimaryColor,
                            'Total Income',
                            newPrimaryColor,
                            'assets/images/income_one.png',
                            'assets/images/income_two.png',
                            '300,000',
                            newPrimaryColor),
                        const SizedBox(width: 20,),
                        customUserWidget(
                            tealColor,
                            'Total Withdrawals',
                            tealColor,
                            'assets/images/withdraw_one.png',
                            'assets/images/withdraw_two.png',
                            '120,000',
                            tealColor),
                        const SizedBox(width: 20,),
                        customUserWidget(
                            wineColor,
                            'Total Balance',
                            wineColor,
                            'assets/images/balance_one.png',
                            'assets/images/balance_two.png',
                            '180,000',
                            wineColor),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
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
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    StringManager.totalDriversWithdrawals,
                                    style: TextStyle(
                                        color: newPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/bar_chart.png',
                                  height: 300,
                                  width: 600,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
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
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: StringManager.dmSans),
                                              ),
                                              SizedBox(width: 20,),
                                              Text(
                                                StringManager.name,
                                                style: TextStyle(
                                                    color: mainTextColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: StringManager.dmSans),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            StringManager.rides,
                                            style: TextStyle(
                                                color: mainTextColor,
                                                fontSize: 16,
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
                        ),
                      ],
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
                                    StringManager.weeklyWithdrawals,
                                    style: TextStyle(
                                        color: newPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //       const DriversPage()),
                                      // );
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
                                    StringManager.totalAmount,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.withdrawals,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.balance,
                                    style: TextStyle(
                                        color: mainTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: StringManager.dmSans),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    StringManager.date,
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

  customUserWidget(smallImageColor, userText, userTextColor, imageOne, imageTwo, userValue, containerColor) {
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
                SvgPicture.asset(
                  AssetManager.transactionsSvg,
                  height: 25,
                  width: 25,
                  color: smallImageColor,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  imageOne,
                  height: 70,
                  width: 70,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  imageTwo,
                  height: 70,
                  width: 70,
                ),
              ),
            ],
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