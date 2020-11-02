import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: AppBarTheme(
      color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var appbar = AppBar(
  elevation: 0,
  title: Text(
    'ALPHA   NEWS',
    style: GoogleFonts.monoton(
        color: Colors.black,
        // textStyle: Theme.of(context).textTheme.display1,
        fontSize: 24,
        //fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal),
  ),
  centerTitle: true,
);
