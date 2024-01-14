import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../constants/colors.dart';
import '../../helpers/loading.dart';
import '../../models/user_model.dart';
import '../../resources/string_manager.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
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
                  header: const Text(
                    StringManager.allDrivers,
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
                    DataColumn(
                        label: Text(
                      StringManager.rating,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
                  ],
                  source: ReviewsTableSource(paginatedData),
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

class ReviewsTableSource extends DataTableSource {
  final List<UserModel> _userModels;

  ReviewsTableSource(this._userModels);

  @override
  DataRow? getRow(int index) {
    if (index >= _userModels.length) {
      return null;
    }
    final UserModel user = _userModels[index];
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text('${user.firstName} ${user.lastName}')),
        DataCell(Text(user.emailAddress)),
        DataCell(Text(user.phoneNumber)),
        DataCell(Text('${user.state}, ${user.country}')),
        DataCell(
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // Handle rating updates if needed
            },
          ),
        ),
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
