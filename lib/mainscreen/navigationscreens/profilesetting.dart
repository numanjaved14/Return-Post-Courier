import 'package:flutter/material.dart';
import 'package:returnpostuser/services/database_services.dart';
import 'package:returnpostuser/utils/utils.dart';

class ProfileSettings extends StatefulWidget {
  String? username;
  String? email;
  String? address;
  String? photoUrl;
  ProfileSettings({
    Key? key,
    required this.username,
    this.address,
    this.email,
    this.photoUrl,
  }) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String? Carname;
  String? CarType;
  String? CarRegistration;

  TextEditingController _addNameController = TextEditingController();
  TextEditingController _addTypeController = TextEditingController();
  TextEditingController _addRegController = TextEditingController();

  saveInfo() async {
    // String res = await DataBaseMethods().addVecihleInfo(
    //             vechileName: Carname,
    //             vechileType: CarType,
    //             vechilRegistration: CarRegistration,
    //           );
    //           print(Carname);
    //           print(res);
    // setState(() {
    //   Carname = _addNameController.text;
    //   CarType = _addTypeController.text;
    //   CarRegistration = _addRegController.text;
    // });
  }

  _addVehicleInfo(TextEditingController textEditingController) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
              'Add Data below',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              // Divider(
              //   thickness: 0.5,
              //   color: Colors.red,
              // ),

              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'add here',
                  border: UnderlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),

              //  Divider(
              //   thickness: 0.5,
              //   color: Colors.red,
              // ),
              SimpleDialogOption(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  saveInfo();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.red,
              ),

              SimpleDialogOption(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Close',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Profile settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.photoUrl!),
              ),
              title: Text('Edit photo',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  )),
            ),
          ), //CircleAvata,)
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text('Name',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(widget.username!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Edit',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                )),
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
            child: Text('Email',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text(widget.email!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Edit',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                )),
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
            child: Text('Address',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: widget.address != null
                ? Text(widget.address!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))
                : Container(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator.adaptive()),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('Edit',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                )),
          ),
          Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
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
            child: Text('Vehicle info',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text('Vehicle',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Carname != null
                  ? Text("${Carname!}")
                  : Text("name!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _addVehicleInfo(_addNameController),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 30),
                        child: Text(
                          'Add+..',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  child: Text('Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: const Text('Vehicle Type',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: CarType != null
                  ? Text("${CarType!}")
                  : Text("mention type",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _addVehicleInfo(_addTypeController),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    child: Text('Add+..',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  child: Text('Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                ),
              ],
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
            child: Text('Vehicle Reg',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: CarRegistration != null
                  ? Text("${CarRegistration!}")
                  : Text("Car Registration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _addVehicleInfo(_addRegController),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    child: Text('Add+..',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  child: Text('Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            thickness: 0.5,
            indent: 27,
            endIndent: 27,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text('Insurance Doc',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text('classified',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 30),
                  child: Text('Add+..',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 50),
                  child: Text('Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: saveInfo,
            child: Text("Submit"),
          )
        ],
      ),
    );
  }

  ///Function Alert Dialig

  void mydialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),

              backgroundColor: Color(0xffEB5757),
              title: Center(
                  child: Container(
                      width: 188,
                      height: 58,
                      child: const Text(
                        'New\n Phone number',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
              content: Container(
                height: 180,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(top: 3, right: 20, left: 20),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)
                      ),
                      child: TextFormField(
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Enter new number',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          // suffixIcon: Icon(Icons.remove_red_eye),

                          hintStyle: TextStyle(
                            color: Colors.red, // <-- Change this
                            fontSize: 12,

                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                          // focusedBorder:OutlineInputBorder(
                          //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          //   borderRadius: BorderRadius.circular(25.0),
                          // hintTextDirection: HitTestDispatcher.,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          'Enter a new phone number to which\n   an SMS with a code will be sent',
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(202, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                        onPressed: () {
                          seconddialog(context);
                        },
                        child: Text(
                          'Sent',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // actions: <Widget>[
              //   TextButton(
              //     onPressed: () => Navigator.pop(context, 'Cancel'),
              //     child: const Text('Cancel'),
              //   ),
              //   TextButton(
              //     onPressed: () => Navigator.pop(context, 'OK'),
              //     child: const Text('OK'),
              //  ),
            ));
  }

  void seconddialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color(0xffEB5757),
        title: Center(
            child: Container(
                width: 188,
                height: 58,
                child: const Text(
                  'New\n Phone number',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ))),
        content: Container(
            height: 180,
            child: Column(children: [
              Container(
                height: 60,
                margin: EdgeInsets.only(top: 3, right: 20, left: 20),

                //  padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: TextFormField(
                  //  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Enter Code',
                    contentPadding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    // suffixIcon: Icon(Icons.remove_red_eye),

                    hintStyle: TextStyle(
                      color: Colors.red, // <-- Change this
                      fontSize: 12,

                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    // focusedBorder:OutlineInputBorder(
                    //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(25.0),
                    // hintTextDirection: HitTestDispatcher.,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Enter a new phone number to which\n   an SMS with a code will be sent',
                    style: TextStyle(color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(202, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  onPressed: () {
                    thirddialog(context);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
              ),
            ])),
      ),
    );
  }

  void thirddialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: Color(0xffEB5757),
          title: Center(
              child: Container(
                  width: 188,
                  height: 58,
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
          content: Container(
              height: 180,
              child: Column(children: [
                InkWell(
                  child: Image.asset(
                    'assets/check.png',
                    height: 50,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'Enter a new phone number to which\n   an SMS with a code will be sent',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(202, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ProfileSettings(
                                    username: '',
                                  )));
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                ),
              ]))),
    );
  }
}
