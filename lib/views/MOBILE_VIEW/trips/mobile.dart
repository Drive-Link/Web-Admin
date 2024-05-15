import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:flutter/material.dart';

class MobileTripsPage extends StatefulWidget {
  const MobileTripsPage({super.key});

  @override
  State<MobileTripsPage> createState() => _MobileTripsPageState();
}

class _MobileTripsPageState extends State<MobileTripsPage> {
  List text = [
    StringManager.allTrips,
    StringManager.completedTrips,
    StringManager.cancelledTrips,
  ];

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

  int current = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: fadedGreen,
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
      endDrawer: const MobileSideMenu(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    GestureDetector(
                            onTap: () {
                              locator<NavigationService>().globalNavigateTo(allTripsRoute, context);
                            },
                            child: tripDetailsWidget(
                              text[0],
                              value[0],
                              newPrimaryColor
                            )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          locator<NavigationService>().globalNavigateTo(completedTripsRoute, context);
                        },
                        child: tripDetailsWidget(
                            text[1],
                            value[1],
                            newPrimaryColor
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          locator<NavigationService>().globalNavigateTo(cancelledTripsRoute, context);
                        },
                        child: tripDetailsWidget(
                            text[2],
                            value[2],
                            newPrimaryColor
                        )),
                    // Container(
                    //   height: MediaQuery.of(context).size.height,
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 15),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(12.0)),
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //             current == 0
                    //                 ? StringManager.allTrips
                    //                 : current == 1
                    //                     ? StringManager.completedTrips
                    //                     : StringManager.cancelledTrips,
                    //             style: const TextStyle(
                    //                 color: newPrimaryColor,
                    //                 fontFamily: StringManager.dmSans,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 14)),
                    //         const SizedBox(
                    //           height: 10,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(100),
                    //                 border: Border.all(
                    //                   color: mainTextColor.withOpacity(0.8),
                    //                   width: 1
                    //                 )
                    //               ),
                    //               height: 30,
                    //               child: Center(
                    //                 child: DropdownButton(
                    //                   items: months.map((String item){
                    //                     return DropdownMenuItem(
                    //                         value: item,
                    //                         child: Text(item,
                    //                             style: const TextStyle(
                    //                                 color: mainTextColor,
                    //                                 fontFamily: StringManager.dmSans,
                    //                                 fontWeight: FontWeight.w700,
                    //                                 fontSize: 14)
                    //                         )
                    //                     );
                    //                   }).toList(),
                    //                   onChanged: (String? newValue){
                    //                     setState(() {
                    //                       dropdownValue = newValue!;
                    //                     });
                    //                   },
                    //                   value: dropdownValue,
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   icon: Icon(Icons.keyboard_arrow_down, color: mainTextColor.withOpacity(0.9)),
                    //                   iconSize: 20,
                    //                   underline: Container(),
                    //                   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //                 ),
                    //               ),
                    //             ),
                    //             const SizedBox(width: 10,),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(100),
                    //                   border: Border.all(
                    //                       color: mainTextColor.withOpacity(0.8),
                    //                       width: 1
                    //                   )
                    //               ),
                    //               height: 30,
                    //               child: Center(
                    //                 child: DropdownButton(
                    //                   items: years.map((String item){
                    //                     return DropdownMenuItem(
                    //                         value: item,
                    //                         child: Text(item,
                    //                             style: const TextStyle(
                    //                                 color: mainTextColor,
                    //                                 fontFamily: StringManager.dmSans,
                    //                                 fontWeight: FontWeight.w700,
                    //                                 fontSize: 14)
                    //                         )
                    //                     );
                    //                   }).toList(),
                    //                   onChanged: (String? newValue){
                    //                     setState(() {
                    //                       yearValue = newValue!;
                    //                     });
                    //                   },
                    //                   value: yearValue,
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   icon: Icon(Icons.keyboard_arrow_down, color: mainTextColor.withOpacity(0.9)),
                    //                   iconSize: 20,
                    //                   underline: Container(),
                    //                   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //         ListView.builder(
                    //             itemCount: 3,
                    //             shrinkWrap: true,
                    //             scrollDirection: Axis.vertical,
                    //             itemBuilder: (ctx, index) {
                    //               return TripsCard(
                    //                 name1: current == 0
                    //                     ? valueBody[0]
                    //                     : valueBody[0],
                    //                 name2: current == 0
                    //                     ? valueBody[1]
                    //                     : valueBody[1],
                    //                 text1: current == 0
                    //                     ? valueBody[2]
                    //                     : valueBody[2],
                    //                 text2: current == 0
                    //                     ? valueBody[3]
                    //                     : valueBody[3],
                    //                 amount: current == 0
                    //                     ? valueBody[4]
                    //                     : valueBody[4],
                    //                 date: current == 0
                    //                     ? valueBody[5]
                    //                     : valueBody[5],
                    //                 time: current == 0
                    //                     ? valueBody[6]
                    //                     : valueBody[6],
                    //                 amountColor: current == 0
                    //                     ? newPrimaryColor
                    //                     : current == 1
                    //                         ? newPrimaryColor
                    //                         : errorColor,
                    //               );
                    //             })
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tripDetailsWidget(tripsInfoText, tripsInfoValue, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
     // margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0)),
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(tripsInfoText,
              style: const TextStyle(
                  color: newPrimaryColor,
                  fontFamily: StringManager.dmSans,
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
          const SizedBox(
            height: 35,
          ),
          Text(tripsInfoValue,
              style: const TextStyle(
                  color: mainTextColor,
                  fontFamily: StringManager.dmSans,
                  fontWeight: FontWeight.w400,
                  fontSize: 22)),
          Container(
            width: 100,
            height: 5,
            color: newPrimaryColor,
          ),
        ],
      ),
    );
  }
}
