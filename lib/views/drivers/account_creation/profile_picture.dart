import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:drivelink_admin/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helpers/new_elevated_button.dart';
import '../../../resources/string_manager.dart';
import '../../components/bottom_sheet.dart';

class ProfilePicturePage extends StatefulWidget {
  const ProfilePicturePage({super.key});

  @override
  State<ProfilePicturePage> createState() => _ProfilePicturePageState();
}

class _ProfilePicturePageState extends State<ProfilePicturePage> {
  final ImagePicker _imagePicker = ImagePicker();
  String? imagePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          StringManager.profilePicture,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 18,
              fontFamily: StringManager.dmSans,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          iconSize: 24,
          color: newPrimaryColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringManager.takePictureInfo,
                style: TextStyle(
                    color: mainTextColor,
                    fontSize: 16,
                    fontFamily: StringManager.dmSans,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  _showImageOptionsDialog(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(150),
                      dashPattern: const [4, 4],
                      color: dottedColor,
                      strokeWidth: 1,
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                          child: imagePath != null
                              ? Image.file(
                                  File(imagePath!),
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/camera_icon.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      StringManager.takePhoto,
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 150),
              NewBtnElevated(
                onPressed: imagePath != null ? () {} : null,
                // Disable button if imagePath is null
                buttonStyle: ButtonStyle(
                  backgroundColor: imagePath != null
                      ? MaterialStateProperty.all(primaryColor)
                      : MaterialStateProperty.all(dottedColor),
                ),
                child: Text(
                  StringManager.next.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: StringManager.dmSans,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showImageOptionsDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SelectImageBottomSheet(
            onFirstTap: () {
              _fromCamera();
            },
            onSecondTap: () {
              _fromGallery();
            },
          );
        });
  }

  Future<void> _fromGallery() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _fromCamera() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 30,
    );

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }
}
