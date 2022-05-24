import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/faq/frequently.dart';

class Support extends StatefulWidget {
  const Support({ Key? key }) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
                title: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      height: 46,
                      width: 130,
                      //margin: EdgeInsets.only(left: 40,right: 40,top: 10),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xff535353),
                        borderRadius: new BorderRadius.circular(18),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                     
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.search,color: Color(0xff8D8989),),
                          // suffixIcon: Padding(
                          //   padding: EdgeInsets.only(top: 13, right: 20),
                          //   child: Icon(Icons.search,color: Color(0xff8D8989),)
                          // ),
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.only(top: 10, left: 10),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintStyle:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Color(0xff8D8989),fontSize: 14,fontStyle: FontStyle.normal),
                          // hintStyle: TextStyle(
                            
                          //   color: Color(0xff8D8989), // <-- Change this
                          //   fontSize: 12,
                          //   fontWeight: FontWeight.w600,
                          //   fontStyle: FontStyle.normal,
                          // ),
                        ),
                      )),  
               ),
               Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Container(width: 101,
                        margin: EdgeInsets.only(top: 25,left:25),
                        child: Text('Support',
                            style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 24,fontStyle: FontStyle.normal,height: 1,),),
                      ),
                       Container(
                        margin: EdgeInsets.only(top:25,left: 23,right:23),
                           padding: EdgeInsets.only(left: 10),
                        height: 60,
                        width: 350,
                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => FAQ()));
                          },
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          shape: CircleBorder(),
                          leading: Text(
                            'FAQ’s',
                            style :GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff8D8989),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top:20,left: 23,right:23),
                             padding: EdgeInsets.only(left: 10),
                        height: 60,
                        width: 350,
                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: ListTile(
                          onTap: (){
                          ///  Navigator.push(context, MaterialPageRoute(builder: (builder) => FAQ()));
                          },
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          shape: CircleBorder(),
                          leading: Text(
                            'Report problems',
                            style :GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff8D8989),
                          ),
                        ),
                      ),
                        Container(
                             padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top:20,left: 23,right:23),
                        height: 60,
                        width: 350,
                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: ListTile(
                          onTap: (){
                         //   Navigator.push(context, MaterialPageRoute(builder: (builder) => FAQ()));
                          },
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          shape: CircleBorder(),
                          leading: Text(
                            'Teams & Conditions',
                            style :GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff8D8989),
                          ),
                        ),
                      ),

                        Container(
                          margin: EdgeInsets.only(top:20,left: 23,right:23),
                             padding: EdgeInsets.only(left: 10),
                        height: 60,
                        width: 350,
                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: ListTile(
                          onTap: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (builder) => FAQ()));
                          },
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          shape: CircleBorder(),
                          leading: Text(
                            'Feedbacks',
                            style :GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff8D8989),
                          ),
                        ),
                      ),
            ],),
                 ),
               
             Container(
            
              margin: EdgeInsets.only(bottom:20,left: 23,right:23),
             child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    primary: Color(0xffEB5757),
                    fixedSize: Size(310, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                        ),
                  ),
                  onPressed: () {
                    //  Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                  },
                  child: Text(
                    'Send us an email',
                    style:  GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 15,fontStyle: FontStyle.normal),
                  ),
                ),
              ),
           ),
             ],
           )
         
      ),
    );
  }
}