import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivelink_admin/constants/constants.dart';

import '../models/user_model.dart';

class UserServices {
  String adminsCollection = "admin";
  String usersCollection = "users";

  void createAdmin({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    firebaseFirestore.collection(adminsCollection).doc(id).set({
      "first_name": firstName,
      "last_name": lastName,
      "id": id,
      "email": email,
    });
  }

  void updateUserData(Map<String, dynamic> values) {
    firebaseFirestore
        .collection(adminsCollection)
        .doc(values['id'])
        .update(values);
  }

  Future<UserModel> getAdminById(String id) =>
      firebaseFirestore.collection(adminsCollection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<List<UserModel>> getAllPassengers() async =>
      firebaseFirestore.collection(usersCollection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot user in result.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
}
