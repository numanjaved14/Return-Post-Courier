import 'package:flutter/material.dart';
import 'package:returnpostuser/mainscreen/navigationscreens/earnings/withdrawalaccountdetail.dart';

class WithdrawalAccount extends StatefulWidget {
  const WithdrawalAccount({ Key? key }) : super(key: key);

  @override
  _WithdrawalAccountState createState() => _WithdrawalAccountState();
}
enum SingingCharacter { lafayette, jefferson }


class _WithdrawalAccountState extends State<WithdrawalAccount> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/edit.png')),
          ),
        ],
      ),
      extendBody: true,
        backgroundColor: Color(0xff404040),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            width: 237,
           
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Withdrawal',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
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
            title: Text('**** 0303',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
            secondary: Image.asset('assets/master.png',height: 20,width: 20,),
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
            title: Text('Stewart M.',style: TextStyle(color: Color(0xff8D8989),fontSize: 16,fontWeight: FontWeight.w600),),
            secondary: Image.asset('assets/payments.png',height: 30,width: 20,),
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
          Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEB5757),
                    fixedSize: Size(310, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  onPressed: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => WithdrawalAccountDetail()));
                  },
                  child: Text(
                    'Coutinue',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ),

           Center(
            child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(23),
                 border: Border.all(
                   color: Color(0xffEB5757),
                   width: 1
                 )
               ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Color(0xffEB5757),
                    fixedSize: Size(310, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  onPressed: () {
                    //  Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) => EditAccount()));
                  },
                  child: Text(
                    'Add New Payment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
          ),

        ],),
    );
  }
}