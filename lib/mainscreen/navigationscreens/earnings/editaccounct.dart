import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/withdrawalaccount.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
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
                  Navigator.pop(context);
                },
                child: Image.asset('assets/edit.png')),
          ),
        ],
      ),
      extendBody: true,
      backgroundColor: Color(0xff404040),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 237,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                'Payments',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
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
                        margin: EdgeInsets.only(right: 10),
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
                             Navigator.push(context,
                               MaterialPageRoute(builder: (context) => WithdrawalAccount()));
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
             Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Text('Name',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Oliver Dewize',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
           
            Divider(
              height: 30,
              thickness: 0.5,
              indent: 27,
              endIndent: 27,
              color: Colors.grey,
            ),
              Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Text('Bank Name',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Private Bank',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
           
            Divider(
              height: 30,
              thickness: 0.5,
              indent: 27,
              endIndent: 27,
              color: Colors.grey,
            ),
             Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Text('Sort Code',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('12345',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
           
            Divider(
              height: 30,
              thickness: 0.5,
              indent: 27,
              endIndent: 27,
              color: Colors.grey,
            ),
             Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Text('Account Number',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('12345',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
           
            Divider(
              height: 30,
              thickness: 0.5,
              indent: 27,
              endIndent: 27,
              color: Colors.grey,
            ),

             Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEB5757),
                    fixedSize: Size(300, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  onPressed: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => EditAccount()));
                  },
                  child: Text(
                    'Edit',
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
    );
  }
}
