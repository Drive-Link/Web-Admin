import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../helpers/custom_textfield.dart';
import '../../models/user_model.dart';
import '../../resources/string_manager.dart';

class DriversDetailsPage extends StatefulWidget {
  const DriversDetailsPage({super.key, required this.user});

  final UserModel user;

  @override
  State<DriversDetailsPage> createState() => _DriversDetailsPageState();
}

class _DriversDetailsPageState extends State<DriversDetailsPage> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool editMode = false;

  @override
  void initState() {
    super.initState();
    _emailAddressController.text = widget.user.emailAddress;
    _phoneNumberController.text = widget.user.phoneNumber;
    _locationController.text = widget.user.state;
  }

  void toggleEditMode() {
    setState(() {
      editMode = !editMode;
    });
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
          StringManager.driversDetails,
          style: TextStyle(
              color: newPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: StringManager.dmSans),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(
                        'assets/images/dummy_image.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.user.firstName} ${widget.user.lastName}',
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
                          onTap: () {
                            toggleEditMode();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: newPrimaryColor.withOpacity(0.2)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.edit,
                                  color: newPrimaryColor.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          StringManager.edit,
                          style: TextStyle(
                              color: newPrimaryColor,
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
                          StringManager.block,
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
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      StringManager.totalAmountEarned,
                      style: TextStyle(
                          color: newPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '75,680.50',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 150,
                      decoration: const BoxDecoration(color: newPrimaryColor),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 80,
                  width: 1,
                  decoration: const BoxDecoration(color: otpInputColor),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      StringManager.totalAmountWithdrawn,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: redColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '50,000.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 150,
                      decoration: const BoxDecoration(color: redColor),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 80,
                  width: 1,
                  decoration: const BoxDecoration(color: otpInputColor),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      StringManager.balance,
                      style: TextStyle(
                          color: tealColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '25,680.50',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringManager.dmSans),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 150,
                      decoration: const BoxDecoration(color: tealColor),
                    )
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    StringManager.profileDetails,
                    style: TextStyle(
                        color: newPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: StringManager.dmSans),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildTextField(
                      label: StringManager.emailAddress,
                      controller: _emailAddressController,
                      icon: Icons.email),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextField(
                      label: StringManager.phoneNumber,
                      controller: _phoneNumberController,
                      icon: Icons.call),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextField(
                    label: StringManager.location,
                    controller: _locationController,
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (editMode)
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: newPrimaryColor,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Center(
                          child: Text(StringManager.edit.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: StringManager.dmSans,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
              ],
            ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: StringManager.dmSans,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        editMode
            ? CustomTextField(
                hintText: label,
                controller: controller,
                suffixIcon: Icon(
                  icon,
                  color: showHideColor,
                  size: 20,
                ),
              )
            : Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: customTextFieldColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: StringManager.dmSans,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        icon,
                        color: showHideColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
