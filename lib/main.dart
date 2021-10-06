import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/travel/travel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(),
      theme: ThemeData(
        accentColor: Colors.deepPurpleAccent,
        primaryColor: Colors.orange,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
