import 'package:drivelink_admin/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';

class BottomSheetButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  const BottomSheetButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: fadedBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  icon,
                  color: newPrimaryColor,
                  size: 15,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontFamily: StringManager.dmSans,
                          fontWeight: FontWeight.w700)),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: mainTextColor,
                      fontSize: 14,
                      fontFamily: StringManager.dmSans,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class SelectImageBottomSheet extends StatelessWidget {
  final Function onFirstTap;
  final Function onSecondTap;

  const SelectImageBottomSheet(
      {Key? key, required this.onFirstTap, required this.onSecondTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                BottomSheetButton(
                    icon: Icons.photo_camera_rounded,
                    title: StringManager.camera,
                    subtitle: StringManager.cameraText,
                    onTap: () {
                      onFirstTap();
                    }),
                BottomSheetButton(
                    icon: Icons.photo_album_rounded,
                    title: StringManager.gallery,
                    subtitle: StringManager.galleryText,
                    onTap: () {
                      onSecondTap();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
