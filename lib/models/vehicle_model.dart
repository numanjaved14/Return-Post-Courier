import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
   String? vehicleName;
   String? vehicleType;
   String? vehiclRegistration;
  String? file;

  VehicleModel({
    this.file,
   required this.vehiclRegistration,
   required this.vehicleName,
   required this.vehicleType,
    // this.vehiclename,
  });

  Map<String,dynamic> toJSon() => {
    "vehicleName" : vehicleName,
    "vehiclRegistration" : vehiclRegistration,
    "vehicleType" : vehicleType,
    "file" : file,
  };

  static VehicleModel fromSnapshot(DocumentSnapshot vechileSnapshot){
    var snapshot = vechileSnapshot.data() as Map<String, dynamic>;
    return VehicleModel(
      vehicleName: "vehicleName",
      vehiclRegistration : "vehiclRegistration",
      vehicleType : "vehicleType",
      file: "file",
    );
  }
}
