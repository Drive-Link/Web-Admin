import 'package:flutter/material.dart';
import '../helpers/enumerators.dart';

class AppProvider with ChangeNotifier {
  DisplayedPage? currentPage;
  bool _active1 = false;
  bool _active2 = false;
  bool _active3 = false;
  bool _active4 = false;
  bool _active5 = false;

  bool get active1 => _active1;
  bool get active2 => _active2;
  bool get active3 => _active3;
  bool get active4 => _active4;
  bool get active5 => _active5;

  AppProvider.init() {
    changeCurrentPage(DisplayedPage.DASHBOARD);
  }

  changeCurrentPage(DisplayedPage newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void setActive1(bool value) {
    _active1 = value;
    notifyListeners();
  }

  void setActive2(bool value) {
    _active2 = value;
    notifyListeners();
  }

  void setActive3(bool value) {
    _active3 = value;
    notifyListeners();
  }

  void setActive4(bool value) {
    _active4 = value;
    notifyListeners();
  }

  void setActive5(bool value) {
    _active2 = value;
    notifyListeners();
  }
}
