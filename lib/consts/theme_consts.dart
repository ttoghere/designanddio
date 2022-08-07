 import 'package:flutter/material.dart';

var themeData = ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
              headline2: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.redAccent,
              ),
              bodyText1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent,
              )),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent));