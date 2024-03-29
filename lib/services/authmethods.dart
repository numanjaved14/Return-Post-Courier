import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:returnpostuser/models/usermodel.dart' as model;

import '../services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // StorageMethods _storageMethods = StorageMethods();
  // Future<model.User> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;

  //   DocumentSnapshot snap =
  //       await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

  //   return model.User.fromSnap(snap);
  // }

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String userName,
      required String address,
      required String referal,
      required Uint8List file}) async {
    String res = 'Some error occured.';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          address.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file);

        model.UserModel user = model.UserModel(
          email: email,
          username: userName,
          uid: _auth.currentUser!.uid,
          // password: password,
          address: address,
          referal: referal,
          photoUrl: photoUrl,
          isApproved: false,
          isDeclined: false,
        );

        _firebaseFirestore.collection('users').doc(_auth.currentUser!.uid).set(
              user.toJSon(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = 'Please enter all the Fields';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
