import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ),
  ),
   appBarTheme:const AppBarTheme(
     backgroundColor: Colors.white,
     elevation: 0,
     iconTheme: IconThemeData(
       color: Colors.black,
     ),
   ),
  );



  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.white70,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    backgroundColor: Colors.white,
      );

}
