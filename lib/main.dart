import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rfidlabunasman/page/home_screen.dart';
import 'package:rfidlabunasman/page/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RFID Lab Unasman',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.blue,
        accentColor: Colors.orangeAccent,
      ),
      themeMode: ThemeMode.dark,
      // home: SplashScreen(),
      home: HomeScreen(),
    );
  }
}
