import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/models/driver_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../constants/colors.dart';
import '../../resources/string_manager.dart';

class VerificationDetailsPage extends StatefulWidget {
  const VerificationDetailsPage({super.key, required this.driver});

  final DriverModel driver;

  @override
  State<VerificationDetailsPage> createState() =>
      _VerificationDetailsPageState();
}

class _VerificationDetailsPageState extends State<VerificationDetailsPage> {
  bool _isVerified = false;
  String? _downloadUrl;
  String? _driverLicenseFrontUrl;
  String? _driverLicenseBackUrl;
  String? _identificationCardFrontUrl;
  String? _identificationCardBackUrl;

  @override
  void initState() {
    super.initState();
    getDownloadURL(widget.driver.driverLicenseFront).then((url) {
      setState(() {
        _driverLicenseFrontUrl = url;
      });
    }).catchError((error) {
      print("Error getting download URL: $error");
    });
    getDownloadURL(widget.driver.driverLicenseBack).then((url) {
      setState(() {
        _driverLicenseBackUrl = url;
      });
    }).catchError((error) {
      print("Error getting driver license back URL: $error");
    });
    getDownloadURL(widget.driver.identificationCardFront).then((url) {
      setState(() {
        _identificationCardFrontUrl = url;
      });
    }).catchError((error) {
      print("Error getting identification card front URL: $error");
    });

    getDownloadURL(widget.driver.identificationCardBack).then((url) {
      setState(() {
        _identificationCardBackUrl = url;
      });
    }).catchError((error) {
      print("Error getting identification card back URL: $error");
    });

    FirebaseFirestore.instance
        .collection('drivers')
        .doc(widget.driver.id)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          _isVerified = snapshot.data()?['isVerified'] ?? false;
        });
      }
    }).catchError((error) {
      print("Failed to get driver details: $error");
    });
  }

  void _verifyDriver() {
    FirebaseFirestore.instance
        .collection('drivers')
        .doc(widget.driver.id)
        .update({
      'isVerified': true,
    }).then((_) {
      setState(() {
        _isVerified = true;
      });
    }).catchError((error) {
      print("Failed to update driver: $error");
    });
  }

  Future<String> getDownloadURL(String? imagePath) async {
    if (imagePath == null) {
      return Future.error("Image path is null");
    }
    final ref = FirebaseStorage.instance.ref(imagePath);
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: newPrimaryColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          StringManager.details,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: StringManager.dmSans),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: widget.driver.profilePicture != null
                            ? Image.network(
                                widget.driver.profilePicture!,
                                height: 65,
                                width: 65,
                              )
                            : Image.asset(
                                'assets/images/dummy_image.png',
                                height: 65,
                                width: 65,
                              ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${widget.driver.firstName} ${widget.driver.lastName}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: StringManager.dmSans,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              '${widget.driver.state}, ${widget.driver.country}',
                              style: TextStyle(
                                  color: mainTextColor.withOpacity(0.9),
                                  fontFamily: StringManager.dmSans,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!_isVerified) {
                                _verifyDriver();
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _isVerified
                                      ? Colors.blue
                                      : tealColor.withOpacity(0.2)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.check,
                                    color: _isVerified
                                        ? Colors.white
                                        : tealColor.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            _isVerified ? 'Verified' : 'Verify',
                            style: TextStyle(
                                color: _isVerified ? Colors.blue : Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: StringManager.dmSans),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: redColor.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.cancel,
                                  color: redColor.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            StringManager.decline,
                            style: TextStyle(
                                color: redColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: StringManager.dmSans),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
                height: 1,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                StringManager.driversLicense,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    child: _driverLicenseFrontUrl != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoView(
                                    imageProvider:
                                        NetworkImage(_driverLicenseFrontUrl!),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                _driverLicenseFrontUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: primaryColor, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Driver license not submitted',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    child: _driverLicenseBackUrl != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoView(
                                    imageProvider:
                                        NetworkImage(_driverLicenseBackUrl!),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                _driverLicenseBackUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: primaryColor, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Driver license not submitted',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringManager.identificationCard,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    child: _identificationCardFrontUrl != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoView(
                                    imageProvider: NetworkImage(
                                        _identificationCardFrontUrl!),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                _identificationCardFrontUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: primaryColor, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Identification Card not submitted',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    child: _identificationCardBackUrl != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoView(
                                    imageProvider: NetworkImage(
                                        _identificationCardBackUrl!),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                _identificationCardBackUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: primaryColor, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Identification card not submitted',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringManager.medicalReport,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 150,
                width: 300,
                child: widget.driver.medicalReport != null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoView(
                                imageProvider:
                                    NetworkImage(widget.driver.medicalReport!),
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.driver.medicalReport!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: primaryColor, width: 1),
                        ),
                        child: const Center(
                          child: Text(
                            'Medical Report not submitted',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                StringManager.accountDetails,
                style: TextStyle(
                    color: newPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: StringManager.dmSans),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    StringManager.bankName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    widget.driver.bankName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    StringManager.accountNumber,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    widget.driver.accountNumber,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    StringManager.accountName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    '${widget.driver.firstName} ${widget.driver.lastName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
