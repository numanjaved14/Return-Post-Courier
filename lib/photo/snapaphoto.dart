import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/photo/takephoto.dart';

class SnapPhoto extends StatefulWidget {
  const SnapPhoto({Key? key}) : super(key: key);

  @override
  _SnapPhotoState createState() => _SnapPhotoState();
}

class _SnapPhotoState extends State<SnapPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff404040),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/back.png',height: 46, width: 46,)),
        ),
      ),
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Snap a photo\nof yourself',
              style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 36,fontStyle: FontStyle.normal),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 20),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/photo.png',
                  width: 190,
                  height: 190,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Text(
              'To Verify youre wearing a face cover or\nmask before you go online.',
              style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w400, color: Colors.white,fontSize: 14,fontStyle: FontStyle.normal),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffEB5757),
                  fixedSize: Size(310, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TakePhoto()));
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 14,fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
