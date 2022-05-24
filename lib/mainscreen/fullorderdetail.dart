import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/orderpickupscreen.dart';

class FullOrderDetail extends StatefulWidget {
  const FullOrderDetail({ Key? key }) : super(key: key);

  @override
  _FullOrderDetailState createState() => _FullOrderDetailState();
}
enum SingingCharacter { lafayette, jefferson }

class _FullOrderDetailState extends State<FullOrderDetail> {
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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: Image.asset('assets/pin.png',height: 36,width: 36,),
              title: Text('Carrier',
                  style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff8D8989),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),),
                          subtitle:  Text('Post Office',
                  style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),),
            ),
          ), //CircleAvata,)
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
            Column(
              children: [
   Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Type of job',
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
                          'Collection',
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
                          '0.5mi',
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
                          'Tracking Number',
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
                          'PIA12124556',
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
            child: Text('Enter order number',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10),

                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        
                        hintText: '02355',
                        contentPadding: EdgeInsets.only(top: 10, left: 20),
                        border: InputBorder.none,
                     
                        
                        labelStyle:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                        hintStyle:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                      ),
                    )),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Order verified',
                style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Color(0xff5CD995),fontSize: 12,fontStyle: FontStyle.normal),),
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
            child: Text('How was your pickup?',
                style:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Color(0xff8D8989),fontSize: 12,fontStyle: FontStyle.normal),),
          ),
           Container(
              margin: EdgeInsets.only(top: 10, left: 30),
             child: RadioListTile<SingingCharacter>(
              // tileColor:  Color(0xffEB5757),
             //      controlAffinity: ListTileControlAffinity.leading,
                selectedTileColor:    Color(0xffEB5757),
              title: const Text('Order Ready',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
                
            title: const Text('Order not Ready',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
            child: Text('Photo of the back and front of the parcel',
                style:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Color(0xff8D8989),fontSize: 12,fontStyle: FontStyle.normal),),
          ),

          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 20),
            child: Row(
              children:[
                Container(
                  height: 55,
                  width: 101,
                  child: InkWell(
                    child: Image.asset(
                      'assets/add.png'
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 55,
                  width: 101,
                  child: InkWell(
                    child: Image.asset(
                      'assets/add.png'
                    ),
                  ),
                )
              ]
            ),
            
          ),
          Container(
             margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffEB5757),
                  minimumSize: Size(310, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context) => OrderPickUpScreen()));
                },
                child: Text(
                  
                  'Start delivery',
                  style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 15,fontStyle: FontStyle.normal),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
  }
