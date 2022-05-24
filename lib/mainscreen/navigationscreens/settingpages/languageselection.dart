import 'package:flutter/material.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({ Key? key }) : super(key: key);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}
enum SingingCharacter { lafayette, jefferson }

class _LanguageSelectionState extends State<LanguageSelection> {
    SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        extendBody: true,
        backgroundColor: Color(0xff404040),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

Container(
      margin: EdgeInsets.only(left: 20,),
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/back.png',height: 50,width: 50,)),
          ),

             Container(
              width: 237,
            
              margin: EdgeInsets.only(top: 10,left: 30),
              child: Text(
                'Language',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
               margin: EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 19),
               decoration: BoxDecoration(
                color: Color(0xffEB5757),
                borderRadius: new BorderRadius.circular(20),
              ),
              child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                selectedTileColor:    Color(0xffEB5757),
              title: const Text('English',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
              margin: EdgeInsets.only(left: 30,right: 30),
             decoration: BoxDecoration(
                color: Color(0xff535353),
                  borderRadius: new BorderRadius.circular(20),
              ),
            child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('English',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
               margin: EdgeInsets.only(left: 30,right: 30,top: 20),
               decoration: BoxDecoration(
                color:Color(0xff535353),
                borderRadius: new BorderRadius.circular(20),
              ),
              child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                selectedTileColor:    Color(0xffEB5757),
              title: const Text('English',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
              margin: EdgeInsets.only(left: 30,right: 30,top: 20),
             decoration: BoxDecoration(
                color: Color(0xff535353),
                  borderRadius: new BorderRadius.circular(20),
              ),
            child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('English',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}