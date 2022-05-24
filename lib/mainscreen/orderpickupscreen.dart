import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/collectingparcel.dart';
import 'package:returnpostuser/mainscreen/mainscreen.dart';

class OrderPickUpScreen extends StatefulWidget {
  const OrderPickUpScreen({Key? key}) : super(key: key);

  @override
  _OrderPickUpScreenState createState() => _OrderPickUpScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _OrderPickUpScreenState extends State<OrderPickUpScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;
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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'How was your pickup?',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8D8989),
                  fontSize: 12,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: RadioListTile<SingingCharacter>(
              // tileColor:  Color(0xffEB5757),
              //      controlAffinity: ListTileControlAffinity.leading,
              selectedTileColor: Color(0xffEB5757),
              title: const Text('Order Ready',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: RadioListTile<SingingCharacter>(
              controlAffinity: ListTileControlAffinity.leading,
              // selectedTileColor:    Color(0xffEB5757),
              //      tileColor:  Color(0xffEB5757),

              title: const Text('Order not Ready',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
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
            child: Text(
              'How was your pickup?',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8D8989),
                  fontSize: 12,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: RadioListTile<SingingCharacter>(
              // tileColor:  Color(0xffEB5757),
              //      controlAffinity: ListTileControlAffinity.leading,
              selectedTileColor: Color(0xffEB5757),
              title: const Text('Customer not home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: RadioListTile<SingingCharacter>(
              controlAffinity: ListTileControlAffinity.leading,
              // selectedTileColor:    Color(0xffEB5757),
              //      tileColor:  Color(0xffEB5757),

              title: const Text('Parcel damage',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: RadioListTile<SingingCharacter>(
              controlAffinity: ListTileControlAffinity.leading,
              // selectedTileColor:    Color(0xffEB5757),
              //      tileColor:  Color(0xffEB5757),

              title: const Text('Customer change mind',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
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
            child: Text(
              'Describe the problem',
              style: GoogleFonts.getFont('Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8D8989),
                  fontSize: 12,
                  fontStyle: FontStyle.normal),
            ),
          ),
             Container(
               decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: BorderRadius.circular(17)
               ),
         
               width: 310,
               height: 110,
               margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
               child: TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a description of your situation...',
                      contentPadding: EdgeInsets.only(left: 20,top: 20),
                      hintStyle: TextStyle(
                        color: Color(0xff8D8989)
                      ),
                    
                    ),
                  ),
             ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffEB5757),
                minimumSize: Size(310, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              child: Text(
                'No Pickup',
                style: GoogleFonts.getFont('Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          SizedBox(height: 20,),
                     Center(
            child:OutlinedButton(onPressed: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (builder) => CollectingParcel()));
            },
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
     minimumSize: Size(310, 60),
    side: BorderSide(width: 1.0, color: Colors.red,)),
  child: Text('Operator Call',style: TextStyle(color: Color(0xffEB5757),),))
          ),
            SizedBox(height: 10,),
        ],
      ),
    );
  }
}
