import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:returnpostuser/mainscreen/maptracking.dart';
import 'package:returnpostuser/services/database_services.dart';
import 'package:returnpostuser/services/location_methods.dart';
import 'package:returnpostuser/widgets/mydrawer.dart';
import 'package:location/location.dart' as loc;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var userData = {};
  // bool isApproved = false;
  bool isLoading = false;

  var scalfoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  List<double>? latlong;
  bool _gotLatLong = false;
  Map<String, dynamic>? customerSnap;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getData();
    getLocMethods();
    // LocationMethods().requestPermission();
    // LocationMethods.location
    //     .changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    // LocationMethods.location.enableBackgroundMode(enable: true);
    // LocationMethods().getLocation();
    getLatLong();
  }

  void getLocMethods() async {
    try {
      await LocationMethods().requestPermission();
      await LocationMethods.location
          .changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
      await LocationMethods.location.enableBackgroundMode(enable: true);
      await LocationMethods().getLocation();
    } catch (e) {}
  }

  void getLatLong() async {
    await LocationMethods().listenLocation().then((value) {
      latlong = value;
      setState(() {
        _gotLatLong = true;
      });
    });
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userSnap.data()!;
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : userData['isApproved'] == true
            ? Scaffold(
                key: scalfoldKey,
                drawer: MyDrawer(),
                backgroundColor: Color(0xff404040),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                scalfoldKey.currentState!.openDrawer();
                              },
                              child: Image.asset(
                                'assets/menu.png',
                                fit: BoxFit.cover,
                                width: 90,
                                height: 70,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/search.png',
                                width: 90,
                              ),
                            )
                          ],
                        ),
                      ),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('locations')
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasData) {
                              for (int i = 0;
                                  i <= snapshot.data!.docs.length - 1;
                                  i++) {
                                if (snapshot.data!.docs[i]
                                            .data()['courierId'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid &&
                                    snapshot.data!.docs[i]
                                            .data()['orderStatus'] ==
                                        "Acceptance Pending") {
                                  debugPrint(
                                      'Courier on the way: false..............');
                                  customerSnap = snapshot.data!.docs[i].data();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showFirsttModal(context);
                                    customerSnap =
                                        snapshot.data!.docs[i].data();
                                  });
                                }
                                if (snapshot.data!.docs[i]
                                            .data()['courierId'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid &&
                                    snapshot.data!.docs[i]
                                            .data()['orderStatus']
                                            .toString() ==
                                        "Courier on the way") {
                                  debugPrint(
                                      'Courier on the way: true..............');
                                  customerSnap = snapshot.data!.docs[i].data();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => MapTracking(
                                            orderId: customerSnap!['orderId']),
                                      ),
                                    );
                                  });
                                }
                              }
                            }

                            return Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: double.infinity,
                              child: _gotLatLong
                                  ? GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(userData['latitude'],
                                            userData['longitude']),
                                        zoom: 15,
                                      ),
                                      mapType: MapType.normal,
                                      compassEnabled: true,
                                      zoomControlsEnabled: false,
                                      myLocationEnabled: true,
                                      myLocationButtonEnabled: true,
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        _controller.complete(controller);
                                      },
                                      circles: Set.from(
                                        [
                                          Circle(
                                            circleId: CircleId('1'),
                                            center: LatLng(userData['latitude'],
                                                userData['longitude']),
                                            radius: 400,
                                            fillColor:
                                                Colors.blue.withOpacity(0.3),
                                            strokeColor: Colors.blue,
                                            strokeWidth: 1,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            );
                          }),
                      // Image.asset(
                      //   'assets/map.png',
                      //   height: 440,
                      //   width: MediaQuery.of(context).size.width,
                      //   fit: BoxFit.cover,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                child: Image.asset(
                              'assets/mapone.png',
                              fit: BoxFit.fitWidth,
                              width: 50,
                              height: 50,
                            )),
                            InkWell(
                                child: Image.asset(
                              'assets/maptwo.png',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            )),
                            InkWell(
                              onTap: () => showFirsttModal(context),
                              child: Image.asset('assets/mapthree.png',
                                  fit: BoxFit.cover, width: 80, height: 80),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.grey.shade800,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'You are not approved by the admin yet',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You will soon contacted by our team',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
  }

  showFirsttModal(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('orders')
                .doc('ordersList')
                .collection(customerSnap!['clientId'])
                .doc(customerSnap!['orderId'])
                .get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Center(child: Text("Document does not exist"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                data = snapshot.data!.data() as Map<String, dynamic>;
                return ListView(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      child: Container(
                        color: Color(0xff404040),
                        height: 410,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(
                                  data!['imageUrl'],
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  data!['category'],
                                  style: GoogleFonts.getFont('Montserrat',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'from ${data!['brandName']}',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffEB5757),
                                        fontSize: 10,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    // Text(
                                    //   'Stewart Menzies',
                                    //   style: GoogleFonts.getFont(
                                    //     'Montserrat',
                                    //     fontWeight: FontWeight.w700,
                                    //     color: Color(0xff8D8989),
                                    //     fontSize: 10,
                                    //     fontStyle: FontStyle.normal,
                                    //   ),
                                    //   textAlign: TextAlign.start,
                                    // ),
                                  ],
                                ),
                              ),
                              ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Image.asset(
                                    'assets/pin.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                title: Text(
                                  'Carrier',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8D8989),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: Text(
                                  data!['carrier'],
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Image.asset(
                                    'assets/divider.png',
                                    width: 310,
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Type of Job',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8D8989),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      data!['categoryName'],
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Distance',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8D8989),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      '0.5mi',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tracking Number',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8D8989),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      'PIA12124556',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Earning',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8D8989),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: '£',
                                              style: TextStyle(
                                                  color: Color(0xffEB5757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: data!['price'],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    )
                                    // Text(
                                    //   '5E',
                                    //   style: TextStyle(
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.white),
                                    // )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffEB5757),
                                      minimumSize: Size(310, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(23)),
                                    ),
                                    onPressed: () {
                                      newNavigatorbar(context);
                                    },
                                    child: Text(
                                      'Accept Job',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
      },
    );
  }

  void newNavigatorbar(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                color: Color(0xff404040),
                height: 490,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(
                          data!['imageUrl'],
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          data!['category'],
                          style: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.normal),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'from ${data!['brandName']}',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffEB5757),
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            // Text(
                            //   'Stewart Menzies',
                            //   style: GoogleFonts.getFont(
                            //     'Montserrat',
                            //     fontWeight: FontWeight.w700,
                            //     color: Color(0xff8D8989),
                            //     fontSize: 10,
                            //     fontStyle: FontStyle.normal,
                            //   ),
                            //   textAlign: TextAlign.start,
                            // ),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   leading: Image.asset('assets/cap.png'),
                      //   title: Text(
                      //     'Clothing',
                      //     style: GoogleFonts.getFont('Montserrat',
                      //         fontWeight: FontWeight.w700,
                      //         color: Colors.white,
                      //         fontSize: 18,
                      //         fontStyle: FontStyle.normal),
                      //   ),
                      //   subtitle: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'from BooHoo',
                      //         style: GoogleFonts.getFont(
                      //           'Montserrat',
                      //           fontWeight: FontWeight.w700,
                      //           color: Color(0xffEB5757),
                      //           fontSize: 10,
                      //           fontStyle: FontStyle.normal,
                      //         ),
                      //         textAlign: TextAlign.start,
                      //       ),
                      //       Text(
                      //         'Stewart Menzies',
                      //         style: GoogleFonts.getFont(
                      //           'Montserrat',
                      //           fontWeight: FontWeight.w700,
                      //           color: Color(0xff8D8989),
                      //           fontSize: 10,
                      //           fontStyle: FontStyle.normal,
                      //         ),
                      //         textAlign: TextAlign.start,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            'assets/circle.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        title: Text(
                          'Pick up',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(
                          data!['address'],
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            'assets/pin.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        title: Text(
                          'Carrier',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(
                          data!['carrier'],
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                            'assets/divider.png',
                            width: 310,
                          )),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Type of Job',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              data!['categoryName'],
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Distance',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              '0.5mi',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tracking Number',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'PIA12124556',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Earning',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '£',
                                      style: TextStyle(
                                          color: Color(0xffEB5757),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: data!['price'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            )
                            // Text(
                            //   '5E',
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w600,
                            //       color: Colors.white),
                            // )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffEB5757),
                              minimumSize: Size(310, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23)),
                            ),
                            onPressed: () async {
                              String res = await DataBaseMethods()
                                  .AcceptOrder(orderId: data!['orderId']);
                              if (res == 'success') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => MapTracking(
                                        orderId: customerSnap!['orderId']),
                                  ),
                                );
                              } else {
                                debugPrint('Some error occured. $res');
                              }
                            },
                            child: const Text(
                              'Start navigation',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
