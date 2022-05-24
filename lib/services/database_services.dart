import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:returnpostuser/models/usermodel.dart';
import 'package:returnpostuser/models/vehicle_model.dart';
import 'package:returnpostuser/services/storage_methods.dart';

class DataBaseMethods {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap = await _firestore
        .collection('user')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return UserModel.fromSnapshot(snap);
  }

  Future<String> registerUser(
      {
      required String email,
      required String password,
      required String username,
      String? referalCode,
      Uint8List? file,
      String? address,
      String res = "Some Error Occured"}) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty || file != null) {
        UserCredential cred =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // saving profile image

        String photoUrl =
            await StorageMethods().uploadImageToStorage('ProfilePics', file!);

        UserModel user = UserModel(
          email: email,
          uid: cred.user!.uid,
          username: username,
          photoUrl: photoUrl,
          referal: referalCode,
          address: address,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJSon(),
            );
        return res = 'added successfully';
      }
    } catch (e) {
      return res = e.toString();
    }
    return res;

    // _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
  }

  Future<String> UpdateUser({
    required String email,
    required String password,
    required String username,
    required String? id,
    String? referalCode,
    String? photoUrl,
    required String? address,
    String res = "Some Error Occured",
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserModel user = UserModel(
          email: email,
          uid: id,
          photoUrl: photoUrl,
          username: username,
          referal: referalCode,
          address: address,
        );

        await _firestore.collection('users').doc(id).update(
              user.toJSon(),
            );
        return res = 'updated successfully';
      }
    } catch (e) {
      return res = e.toString();
    }
    return res;

    // _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
  }

  Future loginUser(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String> resetPawwordUser({String? email}) async {
    String res = "email sent";

    try {
      _firebaseAuth.sendPasswordResetEmail(email: email!);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  singnOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> addVecihleInfo({
   required String? vechileName,
   required String? vechileType,
   required String? vechilRegistration,
    Uint8List? file,
    String res = "Some Error Occured",
  }) async {
    

    if(vechileName!.isNotEmpty || vechilRegistration!.isNotEmpty )
   { 
     try {
      // if(){}
      // saving document
      String documentUrl = await StorageMethods()
          .uploadImageToStorage('vecihleDocuments', file!);

          VehicleModel vehicleModel = VehicleModel(
           vehicleName : vechileName,
           vehiclRegistration: vechilRegistration,
           vehicleType : vechileType,
            file: documentUrl,
          );
           await _firestore.collection('VehicleInfo').doc(_firebaseAuth.currentUser!.uid).set(
              vehicleModel.toJSon(),
            );
        return res = 'added successfully';
    } catch (e) {
      print(e.toString());
    }}
    return res;
  }
}
