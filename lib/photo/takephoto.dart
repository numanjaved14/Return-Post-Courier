import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/authentication/signinpage.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
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
              child: Image.asset('assets/back.png',height: 46,width: 46,)),
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
              style:GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 36,fontStyle: FontStyle.normal),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/big.png',
                  width: 310,
                  height: 310,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Text(
              'To Verify youre wearing a face cover or\nmask before you go online.',
              style:GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w400, color: Colors.white,fontSize: 14,fontStyle: FontStyle.normal),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Signinpage()));
                  },
                  child: Image.asset(
                    'assets/camera.png',
                    width: 100,
                    height: 100,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
