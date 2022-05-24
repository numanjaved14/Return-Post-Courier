import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/settingpages/countrycurrencyselecion.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/settingpages/currencyselection.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/settingpages/languageselection.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
    bool _lights = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff404040),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/back.png',
                      height: 50,
                      width: 50,
                    )),
              ),
            Container(width: 200,
                          margin: EdgeInsets.only(top: 20,left:23),
                          child: Text('Settings',
                              style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 36,fontStyle: FontStyle.normal,height: 1,),),
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
                              Navigator.push(context, MaterialPageRoute(builder: (builder) => LanguageSelection()));
                            },
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            shape: CircleBorder(),
                            leading: Text(
                              'Language',
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
                              Navigator.push(context, MaterialPageRoute(builder: (builder) => CountryCurrencySelecion()));
                            },
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            shape: CircleBorder(),
                            leading: Text(
                              'Country and currency',
                              style :GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 12,fontStyle: FontStyle.normal),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff8D8989),
                            ),
                          ),
                        ),
            Container(
                 margin: EdgeInsets.only(top:20,left: 20,right:20),
                             padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width,
                  //  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xff535353),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)

                  child:SwitchListTile(
              selectedTileColor: Color(0xffEB5757),
              activeColor: Color(0xffEB5757),
              activeTrackColor:  Color(0xffEB5757),
      title: const Text('Notifications',style: TextStyle( color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
     
    )
              
              ),
           
            ],
          )),
    );
  }
}
