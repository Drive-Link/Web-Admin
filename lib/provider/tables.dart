import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

import '../models/user_model.dart';
import '../services/user.dart';

class TablesProvider with ChangeNotifier {
  List<DatatableHeader> passengersTableHeader = [
    DatatableHeader(
        text: "S/N", value: "id", show: true, textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "first_name",
        show: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Email Address",
        value: "email_address",
        show: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Phone Number",
        value: "phone_number",
        flex: 2,
        show: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Location",
        value: "location",
        show: true,
        textAlign: TextAlign.left),
  ];

  List<int> perPages = [5, 10, 15, 100];
  int total = 100;
  int? currentPerPage;
  int currentPage = 1;
  bool isSearch = false;
  List<Map<String, dynamic>> passengersTableSource = [];
  List<Map<String, dynamic>> selecteds = [];
  String selectableKey = "id";

  bool isLoading = true;
  final UserServices _userServices = UserServices();
  List<UserModel> _users = <UserModel>[];

  List<UserModel> get users => _users;

  Future _loadFromFirebase() async {
    _users = await _userServices.getAllPassengers();
  }

  List<Map<String, dynamic>> _getUsersData() {
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> temps = [];
    if (_users != null) {
      for (UserModel userData in _users) {
        temps.add({
          "id": userData.id,
          "email": userData.emailAddress,
          "first_name": userData.firstName,
          "last_name": userData.lastName,
          "location": userData.location,
          "phone_number": userData.phoneNumber,
        });
      }
    }
    isLoading = false;
    notifyListeners();
    return temps;
  }

  _initData() async {
    isLoading = true;
    notifyListeners();
    await _loadFromFirebase();
    passengersTableSource.addAll(_getUsersData());
    isLoading = false;
    notifyListeners();
  }

  onSelected(bool value, Map<String, dynamic> item) {
    print("$value  $item ");
    if (value) {
      selecteds.add(item);
    } else {
      selecteds.removeAt(selecteds.indexOf(item));
    }
    notifyListeners();
  }

  onSelectAll(bool value) {
    if (value) {
      selecteds = passengersTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }

  onChanged(int value) {
    currentPerPage = value;
    notifyListeners();
  }

  previous() {
    currentPage = currentPage >= 2 ? currentPage - 1 : 1;
    notifyListeners();
  }

  next() {
    currentPage++;
    notifyListeners();
  }

  TablesProvider.init() {
    _initData();
  }
}
