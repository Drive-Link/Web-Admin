import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/transactions/tabs/drivers.dart';
import 'package:drivelink_admin/views/transactions/tabs/users.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fadedGreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              tabBarOption(tabController),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [UsersTransactions(), DriversTransactions()],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarOption(TabController tabController) {
    return Container(
      decoration: BoxDecoration(
        color: customTextFieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 50,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: TabBar(
          onTap: (value) {},
          controller: tabController,
          labelColor: primaryColor,
          unselectedLabelColor: mainTextColor,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          tabs: [
            Tab(
              child: Container(
                height: 38,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    StringManager.users,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                height: 38,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    StringManager.drivers,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}