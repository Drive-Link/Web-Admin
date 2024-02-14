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

  String? _id;
  String? _firstName;
  String? _emailAddress;
  String? _phoneNumber;
  String? _lastName;
  String? _state;
  String? _country;
  bool? _isVerified;

  //String? _amountEarned;
  //String? _amountWithdrawn;
  double? _balance;

//  getters
  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get emailAddress => _emailAddress!;

  String get phoneNumber => _phoneNumber!;

  String get state => _state!;

  String get country => _country!;

  bool get verificationStatus => _isVerified!;

  // String get amountEarned => _amountEarned!;

  // String get amountWithdrawn => _amountWithdrawn!;

  double get availableBalance => _balance!;

  //String get id => _id!;

  DriverModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    _firstName = data?[FIRSTNAME] ?? "";
    _lastName = data?[LASTNAME] ?? "";
    _phoneNumber = data?[PHONENUMBER] ?? "";
    _state = data?[STATE] ?? "";
    _emailAddress = data?[EMAILADDRESS] ?? "";
    _country = data?[COUNTRY] ?? "";
    _isVerified = data?[VERIFIED] == false;
    //_amountWithdrawn = data?[AMOUNTWITHDRAWN] ?? "";
    //_amountEarned = data?[AMOUNTEARNED] ?? "";
    _balance = data?[BALANCE] ?? "";
    //_id = data?[ID] ?? "";
  }
}