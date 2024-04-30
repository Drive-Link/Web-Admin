import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/models/driver_model.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/drivers/account_creation/register.dart';
import 'package:flutter/material.dart';

import 'drivers_details_page.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 1;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Drivers",
                  helperStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                  ),
                  fillColor: customTextFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: textColor.withOpacity(0.5),
                  )),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            )),
            const SizedBox(
              width: 5,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/bell.png",
                  height: 30,
                  width: 30,
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
            const SizedBox(
              width: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0 / 2,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/dummy_image.png',
                      height: 38,
                      width: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Welcome, Mark',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('drivers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Loading());
          }

          var driverModels = snapshot.data!.docs
              .map((doc) => DriverModel.fromSnapshot(doc))
              .where((driver) =>
                  driver.firstName
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()) ||
                  driver.lastName
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()))
              .toList();

          // Paginate the data
          int startIndex = (_currentPage - 1) * _rowsPerPage;
          int endIndex = startIndex + _rowsPerPage;
          List<DriverModel> paginatedData = driverModels.sublist(
              startIndex, endIndex.clamp(0, driverModels.length));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      horizontalMargin: 12,
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            StringManager.drivers,
                            style: TextStyle(
                                color: newPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: StringManager.dmSans),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DriversRegistration()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: newPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                    color: Colors.white,
                                    iconSize: 25,
                                  ),
                                  const Text(
                                    StringManager.createDriver,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: StringManager.dmSans,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      columns: const [
                        DataColumn(
                            label: Text(
                          StringManager.sN,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          StringManager.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          StringManager.emailAddress,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          StringManager.phoneNumber,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          StringManager.status,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          StringManager.location,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                      ],
                      source: DriversTableSource(
                        paginatedData,
                        onRowTap: (driver) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriversDetailsPage(
                                driver: driver,
                              ),
                            ),
                          );
                        },
                      ),
                      rowsPerPage: _rowsPerPage,
                      availableRowsPerPage: const [5, 10, 20],
                      onPageChanged: (int pageIndex) {
                        setState(() {
                          _currentPage = pageIndex + 1;
                        });
                      },
                      onRowsPerPageChanged: (int? selectedRowsPerPage) {
                        setState(() {
                          _rowsPerPage = selectedRowsPerPage!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Showing $_currentPage-$_rowsPerPage of ${driverModels.length}'),
                    Row(
                      children: [
                        if (_currentPage > 1)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _currentPage--;
                              });
                            },
                            child: const Text(
                              StringManager.previous,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        if (paginatedData.length == _rowsPerPage)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _currentPage++;
                              });
                            },
                            child: const Text(
                              StringManager.next,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DriversTableSource extends DataTableSource {
  final List<DriverModel> _driverModels;
  final Function(DriverModel) onRowTap;

  DriversTableSource(this._driverModels, {required this.onRowTap});

  @override
  DataRow? getRow(int index) {
    if (index >= _driverModels.length) {
      return null;
    }
    final DriverModel driver = _driverModels[index];
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(driver);
            },
            child: Text('${driver.firstName} ${driver.lastName}'))),
        DataCell(Text(driver.emailAddress)),
        DataCell(Text(driver.phoneNumber)),
        DataCell(Text(driver.verificationStatus ? 'Not Verified' : 'Verified')),
        DataCell(Text('${driver.state}, ${driver.country}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _driverModels.length;

  @override
  int get selectedRowCount => 0;
}
