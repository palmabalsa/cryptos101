// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class Themes {
  static final light = ThemeData(
      primaryColor: Colors.lime.shade400,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.lime.shade100,
        foregroundColor: Colors.blueGrey.shade700,
      ),
      scaffoldBackgroundColor: Colors.lime.shade100,
      fontFamily: 'Sofiapro',
      textTheme: const TextTheme(
        headline1: TextStyle(),
        headline4: TextStyle(color: Colors.black),
        headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        headline6: TextStyle(color: Colors.black),
        // buttons:
        bodyText1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        //  dropdown menus:
        bodyText2: TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      )),

      //for drop down menus ::::::::::::

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        isDense: true,
        fillColor: Colors.lime.shade100,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));
}
