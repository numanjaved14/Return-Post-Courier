import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/addAccount.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/editaccounct.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/withdrawalaccount.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/withdrawalaccountdetail.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (x) => WithdrawalAccountDetail()));
                },
                child: Image.asset('assets/edit.png')),
          ),
        ],
      ),
      extendBody: true,
      backgroundColor: Color(0xff404040),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 237,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              'Payments',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: 165,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 5,
              color: Color(0xff535353),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Balance',
                            style: GoogleFonts.getFont('Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.normal),
                          )),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10,top: 24),
                        child: RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '£',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffEB5757))),
                              TextSpan(text: ' 151.14',style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Fawad Kaleem',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff8D8989),
                          fontSize: 10),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffEB5757),
                          fixedSize: Size(300, 56),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAccount()));
                        },
                        child: Text(
                          'Withdrawal',
                          style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 237,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Text(
              'Account Details',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.normal),
            ),
          ),
     Container(
       margin: EdgeInsets.only(top: 5),
       child: Center(
         child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffEB5757),
                        fixedSize: Size(MediaQuery.of(context).size.width/1.15, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddAccount()));
                      },
                      child: Text(
                        'Add To Accounts',
                        style: GoogleFonts.getFont('Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                      ),
                    
                  ),
       ),
     ),
       
          
        ],
      ),
    );
  }
}
