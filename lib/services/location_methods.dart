import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as loc;

class LocationMethods {
  static StreamSubscription<loc.LocationData>? locationSubscription;
  static final loc.Location location = loc.Location();

  getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<List<double>> listenLocation() async {
    List<double> latlong = [];
    locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      locationSubscription?.cancel();
      // setState(() {
      //   locationSubscription = null;
      // });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
      latlong.addAll({currentlocation.latitude!, currentlocation.longitude!});
    });
    debugPrint(latlong.toString());
    return latlong;
  }

  Future<List<double>> listenOrderLocation({required String orderId}) async {
    List<double> latlong = [];
    locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      locationSubscription?.cancel();
      // setState(() {
      //   locationSubscription = null;
      // });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection('locations')
          .doc(orderId)
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
      latlong.addAll({currentlocation.latitude!, currentlocation.longitude!});
    });
    debugPrint(latlong.toString());
    return latlong;
  }

  stopListening() {
    locationSubscription?.cancel();
    // setState(() {
    //   locationSubscription = null;
    // });
  }

  requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
