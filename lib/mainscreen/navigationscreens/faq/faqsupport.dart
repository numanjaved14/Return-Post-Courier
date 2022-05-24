import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQSupport extends StatefulWidget {
  const FAQSupport({ Key? key }) : super(key: key);

  @override
  _FAQSupportState createState() => _FAQSupportState();
}

class _FAQSupportState extends State<FAQSupport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xff404040),
         body: Column(
           
           children: [
               ListTile(
                 leading:  InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/back.png',height: 50,width: 50,)),
                 
               ),
               Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Container(width: 101,
                        margin: EdgeInsets.only(top: 25,left: 12),
                        child: Text('Support',
                            style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 24,fontStyle: FontStyle.normal,height: 1,),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25,left:10),
                        child: Text('How to connect wallet',
                            style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 24,fontStyle: FontStyle.normal,height: 1,),),
                      ),
                       Container(
                         margin: EdgeInsets.only(top: 10,left: 10),
                        // margin: EdgeInsets.only(top:25,left: 20,right:20),
                        //    padding: EdgeInsets.only(left: 10),
                       
                        width: 310,
                        height: 264,
                        //  padding: const EdgeInsets.all(3.0),
                       
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1
                        ),)
                      ),
                  
            ],),
                 ),
               
             Column(
               children: [
                 Text('Did this answer help you?',style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600,color: Colors.white,fontSize: 14),),
                 Container(
                   margin: EdgeInsets.only(top: 20,bottom: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/like.png'),
                       SizedBox(width: 20,),
                       Image.asset('assets/dislike.png'),
                     ],
                   ),
                 ),
               ],
             ),
             ],
           )
         
      ),
    );
  }
}