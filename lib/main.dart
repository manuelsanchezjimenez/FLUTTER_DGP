import 'package:app_dgp/mongodb.dart';
import 'package:app_dgp/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './constants.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
          fontFamily:GoogleFonts.lexend(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          //color: Colors.black,
         ).fontFamily,
        primaryColor: kPrimaryColor,
        primaryColorLight: kPrimaryLightColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: UsersScreen(),
    );
  }
}
