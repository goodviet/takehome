import 'package:flutter/material.dart';
import 'package:takehome/screen/home_screen.dart';
import 'package:takehome/screen/main_screen.dart';

import 'routes/routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes 
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
