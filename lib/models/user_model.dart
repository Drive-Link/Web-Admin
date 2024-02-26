import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //static const ID = "id";
  static const FIRSTNAME = "first_name";
  static const LASTNAME = "last_name";
  static const EMAILADDRESS = "email_address";
  static const PHONENUMBER = "phone_number";
  static const STATE = "state";
  static const COUNTRY = "country";
  String? _id;
  String? _firstName;
  String? _emailAddress;
  String? _phoneNumber;
  String? _lastName;
  String? _state;
  String? _country;

//  getters
  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get emailAddress => _emailAddress!;

  String get phoneNumber => _phoneNumber!;

  String get state => _state!;

  String get country => _country!;

  //String get id => _id!;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    _firstName = data?[FIRSTNAME] ?? "";
    _lastName = data?[LASTNAME] ?? "";
    _phoneNumber = data?[PHONENUMBER] ?? "";
    _state = data?[STATE] ?? "";
    _emailAddress = data?[EMAILADDRESS] ?? "";
    _country = data?[COUNTRY] ?? "";
    //_id = data?[ID] ?? "";
  }
}