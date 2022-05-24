import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/maptracking.dart';

class CollectingParcel extends StatefulWidget {
  const CollectingParcel({ Key? key }) : super(key: key);

  @override
  _CollectingParcelState createState() => _CollectingParcelState();
}

class _CollectingParcelState extends State<CollectingParcel> {
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
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Order #01265',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 36,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Collecting',
                style: TextStyle(
                  color: Color(0xffEB5757),
                  fontSize: 13,
                )),
          ),
            Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text('Pick-up address',
                style:  GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('8 St. Martin’s Pl',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
             Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('London, WC2n 4JH, United Kingdom',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
           Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text('Carrier address',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
           Container(
            margin: EdgeInsets.only(left: 30,top: 5),
            child: Text('83 Endell St',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),),
                            Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('London, WC2n 4JH, United Kingdom',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
         Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text('Store you’re returning to',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('BooHoo',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),),
         
          Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
           Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text('Categories',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Clothes',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),),
         
          Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text('Carrier',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Post Office',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),),
          
          Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
             Column(
              children: [
   Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payments',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Card',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Distance',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '15.1 km',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earning',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '£',
                                  style: TextStyle(
                                      color: Color(0xffEB5757),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: ' 1.50',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        )
                        // Text(
                        //   '5E',
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w600,
                        //       color: Colors.white),
                        // )
                      ],
                    ),
                  ),
              ],
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
            child: Text('Conditions and comments',
                style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text("All the things are already packed, as you \n drive up, I'll come out to meet you.",
                style:  GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
          ),
            Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),

          ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/shape.png'),
                ),
                title: Text('Stewart Menzies',style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w400,
                            color:Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
                subtitle: Text('4.5',style: GoogleFonts.getFont( 'Montserrat',
                            fontWeight: FontWeight.w400,
                            color: Color(0xffEB5757),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,),),
                            trailing: Image.asset('assets/msg.png'),          
          ) ,
          SizedBox(
            height: 10,
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
                   MaterialPageRoute(builder: (context) => MapTracking()));
              },
              child: Text(
                
                'Collected',
                style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 15,fontStyle: FontStyle.normal),

              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
                   Center(
            child:OutlinedButton(onPressed: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (builder) => CollectingParcel()));
            },
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
     minimumSize: Size(310, 60),
    side: BorderSide(width: 1.0, color: Colors.red,)),
  child: Text('Decline',style: TextStyle(color: Color(0xffEB5757),),))
          ),
           SizedBox(
            height: 20,
          ),
                
        ],
      ),
    );
  }




  }
