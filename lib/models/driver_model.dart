import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  static const FIRSTNAME = "first_name";
  static const LASTNAME = "last_name";
  static const EMAILADDRESS = "email_address";
  static const PHONENUMBER = "phone_number";
  static const STATE = "state";
  static const COUNTRY = "country";
  static const AMOUNTEARNED = "totalAmountEarned";
  static const AMOUNTWITHDRAWN = "totalAmountWithdrawn";
  static const BALANCE = "balanceAvailable";
  static const VERIFIED = "isVerified";
  static const DRIVER_LICENSE = "driver_license";
  static const IDENTIFICATION_CARD = "identification_card";
  static const MEDICAL_REPORT = "medical_report";
  static const ACCOUNT_NUMBER = "account_number";
  static const BANK_NAME = "bank_name";
  static const DRIVER_ID = "driverId";

  String? _id;
  String? _firstName;
  String? _emailAddress;
  String? _phoneNumber;
  String? _lastName;
  String? _state;
  String? _country;
  bool? _isVerified;
  String? _accountNumber;
  String? _bankName;
  List<String>? _driverLicense;
  List<String>? _identificationCard;
  String? _medicalReport;
  String? _profilePicture;
  double? _amountEarned;
  double? _amountWithdrawn;
  double? _balance;

//  getters
  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get emailAddress => _emailAddress!;

  String get phoneNumber => _phoneNumber!;

  String get state => _state!;

  String get country => _country!;

  String get accountNumber => _accountNumber!;

  String get bankName => _bankName!;

  bool get verificationStatus => _isVerified!;

  double get amountEarned => _amountEarned!;

  double get amountWithdrawn => _amountWithdrawn!;

  double get availableBalance => _balance!;

  String? get driverLicenseFront =>
      _driverLicense != null && _driverLicense!.isNotEmpty
          ? _driverLicense![0]
          : null;

  String? get driverLicenseBack =>
      _driverLicense != null && _driverLicense!.length > 1
          ? _driverLicense![1]
          : null;

  String? get identificationCardFront =>
      _identificationCard != null && _identificationCard!.isNotEmpty
          ? _identificationCard![0]
          : null;

  String? get identificationCardBack =>
      _identificationCard != null && _identificationCard!.length > 1
          ? _identificationCard![1]
          : null;

  String? get medicalReport => _medicalReport;

  String? get profilePicture => _profilePicture;

  String get id => _id!;

  DriverModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    _firstName = data?[FIRSTNAME] ?? "";
    _lastName = data?[LASTNAME] ?? "";
    _phoneNumber = data?[PHONENUMBER] ?? "";
    _state = data?[STATE] ?? "";
    _emailAddress = data?[EMAILADDRESS] ?? "";
    _accountNumber = data?[ACCOUNT_NUMBER] ?? "";
    _bankName = data?[BANK_NAME] ?? "";
    _country = data?[COUNTRY] ?? "";
    _isVerified = data?[VERIFIED] == false;
    _driverLicense = List<String>.from(data?[DRIVER_LICENSE] ?? []);
    _identificationCard = List<String>.from(data?[IDENTIFICATION_CARD] ?? []);
    _medicalReport = data?[MEDICAL_REPORT];
    _profilePicture = data?['profile_picture'];
    _amountWithdrawn = data?[AMOUNTWITHDRAWN] ?? "";
    _amountEarned = data?[AMOUNTEARNED] ?? "";
    _balance = data?[BALANCE] ?? "";
    _id = data?[DRIVER_ID] ?? "";
  }
}
