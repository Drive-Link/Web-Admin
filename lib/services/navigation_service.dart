import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) async {
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      return currentState.pushNamed(routeName);
    }
  }

  Future<dynamic> globalNavigateTo(
      String routeName, BuildContext context) async {
    final currentContext = context;
    return Navigator.of(currentContext).pushNamed(routeName);
    }

  void goBack() {
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      currentState.pop();
    }
  }
}
