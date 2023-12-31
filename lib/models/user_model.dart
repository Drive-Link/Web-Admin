import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const FIRSTNAME = "first_name";
  static const LASTNAME = "last_name";
  static const EMAILADDRESS = "email_address";
  static const PHONENUMBER = "phone_number";
  static const LOCATION = "state";

  String? _id;
  String? _firstName;
  String? _emailAddress;
  String? _phoneNumber;
  String? _lastName;
  String? _location;

//  getters
  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get emailAddress => _emailAddress!;

  String get phoneNumber => _phoneNumber!;

  String get location => _location!;

  String get id => _id!;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    _firstName = data?[FIRSTNAME] ?? "";
    _lastName = data?[LASTNAME] ?? "";
    _phoneNumber = data?[PHONENUMBER] ?? "";
    _location = data?[LOCATION] ?? "";
    _emailAddress = data?[EMAILADDRESS] ?? "";
    _id = data?[ID] ?? "";
  }
}
