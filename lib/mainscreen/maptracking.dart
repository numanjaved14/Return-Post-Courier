import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnpostuser/mainscreen/fullorderdetail.dart';
import 'package:returnpostuser/widgets/mydrawer.dart';

class MapTracking extends StatefulWidget {
  const MapTracking({Key? key}) : super(key: key);

  @override
  _MapTrackingState createState() => _MapTrackingState();
}

class _MapTrackingState extends State<MapTracking> {
  var scalfoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scalfoldKey,
        backgroundColor: Color(0xff404040),
        drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
          child: Column(
            children: [
             
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
            onTap: () {
              scalfoldKey.currentState!.openDrawer();
            },
            child: Image.asset('assets/menu.png',height: 100,width: 100,fit: BoxFit.contain,),
          ),
           InkWell(
              onTap: () {},
              child: Image.asset('assets/search.png',height: 100,width: 100,fit: BoxFit.contain,),
            )
               ],
             ),


              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/track.png',
                      height: 370,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showNextModal(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/mapthree.png',
                         height: 100,width: 100,fit: BoxFit.contain,
                        )),
                  ),
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/maptwo.png',
                          height: 100,width: 100,fit: BoxFit.contain,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showNextModal(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor:Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff404040),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                   
                    
                   ListTile(
                      title:  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('10 min',style:  GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 36,
                              fontStyle: FontStyle.normal,
                            ),),
                    ),
                      subtitle: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('0.1 mi · 12:12',style:  GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff8D8989),
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                            ),),
                    ),
                      trailing: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder) => FullOrderDetail())),
                        child: Image.asset('assets/info.png',height: 100,width: 100,fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 20,bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Image.asset('assets/circle.png'),
                        SizedBox(width: 20,),
                        Text('12 Blueberry Ln, London, EC5M 6JN',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.w500),)
                      ],),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
