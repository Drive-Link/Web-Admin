import 'package:drivelink_admin/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../helpers/custom_textfield.dart';
import '../../helpers/elevated_button.dart';
import '../../resources/string_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hintText: StringManager.emailAddress,
                      controller: emailController,
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
                      controller: passwordController,
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
                      height: 70,
                    ),
                    BtnElevated(
                        onPressed: () {},
                        child: Text(StringManager.login.toUpperCase(),
                            style: const TextStyle(
                                color: primaryColor,
                                fontFamily: StringManager.dmSans,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
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
