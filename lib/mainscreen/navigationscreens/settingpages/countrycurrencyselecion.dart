import 'package:flutter/material.dart';

class CountryCurrencySelecion extends StatefulWidget {
  const CountryCurrencySelecion({ Key? key }) : super(key: key);

  @override
  _CountryCurrencySelecionState createState() => _CountryCurrencySelecionState();
}
enum SingingCharacter { lafayette, jefferson }

class _CountryCurrencySelecionState extends State<CountryCurrencySelecion> {
 SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
         
      
        backgroundColor: Color(0xff404040),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
        margin: EdgeInsets.only(left: 15,),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/back.png',height: 50,width: 50,)),
            ),
             Container(
              width: 237,
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
              child: Text(
                'Currency',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
               margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
               decoration: BoxDecoration(
                color: Color(0xffEB5757),
                borderRadius: new BorderRadius.circular(15),
              ),
              child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                selectedTileColor:    Color(0xffEB5757),
              title: const Text('£ Pouds',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
             decoration: BoxDecoration(
                color: Color(0xff535353),
                borderRadius: new BorderRadius.circular(15),
              ),
            child: RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('£ Pouds',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600)),
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