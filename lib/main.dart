import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redbus_app/LandingUi/landing_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white12,
    systemNavigationBarIconBrightness: Brightness.light, // Icons: white
  ));
  runApp(const RedBusApp());
}

class RedBusApp extends StatefulWidget {
  const RedBusApp({super.key});

  @override
  State<RedBusApp> createState() => _RedBusAppState();
}

class _RedBusAppState extends State<RedBusApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
      ),
    );
  }
}
