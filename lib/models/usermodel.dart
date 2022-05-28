import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? uid;
  final String? referal;
  final String? photoUrl;
  final String? address;
  final String? vehicleName;
  final String? vehicleType;
  final String? vehicleRegNo;
  final bool? isApproved;
  final bool? isDeclined;

  UserModel(
      {required this.email,
      required this.uid,
      required this.username,
      this.referal,
      this.photoUrl,
      required this.address,
      required this.isApproved,
      this.vehicleName,
      this.vehicleType,
      this.vehicleRegNo,
      this.isDeclined});

  Map<String, dynamic> toJSon() => {
        "username": username,
        "email": email,
        'id': uid,
        'referal': referal,
        'photoUrl': photoUrl,
        'address': address,
        'isApproved': isApproved,
        'isDeclined': isDeclined,
        'vehicleName': vehicleName,
        'vehicleType': vehicleType,
        'vehicleRegNo': vehicleRegNo,
      };

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: 'email',
      uid: 'id',
      username: 'username',
      referal: 'referal',
      photoUrl: 'photoUrl',
      address: 'address',
      vehicleName: 'vehicleName',
      vehicleType: 'vehicleType',
      vehicleRegNo: 'vehicleRegNo',
      isApproved: 'isApproved' as bool,
      isDeclined: 'isDeclined' as bool,
    );
  }
}
