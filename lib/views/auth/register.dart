import 'package:drivelink_admin/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../helpers/custom_textfield.dart';
import '../../helpers/elevated_button.dart';
import '../../helpers/loading.dart';
import '../../locator.dart';
import '../../provider/auth_provider.dart';
import '../../resources/string_manager.dart';
import '../../services/navigation_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.status == Status.Authenticating? Loading() : Scaffold(
      key: _key,
      backgroundColor: newPrimaryColor,
      body: Center(
        child: Row(
          children: [
            const Expanded(
                child: Center(
              child: Text(
                StringManager.appName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 52,
                    fontFamily: StringManager.dmSans,
                    fontWeight: FontWeight.w900),
              ),
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 1,
                width: 10,
              ),
            ),
            Expanded(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 200,
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
                      hintText: StringManager.firstName,
                      controller: authProvider.firstName,
                      suffixIcon: const Icon(
                        Icons.person,
                        color: showHideColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintText: StringManager.lastName,
                      controller: authProvider.lastName,
                      suffixIcon: const Icon(
                        Icons.person,
                        color: showHideColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                      height: 15,
                    ),
                    CustomTextField(
                      hintText: StringManager.password,
                      controller: authProvider.password,
                      obscureText: obscurePassword,
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
                      height: 45,
                    ),
                    BtnElevated(
                        onPressed: () async{
                         if(!await authProvider.signUp()){
                           ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text("Registration failed!"))

                           );
                           return;
                         }
                         authProvider.clearController();
                         locator<NavigationService>().globalNavigateTo(dashboardRoute, context);
                        },
                        child: Text(StringManager.register.toUpperCase(),
                            style: const TextStyle(
                                color: primaryColor,
                                fontFamily: StringManager.dmSans,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        locator<NavigationService>().globalNavigateTo(loginRoute, context);
                      },
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: StringManager.alreadyHave,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: StringManager.login,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
