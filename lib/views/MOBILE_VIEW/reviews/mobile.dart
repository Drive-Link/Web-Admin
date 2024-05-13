import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/models/user_model.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/helpers/drawer.dart';
import 'package:drivelink_admin/views/MOBILE_VIEW/notifications/mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MobileReviewsPage extends StatefulWidget {
  const MobileReviewsPage({super.key});

  @override
  State<MobileReviewsPage> createState() => _MobileReviewsPageState();
}

class _MobileReviewsPageState extends State<MobileReviewsPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 1;
  String _searchQuery = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      body: StreamBuilder<QuerySnapshot>(
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

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //           'Showing $_currentPage-$_rowsPerPage of ${userModels.length}'),
                  //       Row(
                  //         children: [
                  //           if (_currentPage > 1)
                  //             TextButton(
                  //               onPressed: () {
                  //                 setState(() {
                  //                   _currentPage--;
                  //                 });
                  //               },
                  //               child: const Text(
                  //                 StringManager.previous,
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w700),
                  //               ),
                  //             ),
                  //           if (paginatedData.length == _rowsPerPage)
                  //             TextButton(
                  //               onPressed: () {
                  //                 setState(() {
                  //                   _currentPage++;
                  //                 });
                  //               },
                  //               child: const Text(
                  //                 StringManager.next,
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w700),
                  //               ),
                  //             ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
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