import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/settingpages/countrycurrencyselecion.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/settingpages/countryselection.dart';

class CurrenySelection extends StatefulWidget {
  const CurrenySelection({Key? key}) : super(key: key);

  @override
  _CurrenySelectionState createState() => _CurrenySelectionState();
}

class _CurrenySelectionState extends State<CurrenySelection> {
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
            width: 300,
           
            margin: EdgeInsets.only(left: 15,top: 20),
            child: Text(
              'Country and currency',
              style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 24,fontStyle: FontStyle.normal),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => CountrySelecion()));
            },
            child: Container(
                height: 65,
                width: 340,
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
               decoration: BoxDecoration(
                  color: Color(0xff535353),
                    borderRadius: new BorderRadius.circular(25),
                ),
              child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('Country',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)),
                    Spacer(),
                    Text('United Kingdom',style: TextStyle(color: Color(0xff8D8989),fontSize: 12,fontWeight: FontWeight.w600),),
                    Container(
                       margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios,color: Color(0xff8D8989),))
                  ],)
        
            ),
          ),

           InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => CountryCurrencySelecion()));
            },
            child: Container(
                height: 65,
                width: 340,
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
               decoration: BoxDecoration(
                  color: Color(0xff535353),
                    borderRadius: new BorderRadius.circular(25),
                ),
              child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('Currency',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)),
                    Spacer(),
                    Text('£',style: TextStyle(color: Color(0xff8D8989),fontSize: 12,fontWeight: FontWeight.w600),),
                    Container(
                       margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios,color: Color(0xff8D8989),))
                  ],)
        
            ),
          ),
         
  
        ],
      ),
    );
  }
}
