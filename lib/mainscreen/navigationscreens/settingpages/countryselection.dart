import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountrySelecion extends StatefulWidget {
  const CountrySelecion({ Key? key }) : super(key: key);

  @override
  _CountrySelecionState createState() => _CountrySelecionState();
}
enum SingingCharacter { lafayette, jefferson }

class _CountrySelecionState extends State<CountrySelecion> {
  SingingCharacter? _character = SingingCharacter.lafayette;

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
            width: 237,
            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: Text(
              'Country',
              style: GoogleFonts.getFont('Montserrat',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 24,fontStyle: FontStyle.normal),
            ),
          ),
          Container(
                      height: 60,

             margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
             decoration: BoxDecoration(
              color: Color(0xffEB5757),
              borderRadius: new BorderRadius.circular(15),
            ),
            child: RadioListTile<SingingCharacter>(
              controlAffinity: ListTileControlAffinity.trailing,
              selectedTileColor:    Color(0xffEB5757),
            title: const Text('United Kingdom',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
          height: 60,
            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
           decoration: BoxDecoration(
              color: Color(0xff535353),
              borderRadius: new BorderRadius.circular(15),
            ),
          child: RadioListTile<SingingCharacter>(
              controlAffinity: ListTileControlAffinity.trailing,
            title: const Text('United Kingdom',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
    );
  }
}