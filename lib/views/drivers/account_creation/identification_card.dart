import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/new_elevated_button.dart';
import '../../../resources/string_manager.dart';
import '../../components/bottom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:drivelink_admin/constants/colors.dart';

class IdentificationCard extends StatefulWidget {
  const IdentificationCard({super.key});

  @override
  State<IdentificationCard> createState() => _IdentificationCardState();
}

class _IdentificationCardState extends State<IdentificationCard> {
  final ImagePicker _imagePicker = ImagePicker();
  String? frontImagePath;
  String? backImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          StringManager.identificationCard,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 24,
              fontFamily: StringManager.dmSans,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
          color: newPrimaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringManager.idCardText,
                style: TextStyle(
                    color: mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringManager.front,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _showImageOptionsDialog(context, true);
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    dashPattern: const [4, 4],
                    color: dottedColor,
                    strokeWidth: 1,
                    child: SizedBox(
                      height: 300,
                      child: frontImagePath != null
                          ? Image.file(
                              File(frontImagePath!),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
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
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                StringManager.back,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _showImageOptionsDialog(context, false);
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    dashPattern: const [4, 4],
                    color: dottedColor,
                    strokeWidth: 1,
                    child: SizedBox(
                      height: 300,
                      child: backImagePath != null
                          ? Image.file(
                              File(backImagePath!),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
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
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
              NewBtnElevated(
                onPressed: (frontImagePath != null && backImagePath != null)
                    ? () {}
                    : null,
                // Disable button if imagePath is null
                buttonStyle: ButtonStyle(
                  backgroundColor:
                      (frontImagePath != null && backImagePath != null)
                          ? MaterialStateProperty.all(primaryColor)
                          : MaterialStateProperty.all(dottedColor),
                ),
                child: Text(
                  StringManager.finish.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: StringManager.dmSans,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showImageOptionsDialog(BuildContext context, bool isFrontImage) {
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
              _fromCamera(isFrontImage);
            },
            onSecondTap: () {
              _fromGallery(isFrontImage);
            },
          );
        });
  }

  Future<void> _fromGallery(bool isFrontImage) async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (pickedFile != null) {
      setState(() {
        if (isFrontImage) {
          frontImagePath = pickedFile.path;
        } else {
          backImagePath = pickedFile.path;
        }
      });
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _fromCamera(bool isFrontImage) async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 30,
    );

    if (pickedFile != null) {
      setState(() {
        if (isFrontImage) {
          frontImagePath = pickedFile.path;
        } else {
          backImagePath = pickedFile.path;
        }
      });
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }
}
