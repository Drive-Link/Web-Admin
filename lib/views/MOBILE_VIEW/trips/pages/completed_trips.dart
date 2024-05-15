import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/trips/widgets.dart';
import 'package:flutter/material.dart';

class CompletedTripsPage extends StatefulWidget {
  const CompletedTripsPage({Key? key}) : super(key: key);

  @override
  State<CompletedTripsPage> createState() => _CompletedTripsPageState();
}

class _CompletedTripsPageState extends State<CompletedTripsPage> {

  List value = ['64,568', '63,243', '1,325'];

  List valueBody = [
    'Tobiloba Charles',
    'Mark Folahan',
    'Lagos',
    'Ikeja',
    'N7500',
    'Sun, 12 Jan',
    '12:43PM'
  ];

  var months = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December '];
  var years = ['2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030'];
  String dropdownValue = 'January';
  String yearValue = '2023';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fadedGreen,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/images/drivelink_main.png',height: 25, width: 25,),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset('assets/images/search.png', height: 25, width: 25,),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    locator<NavigationService>().globalNavigateTo(notificationsRoute, context);
                  },
                  child: Stack(
                    children: [
                      Image.asset("assets/images/bell.png",
                        height: 25, width: 25,),
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
                const SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/dummy_image.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      endDrawer: const MobileSideMenu(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      StringManager.completedTrips,
                      style: TextStyle(
                          color: newPrimaryColor,
                          fontFamily: StringManager.dmSans,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: mainTextColor.withOpacity(0.8),
                                width: 1
                            )
                        ),
                        height: 30,
                        child: Center(
                          child: DropdownButton(
                            items: months.map((String item){
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
                                dropdownValue = newValue!;
                              });
                            },
                            value: dropdownValue,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(Icons.keyboard_arrow_down, color: mainTextColor.withOpacity(0.9)),
                            iconSize: 20,
                            underline: Container(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: mainTextColor.withOpacity(0.8),
                                width: 1
                            )
                        ),
                        height: 30,
                        child: Center(
                          child: DropdownButton(
                            items: years.map((String item){
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
                                yearValue = newValue!;
                              });
                            },
                            value: yearValue,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(Icons.keyboard_arrow_down, color: mainTextColor.withOpacity(0.9)),
                            iconSize: 20,
                            underline: Container(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TripsCard(
                    name1: valueBody[0],
                    name2: valueBody[1],
                    text1: valueBody[2],
                    text2: valueBody[3],
                    amount: valueBody[4],
                    date: valueBody[5],
                    time: valueBody[6],
                    amountColor: newPrimaryColor,
                  ),
                  TripsCard(
                    name1: valueBody[0],
                    name2: valueBody[1],
                    text1: valueBody[2],
                    text2: valueBody[3],
                    amount: valueBody[4],
                    date: valueBody[5],
                    time: valueBody[6],
                    amountColor: newPrimaryColor,
                  ),
                  TripsCard(
                    name1: valueBody[0],
                    name2: valueBody[1],
                    text1: valueBody[2],
                    text2: valueBody[3],
                    amount: valueBody[4],
                    date: valueBody[5],
                    time: valueBody[6],
                    amountColor: newPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
