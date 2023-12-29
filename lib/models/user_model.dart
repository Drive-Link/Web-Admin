
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";

  String? _id;
  String? _name;
  String? _email;

//  getters
  String get name => _name!;
  String get email => _email!;
  String get id => _id!;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    _name = data?[NAME] ?? "";
    _email = data?[EMAIL] ?? "";
    _id = data?[ID] ?? "";
  }
}

