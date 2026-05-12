import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        brightness: Brightness.dark,

        scaffoldBackgroundColor:
            const Color(0xff1B1B1B),

        textTheme: GoogleFonts.pressStart2pTextTheme(
          Theme.of(context).textTheme,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2E7D32),
          centerTitle: true,
        ),

        elevatedButtonTheme:
            ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xff4CAF50),

            foregroundColor: Colors.white,

            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0),
            ),

            padding: const EdgeInsets.symmetric(
              vertical: 18,
            ),
          ),
        ),

        inputDecorationTheme:
            InputDecorationTheme(

          filled: true,

          fillColor:
              const Color(0xff2C2C2C),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(0),

            borderSide: const BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(0),

            borderSide: const BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(0),

            borderSide: const BorderSide(
              color: Colors.lightGreenAccent,
              width: 3,
            ),
          ),
        ),
      ),

      home: const LoginPage(),
    );
  }
}