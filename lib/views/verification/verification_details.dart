import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/user_model.dart';
import '../../resources/string_manager.dart';

class VerificationDetailsPage extends StatefulWidget {
  const VerificationDetailsPage({super.key, required this.user});

  final UserModel user;

  @override
  State<VerificationDetailsPage> createState() =>
      _VerificationDetailsPageState();
}

class _VerificationDetailsPageState extends State<VerificationDetailsPage> {
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
                        radius: 30,
                        child: Image.asset(
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
                              '${widget.user.firstName} ${widget.user.lastName}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: StringManager.dmSans,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text('${widget.user.state}, ${widget.user.country}',
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
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: tealColor.withOpacity(0.2)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.check,
                                    color: tealColor.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            StringManager.verify,
                            style: TextStyle(
                                color: Colors.green,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/images/licence_front.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/images/licence_back.png',
                      fit: BoxFit.fill,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/images/licence_front.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/images/licence_back.png',
                      fit: BoxFit.fill,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(
                  'assets/images/licence_front.png',
                  fit: BoxFit.fill,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringManager.bankName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'Access Bank',
                    style: TextStyle(
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringManager.accountNumber,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringManager.dmSans),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    '12345678900',
                    style: TextStyle(
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
                    '${widget.user.firstName} ${widget.user.lastName}',
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
