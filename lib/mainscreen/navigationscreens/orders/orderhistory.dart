import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/orders/orderstatus.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/orders/uploadrecipt.dart';

class OrdersHistory extends StatefulWidget {
  const OrdersHistory({Key? key}) : super(key: key);

  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff404040),
        body: 
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('assets/back.png',
                                    height: 50, fit: BoxFit.cover)),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/search.png',
                              height: 100,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 30),
                        child: Text(
                          'Orders History',
                          style: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 30),
                        child: Text(
                          'Uploading of receipts',
                          style: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8D8989),
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
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
                                      builder: (context) => UploadRecipt()));
                            },
                            child: Text(
                              'Upload',
                              style: GoogleFonts.getFont('Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 30),
                        child: Text('Today',
                            style: TextStyle(
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) => OrderStatus()));
                            },
                            child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (index, context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                                  margin:
                                                      EdgeInsets.only(top: 20, left: 20),
                                                  child: Text(
                                                    'from BooHoo',
                                                    style: GoogleFonts.getFont(
                                                        'Montserrat',
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontStyle: FontStyle.normal),
                                                  )),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.only(right: 20,top: 20),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                          text: '£',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color: Color(0xffEB5757),
                                                              fontSize: 14)),
                                                      TextSpan(
                                                          text: ' 2.99',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              color: Colors.white,
                                                              fontSize: 14)),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20, top: 10),
                                            child: Text(
                                              'Clothes',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20, top: 4),
                                            child: Text(
                                              '12 Blueberry Ln, London, EC5M 6JN',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10, bottom: 10),
                                            child: Text(
                                              'Post Office',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.only(top: 10, left: 30),
                        child: Text('18 December',
                            style: TextStyle(
                                color: Color(0xff8D8989),
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height:   300,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) => OrderStatus()));
                            },
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (index, context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                                  margin:
                                                      EdgeInsets.only(top: 20, left: 20),
                                                  child: Text(
                                                    'from BooHoo',
                                                    style: GoogleFonts.getFont(
                                                        'Montserrat',
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontStyle: FontStyle.normal),
                                                  )),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.only(right: 20,top: 20),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                          text: '£',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color: Color(0xffEB5757),
                                                              fontSize: 14)),
                                                      TextSpan(
                                                          text: ' 2.99',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              color: Colors.white,
                                                              fontSize: 14)),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20, top: 10),
                                            child: Text(
                                              'Clothes',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20, top: 4),
                                            child: Text(
                                              '12 Blueberry Ln, London, EC5M 6JN',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10, bottom: 10),
                                            child: Text(
                                              'Post Office',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
          
        ),
            ),
          ),
      
    );
  }
}
