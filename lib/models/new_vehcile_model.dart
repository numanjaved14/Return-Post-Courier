import 'package:cloud_firestore/cloud_firestore.dart';


  class VehicleModel {
  final String? vehicleName;
  final String? vehicleType;
  final String? vehiclRegistration;
 final String? file;
 final String? postId;

 VehicleModel({
    this.file,
   required this.vehiclRegistration,
   required this.vehicleName,
   required this.vehicleType,
   required this.postId,
    // this.vehiclename,
  });

  Map<String,dynamic> toJSon() => {
    "vehicleName" : vehicleName,
    "vehiclRegistration" : vehiclRegistration,
    "vehicleType" : vehicleType,
    "file" : file,
    "postId" : postId
  };

 static VehicleModel fromSnapshot(DocumentSnapshot vechileSnapshot){
    var snapshot = vechileSnapshot.data() as Map<String, dynamic>;
    return VehicleModel(
      vehicleName: "vehicleName",
      vehiclRegistration : "vehiclRegistration",
      vehicleType : "vehicleType",
      file: "file",
      postId: "postId"
    );
  }
}


  

  

