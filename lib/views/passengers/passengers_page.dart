import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';
import '../../provider/tables.dart';

class PassengersPage extends StatefulWidget {
  const PassengersPage({super.key});

  @override
  State<PassengersPage> createState() => _PassengersPageState();
}

class _PassengersPageState extends State<PassengersPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(0),
              constraints: const BoxConstraints(
                maxHeight: 700,
              ),
              child: Card(
                elevation: 1,
                shadowColor: Colors.black,
                clipBehavior: Clip.none,
                child: ResponsiveDatatable(
                  title: !tablesProvider.isSearch
                      ? const Text(
                          StringManager.passengers,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontFamily: StringManager.dmSans),
                        )
                      : null,
                  actions: const [
                    Expanded(
                        child: Text(
                      StringManager.seeAll,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontFamily: StringManager.dmSans),
                    ))
                  ],
                  headers: tablesProvider.passengersTableHeader ?? [],
                  source: tablesProvider.passengersTableSource ?? [],
                  selecteds: tablesProvider.selecteds,
                  autoHeight: false,
                  onTabRow: (data) {
                    print(data);
                  },
                  isLoading: tablesProvider.isLoading,
                  footers: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text("Rows per page:"),
                    ),
                    if (tablesProvider.perPages != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton(
                            value: tablesProvider.currentPerPage,
                            items: tablesProvider.perPages
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text("$e"),
                                    ))
                                .toList(),
                            onChanged: (value) {}),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                          "${tablesProvider.currentPage} - ${tablesProvider.currentPage} of ${tablesProvider.total}"),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                      onPressed: tablesProvider.previous,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: tablesProvider.next,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
