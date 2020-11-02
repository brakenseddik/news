import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:news/components/theme.dart';
import 'package:news/views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alpha News',
      theme: theme,
      home: AnimatedSplash(
        imagePath: 'assets/logo1.png',
        home: HomePage(),
        duration: 3500,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
