import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:returnpostuser/chatmodels/chatpage.dart';
import 'package:returnpostuser/mainscreen/fullorderdetail.dart';
import 'package:returnpostuser/widgets/mydrawer.dart';
import 'package:location/location.dart' as loc;

import '../services/location_methods.dart';

class MapTracking extends StatefulWidget {
  String? orderId;
  MapTracking({Key? key, this.orderId}) : super(key: key);

  @override
  _MapTrackingState createState() => _MapTrackingState();
}

class _MapTrackingState extends State<MapTracking> {
  var scalfoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic>? customerSnap;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;
  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor? customStartingMarker;
  BitmapDescriptor? customEndingMarker;
  double distance = 0.0;

  @override
  void initState() {
    getLocMethods();
    customMarker();
    customMarker1();
    super.initState();
  }

  void customMarker() async {
    customStartingMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/start.png');
  }

  void customMarker1() async {
    customEndingMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/end.png',
    );
  }

  void getLocMethods() async {
    try {
      await LocationMethods.location
          .changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
      await LocationMethods.location.enableBackgroundMode(enable: true);
      await LocationMethods().getLocation();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCustomerData(String customerId) async {
    var snap = await FirebaseFirestore.instance
        .collection('customers')
        .doc(customerId)
        .get();
    customerSnap = snap.data();
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  getDirections(
    double courierLati,
    double courierLongi,
    double clientLati,
    double clientLongi,
  ) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyA4XtJBCgqgSsnVL7n12lyHMMIwLG-fzzU',
      PointLatLng(courierLati, courierLongi),
      PointLatLng(clientLati, courierLongi),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scalfoldKey,
        backgroundColor: Color(0xff404040),
        drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      scalfoldKey.currentState!.openDrawer();
                    },
                    child: Image.asset(
                      'assets/menu.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/search.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              Expanded(
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('locations')
                      .doc(widget.orderId)
                      .snapshots(includeMetadataChanges: true),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;

                      LocationMethods()
                          .listenOrderLocation(orderId: data['orderId']);

                      getCustomerData(data['clientId']);

                      markers.add(
                        Marker(
                          //add start location marker
                          markerId: MarkerId(data['courierId'].toString()),
                          position: LatLng(data['courierLati'],
                              data['courierLongi']), //position of marker
                          infoWindow: InfoWindow(
                            //popup info
                            title: 'Starting Point ',
                            snippet: 'Start Marker',
                          ),
                          icon: customStartingMarker!, //Icon for Marker
                        ),
                      );

                      markers.add(Marker(
                        //add distination location marker
                        markerId: MarkerId(data['clientId'].toString()),
                        position: LatLng(data['clientLati'],
                            data['clientLongi']), //position of marker
                        infoWindow: InfoWindow(
                          //popup info
                          title: 'Destination Point ',
                          snippet: 'Destination Marker',
                        ),
                        icon: customEndingMarker!, //Icon for Marker
                      ));

                      // getDirections(
                      //   data['courierLati'],
                      //   data['courierLongi'],
                      //   data['clientLati'],
                      //   data['clientLongi'],
                      // );

                      // getDirections() async {
                      //   List<LatLng> polylineCoordinates = [];

                      //   PolylineResult result =
                      //       await polylinePoints.getRouteBetweenCoordinates(
                      //     'AIzaSyA4XtJBCgqgSsnVL7n12lyHMMIwLG-fzzU',
                      //     PointLatLng(
                      //         data['courierLati'], data['courierLongi']),
                      //     PointLatLng(data['clientLati'], data['clientLongi']),
                      //     travelMode: TravelMode.driving,
                      //   );

                      //   if (result.points.isNotEmpty) {
                      //     result.points.forEach((PointLatLng point) {
                      //       polylineCoordinates
                      //           .add(LatLng(point.latitude, point.longitude));
                      //     });
                      //   } else {
                      //     print(result.errorMessage);
                      //   }
                      //   addPolyLine(polylineCoordinates);
                      // }

                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                data['courierLati'], data['courierLongi']),
                            zoom: 15,
                          ),
                          mapType: MapType.normal,
                          compassEnabled: true,
                          zoomControlsEnabled: false,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          polylines: Set<Polyline>.of(polylines.values),
                          markers: markers,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                            newGoogleMapController = controller;
                            newGoogleMapController!.setMapStyle('''
                      [
                        {
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#242f3e"
                            }
                          ]
                        },
                        {
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#746855"
                            }
                          ]
                        },
                        {
                          "elementType": "labels.text.stroke",
                          "stylers": [
                            {
                              "color": "#242f3e"
                            }
                          ]
                        },
                        {
                          "featureType": "administrative.locality",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "poi",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "poi.park",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#263c3f"
                            }
                          ]
                        },
                        {
                          "featureType": "poi.park",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#6b9a76"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#38414e"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "geometry.stroke",
                          "stylers": [
                            {
                              "color": "#212a37"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#9ca5b3"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#746855"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "geometry.stroke",
                          "stylers": [
                            {
                              "color": "#1f2835"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#f3d19c"
                            }
                          ]
                        },
                        {
                          "featureType": "transit",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#2f3948"
                            }
                          ]
                        },
                        {
                          "featureType": "transit.station",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#17263c"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#515c6d"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "labels.text.stroke",
                          "stylers": [
                            {
                              "color": "#17263c"
                            }
                          ]
                        }
                      ]
                  ''');
                          },
                          // circles: Set.from(
                          //   [
                          //     Circle(
                          //       circleId: CircleId('1'),
                          //       center: LatLng(userData['latitude'],
                          //           userData['longitude']),
                          //       radius: 400,
                          //       fillColor:
                          //           Colors.blue.withOpacity(0.3),
                          //       strokeColor: Colors.blue,
                          //       strokeWidth: 1,
                          //     ),
                          //   ],
                          // ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint('Tapped.....Tapped.....Tapped.....');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'BEIM LADEN DER POST-DATEN IST EIN FEHLER AUFGETRETEN!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      showNextModal(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/mapthree.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          receiverName: customerSnap!['username'],
                          receiverId: customerSnap!['id'],
                        ),
                      ),
                    ),
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/maptwo.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showNextModal(BuildContext context) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff404040),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          '10 min',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 36,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          '0.1 mi · 12:12',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff8D8989),
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => FullOrderDetail())),
                        child: Image.asset('assets/info.png',
                            height: 100, width: 100, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/circle.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '12 Blueberry Ln, London, EC5M 6JN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
