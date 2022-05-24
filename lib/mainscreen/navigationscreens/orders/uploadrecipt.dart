import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipt extends StatefulWidget {
  const UploadRecipt({Key? key}) : super(key: key);

  @override
  _UploadReciptState createState() => _UploadReciptState();
}

class _UploadReciptState extends State<UploadRecipt> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Uploading of receipts',
                  style:GoogleFonts.getFont('Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 24,
                                fontStyle: FontStyle.normal),
                          ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Number of jobs you register',
                  style: GoogleFonts.getFont('Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontStyle: FontStyle.normal),
                          ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 25,bottom: 25),
                  width: 310,
                  //  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xff535353),
                    borderRadius: new BorderRadius.circular(15),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)

                  child: TextFormField(
                    //  textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/down.png',height: 7,width: 14,fit: BoxFit.fill,),
                      ),
                      hintText: '5',
                      contentPadding:
                          EdgeInsets.only(top: 12, left: 30),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                        color: Colors.white, // <-- Change this
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 181,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'PDFA2345235',
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Colors.white, // <-- Change this
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xffEB5757),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.upload,
                      color: Colors.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 181,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Tracking Code',
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Colors.white, // <-- Change this
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xffEB5757),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.upload,
                      color: Colors.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 181,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Tracking Code',
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Colors.white, // <-- Change this
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xffEB5757),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.upload,
                      color: Colors.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 181,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Tracking Code',
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Colors.white, // <-- Change this
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    height: 55,
                    width: 55,
                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xffEB5757),
                      borderRadius: new BorderRadius.circular(15),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: Icon(
                      Icons.upload,
                      color: Colors.white,
                    )),
              ],
            ),
             Container(
                       margin: EdgeInsets.only(top: 30,bottom: 30),
                       child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffEB5757),
                        minimumSize: Size(310, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: () {
                         Navigator.push(context,
                           MaterialPageRoute(builder: (context) => UploadRecipt()));
                    },
                    child: Text(
                        'Done',
                        style: TextStyle(fontSize: 20),
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
