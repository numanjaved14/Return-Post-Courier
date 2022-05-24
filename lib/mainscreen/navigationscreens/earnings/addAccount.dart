import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/confrimaccountdetails.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({ Key? key }) : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
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
       
      ),
      extendBody: true,
      backgroundColor: Color(0xff404040),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
            width: 237,
           
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Account Details',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.normal),
            ),
          ),
           Center(
             child: Container(
                            margin: EdgeInsets.only(left: 20, top: 10,right: 20),
                            width: 330,
                            height: 55,
                            //  padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Color(0xff535353),
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            // border: Border.all(color: Colors.grey,width: 0.5)

                            child: TextFormField(
                              //  textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                contentPadding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Color(0xff8D8989), // <-- Change this
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
           ),

                          Center(
                            child: Container(
                            margin: EdgeInsets.only(left: 20, top: 20,right: 20),
                             width: 330,
                            height: 55,
                            //  padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Color(0xff535353),
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            // border: Border.all(color: Colors.grey,width: 0.5)

                            child: TextFormField(
                              //  textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: 'Bank Name',
                                contentPadding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Color(0xff8D8989), // <-- Change this
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
                          ),
                          Center(
                            child: Container(
                            margin: EdgeInsets.only(left: 20, top: 20,right: 20),
                             width: 330,
                            height: 55,
                            //  padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Color(0xff535353),
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            // border: Border.all(color: Colors.grey,width: 0.5)

                            child: TextFormField(
                              //  textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: 'Sort Code',
                                contentPadding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Color(0xff8D8989), // <-- Change this
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
                          ),
                          Center(
                            child: Container(
                            margin: EdgeInsets.only(left: 20, top: 20,right: 20),
                            width: 330,
                            height: 55,
                            //  padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Color(0xff535353),
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            // border: Border.all(color: Colors.grey,width: 0.5)

                            child: TextFormField(
                              //  textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: 'Account Number',
                                contentPadding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Color(0xff8D8989), // <-- Change this
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
                          ),
                           Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEB5757),
                    fixedSize: Size(310, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  onPressed: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => ConfrimAccountDetails()));
                  },
                  child: Text(
                    'Add account details',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}