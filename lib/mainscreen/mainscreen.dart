import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/maptracking.dart';
import 'package:returnpostuser/widgets/mydrawer.dart';

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

  @override
  void initState() {
    super.initState();
    getData();
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
                      Image.asset(
                        'assets/map.png',
                        height: 440,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
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
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You are not approved by the admin yet',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'You will soon contacted by our team',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              );
  }

  showFirsttModal(BuildContext context) {
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
                height: 410,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Image.asset('assets/cap.png'),
                        title: Text(
                          'Clothing',
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
                              'from BooHoo',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffEB5757),
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Stewart Menzies',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Color(0xff8D8989),
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
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
                          'Post Office',
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
                              'Collection',
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
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '£',
                                      style: TextStyle(
                                          color: Color(0xffEB5757),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: ' 1.50',
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
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffEB5757),
                              minimumSize: Size(310, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23)),
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
                        leading: Image.asset('assets/cap.png'),
                        title: Text(
                          'Clothing',
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
                              'from BooHoo',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffEB5757),
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Stewart Menzies',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Color(0xff8D8989),
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
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
                          '12 Blueberry Ln, London, EC5M 6JN',
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
                          'Post Office',
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
                              'Collection',
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
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '£',
                                      style: TextStyle(
                                          color: Color(0xffEB5757),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: ' 1.50',
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => MapTracking()));
                            },
                            child: Text(
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
