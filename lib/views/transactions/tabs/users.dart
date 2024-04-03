import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class UsersTransactions extends StatefulWidget {
  const UsersTransactions({super.key});

  @override
  State<UsersTransactions> createState() => _UsersTransactionsState();
}

class _UsersTransactionsState extends State<UsersTransactions> {


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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(StringManager.allUsers,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: StringManager.dmSans,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)
                          ),
                          const SizedBox(
                            width: 30,
                          ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
