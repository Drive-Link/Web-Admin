import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/services/navigation_service.dart';
import 'package:flutter/material.dart';
import '../../constants/responsive.dart';
import 'package:drivelink_admin/routing/route_names.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              locator<NavigationService>().globalNavigateTo(notificationsRoute, context);
            },
            child: Stack(
              children: [
               Image.asset("assets/images/bell.png",
               height: 30, width: 30,),
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
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0 / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/dummy_image.png',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
                  child: Text(
                    'Welcome, Mark',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
