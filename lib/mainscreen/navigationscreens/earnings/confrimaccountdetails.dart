import 'package:flutter/material.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/payment.dart';

class ConfrimAccountDetails extends StatefulWidget {
  const ConfrimAccountDetails({ Key? key }) : super(key: key);

  @override
  _ConfrimAccountDetailsState createState() => _ConfrimAccountDetailsState();
}

class _ConfrimAccountDetailsState extends State<ConfrimAccountDetails> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          Container(
              width: 237,
             
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
              child: Text('Fawad Kaleem',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Edit',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
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
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Edit',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
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
              child: Text('1234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Edit',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
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
              child: Text('1233-1221-121212',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Text('Edit',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
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
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffEB5757),
                      fixedSize: Size(300, 56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: () {
                       Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Payment()));
                    },
                    child: Text(
                      'Confrim',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
            ),
        ],),
      ),
    );
  }
}