import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:returnpostuser/authentication/signinpage.dart';
import 'package:returnpostuser/landing_scr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:returnpostuser/mainscreen/mainscreen.dart';
import 'package:returnpostuser/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.red,
        ),
        home: LandingScreen(),
      ),
    );
  }
}
