import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/authentication/signinpage.dart';
import 'package:returnpostuser/photo/snapaphoto.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool _selectedvalue1 = false;
  bool _selectedvalue2 = false;
  bool _selectedvalue3 = false;
  bool _selectedvalue4 = false;

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
              child: Image.asset('assets/back.png')),
        ),
      ),
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, top: 20),
            child: Text(
              'Policy requires',
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 36,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, top: 20, right: 25),
            child: Text(
              'Return Post’s policy requires our couriers to wear a face cover or mask unless they are exempt. Please confirm the following actions based on CDC guidelines.',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30),

            //  padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Color(0xff535353),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
            ),
            child: CheckboxListTile(
              shape: const CircleBorder(),

              activeColor: const Color(0xff535353),

              checkColor: Colors.red,
              tileColor: const Color(0xff535353),

              title: const Text(
                'I am wearing a face mask or covering',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: _selectedvalue1,
              onChanged: (value) {
                setState(() {
                  _selectedvalue1 = value!;
                });
              },
              // secondary: const Icon(Icons.hourglass_empty),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

            //  padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Color(0xff535353),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
            ),
            child: CheckboxListTile(
              shape: CircleBorder(),

              activeColor: Color(0xff535353),
              checkColor: Colors.red,
              tileColor: Color(0xff535353),

              title: const Text(
                'i wont drive  if i have COVID-19 or\nrelated symptoms',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              value: _selectedvalue2,
              onChanged: (bool? value) {
                setState(() {
                  _selectedvalue2 = value!;
                });
              },
              // secondary: const Icon(Icons.hourglass_empty),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 1),

            //  padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Color(0xff535353),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
            ),
            child: CheckboxListTile(
              shape: CircleBorder(),

              activeColor: Color(0xff535353),
              checkColor: Colors.red,
              tileColor: Color(0xff535353),

              title: const Text(
                'I sanitize my vehicle at the start & end\nof the day',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              value: _selectedvalue3,
              onChanged: (bool? value) {
                setState(() {
                  _selectedvalue3 = value!;
                });
              },
              // secondary: const Icon(Icons.hourglass_empty),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

            //  padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Color(0xff535353),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
            ),
            child: CheckboxListTile(
              shape: CircleBorder(),
              activeColor: Color(0xff535353),
              checkColor: Colors.red,
              tileColor: Color(0xff535353),

              title: const Text(
                'I wash or sanitize my hands regularly',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              value: _selectedvalue4,
              // timeDilation != 1.0,
              onChanged: (bool? value) {
                setState(() {
                  _selectedvalue2 = value!;

                  // timeDilation = value! ? 3.0 : 1.0;
                });
              },
              // secondary: const Icon(Icons.hourglass_empty),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffEB5757),
                fixedSize: Size(310, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signinpage()));
              },
              child: Text(
                'Ready',
                style: GoogleFonts.getFont('Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
