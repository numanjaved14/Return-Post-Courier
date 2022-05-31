import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:returnpostuser/authentication/signinpage.dart';
import 'package:returnpostuser/mainscreen/mainscreen.dart';
import 'package:returnpostuser/privacypolicy/privacypolicy.dart';
import 'package:returnpostuser/services/database_services.dart';
import 'package:returnpostuser/utils/utils.dart';

class VehicleSettings extends StatefulWidget {
  const VehicleSettings({Key? key}) : super(key: key);

  @override
  _VehicleSettingsState createState() => _VehicleSettingsState();
}

class _VehicleSettingsState extends State<VehicleSettings> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _refreralController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _addNameController = TextEditingController();
  final TextEditingController _addTypeController = TextEditingController();
  final TextEditingController _addRegController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Uint8List? _image;

  var prevData;

  bool _isLoading = false;
  saveInfo() async {
    String res = await DataBaseMethods().addVecihleInfo(
      userName: prevData['username'],
      address: prevData['address'],
      email: prevData['email'],
      photoUrl: prevData['photoUrl'],
      isApproved: prevData['isApproved'],
      referal: prevData['referal'],
      vechileName: _addNameController.text,
      vechileType: _addTypeController.text,
      vechilRegistration: _addRegController.text,
    );
    if (res == 'added successfully') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    }
  }

  _selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
              'Select an Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Divider(
                thickness: 3,
                color: Colors.red,
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Take a photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List im = await pickeImage(ImageSource.camera);
                  setState(() {
                    _image = im;
                  });
                },
              ),
              // Divider(
              //   thickness: 0.5,
              //   color: Colors.red,
              // ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Choose from gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List im = await pickeImage(ImageSource.gallery);
                  setState(() {
                    _image = im;
                  });
                },
              ),
              //  Divider(
              //   thickness: 0.5,
              //   color: Colors.red,
              // ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
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

  signUpUser() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        CircularProgressIndicator();
        _isLoading = true;
      });
      String res = await DataBaseMethods().registerUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        referalCode: _refreralController.text,
        address: _addressController.text,
        file: _image!,
      );
      print(_image);
      setState(() {
        _isLoading = false;
      });
      if (res == "added successfully") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => PrivacyPolicy()),
          ),
        );
      }
    }
    print('this is SignUPUser $_emailController');
  }

  @override
  void initState() {
    getPrevData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff404040),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    'Add Vehicle Info',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 32,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 33),

                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      controller: _addNameController,

                      decoration: InputDecoration(
                        hintText: 'Name of Vehcile...',
                        contentPadding: EdgeInsets.only(top: 10, left: 20),
                        border: InputBorder.none,
                        labelStyle: GoogleFonts.getFont('Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                        hintStyle: GoogleFonts.getFont('Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8D8989),
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
                Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 25),

                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      controller: _addTypeController,

                      decoration: InputDecoration(
                        hintText: 'Enter type of vehcile...',
                        contentPadding: EdgeInsets.only(top: 10, left: 20),
                        border: InputBorder.none,
                        labelStyle: GoogleFonts.getFont('Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                        hintStyle: GoogleFonts.getFont('Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8D8989),
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 25),

                  //  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xff535353),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)

                  child: TextFormField(
                    controller: _addRegController,
                    //  textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: ' Registration #',
                      contentPadding: EdgeInsets.only(top: 20, left: 20),
                      border: InputBorder.none,
                      labelStyle: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                      ),
                      hintStyle: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8D8989),
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffEB5757),
                      fixedSize: Size(310, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: saveInfo,
                    //  () {
                    //   print('this is name controller $_usernameController');

                    //   print('this is name controller $_emailController');

                    //   print('this is name controller $_passwordController');

                    //   print('this is name controller $_refreralController');

                    //   if (formKey.currentState!.validate()) ;

                    //   // Navigator.push(context,
                    //   //     MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                    // },
                    child: Text(
                      'Upload Data',
                      style: GoogleFonts.getFont('Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Signinpage()));
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.getFont('Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffEB5757),
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getPrevData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap.data());
    prevData = snap.data();
    print('..................' + prevData.toString());
  }
}
