import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:drivelink_admin/views/trips/widgets.dart';
import 'package:flutter/material.dart';
import '../../resources/string_manager.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fadedGreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppbar(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: text.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: tripDetailsWidget(
                                text[index],
                                value[index],
                                current == index
                                    ? newPrimaryColor
                                    : Colors.transparent,
                              ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                current == 0
                                    ? StringManager.allTrips
                                    : current == 1
                                        ? StringManager.completedTrips
                                        : StringManager.cancelledTrips,
                                style: const TextStyle(
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
                            ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (ctx, index) {
                                  return TripsCard(
                                    name1: current == 0
                                        ? valueBody[0]
                                        : valueBody[0],
                                    name2: current == 0
                                        ? valueBody[1]
                                        : valueBody[1],
                                    text1: current == 0
                                        ? valueBody[2]
                                        : valueBody[2],
                                    text2: current == 0
                                        ? valueBody[3]
                                        : valueBody[3],
                                    amount: current == 0
                                        ? valueBody[4]
                                        : valueBody[4],
                                    date: current == 0
                                        ? valueBody[5]
                                        : valueBody[5],
                                    time: current == 0
                                        ? valueBody[6]
                                        : valueBody[6],
                                    amountColor: current == 0
                                        ? newPrimaryColor
                                        : current == 1
                                            ? newPrimaryColor
                                            : errorColor,
                                  );
                                })
                          ],
                        ),
                      ),
                    )
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0)),
      height: 130,
      width: 260,
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
