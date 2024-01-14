import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/passengers/passengers_details.dart';
import 'package:flutter/material.dart';
import '../../helpers/loading.dart';
import '../../models/user_model.dart';

class PassengersPage extends StatefulWidget {
  const PassengersPage({super.key});

  @override
  State<PassengersPage> createState() => _PassengersPageState();
}

class _PassengersPageState extends State<PassengersPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
                  header: const Text(
                    StringManager.passengers,
                    style: TextStyle(
                        color: newPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: StringManager.dmSans),
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
                  source: PassengersTableSource(
                    paginatedData,
                    onRowTap: (user) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PassengersDetailsPage(
                            user: user,
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

class PassengersTableSource extends DataTableSource {
  final List<UserModel> _userModels;
  final Function(UserModel) onRowTap;

  PassengersTableSource(this._userModels, {required this.onRowTap});

  @override
  DataRow? getRow(int index) {
    if (index >= _userModels.length) {
      return null;
    }
    final UserModel user = _userModels[index];
    return DataRow(
      cells: [
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(user);
            },
            child: Text((index + 1).toString()))),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(user);
            },
            child: Text('${user.firstName} ${user.lastName}'))),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(user);
            },
            child: Text(user.emailAddress))),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(user);
            },
            child: Text(user.phoneNumber))),
        DataCell(GestureDetector(
            onTap: () {
              onRowTap(user);
            },
            child: Text('${user.state}, ${user.country}'))),
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
