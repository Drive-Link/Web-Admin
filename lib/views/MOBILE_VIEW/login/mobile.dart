import 'package:drivelink_admin/constants/colors.dart';
import 'package:drivelink_admin/helpers/custom_textfield.dart';
import 'package:drivelink_admin/helpers/elevated_button.dart';
import 'package:drivelink_admin/helpers/loading.dart';
import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/provider/auth_provider.dart';
import 'package:drivelink_admin/resources/string_manager.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.status == Status.Authenticating? const Loading() :  Scaffold(
      key: _key,
      backgroundColor: newPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                StringManager.welcomeText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: StringManager.dmSans,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomTextField(
              hintText: StringManager.emailAddress,
              controller: authProvider.email,
              suffixIcon: const Icon(
                Icons.email,
                color: showHideColor,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              hintText: StringManager.password,
              obscureText: obscurePassword,
              controller: authProvider.password,
              suffixIcon: Icon(
                obscurePassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: showHideColor,
                size: 20,
              ),
              showHideTap: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.white,
                    checkColor: primaryColor,
                    value: true,
                    onChanged: (value) {}),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  StringManager.remember,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BtnElevated(
                onPressed: () async {
                  if(!await authProvider.signIn()){
                    if(!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login failed!"))
                    );
                    return;
                  }
                  authProvider.clearController();
                  if(!mounted) return;
                  locator<NavigationService>().globalNavigateTo(mobileDashboardContentRoute, context);
                },
                child: Text(StringManager.login.toUpperCase(),
                    style: const TextStyle(
                        color: newPrimaryColor,
                        fontFamily: StringManager.dmSans,
                        fontSize: 16,
                        fontWeight: FontWeight.w700))),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: (){
                locator<NavigationService>().globalNavigateTo(registerRoute, context);
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: StringManager.doNotHave,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: StringManager.register,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/drivelink_logo.png',
                  height: 20, width: 20,),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 1,
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  StringManager.appName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: StringManager.dmSans,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Center(
              child: Text(StringManager.seamSafe,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: StringManager.dmSans,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            )
          ],
        ),
      ),
    );
  }
}
