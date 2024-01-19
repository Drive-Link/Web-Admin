import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/drivers/account_creation/register.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import 'drivers_details_page.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('drivers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loading());
        }

        var userModels = snapshot.data!.docs
            .map((doc) => UserModel.fromSnapshot(doc))
            .toList();

        // Paginate the data
        int startIndex = (_currentPage - 1) * _rowsPerPage;
        int endIndex = startIndex + _rowsPerPage;
        List<UserModel> paginatedData = userModels.sublist(
            startIndex, endIndex.clamp(0, userModels.length));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DriversRegistration()
                            ),
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
                      StringManager.location,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
                  ],
                  source: DriversTableSource(paginatedData,
                    onRowTap: (user) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriversDetailsPage(
                            user: user,
                          ),
                        ),
                      );
                    },),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Showing $_currentPage-$_rowsPerPage of ${userModels.length}'),
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
    );
  }
}

class DriversTableSource extends DataTableSource {
  final List<UserModel> _userModels;
  final Function(UserModel) onRowTap;

  DriversTableSource(this._userModels, {required this.onRowTap});

  @override
  DataRow? getRow(int index) {
    if (index >= _userModels.length) {
      return null;
    }
    final UserModel user = _userModels[index];
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(GestureDetector(
          onTap: (){
            onRowTap(user);
          },
            child: Text('${user.firstName} ${user.lastName}'))),
        DataCell(Text(user.emailAddress)),
        DataCell(Text(user.phoneNumber)),
        DataCell(Text('${user.state}, ${user.country}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _userModels.length;

  @override
  int get selectedRowCount => 0;
}
