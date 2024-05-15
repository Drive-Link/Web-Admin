import 'package:drivelink_admin/views/MOBILE_VIEW/login/mobile.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const LoginScreen(),
        mobile: (BuildContext context) =>  const MobileLogin()
    );
  }
}
