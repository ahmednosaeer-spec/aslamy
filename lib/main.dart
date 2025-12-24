import 'package:aslimy/home_screen/home_screen.dart';
import 'package:aslimy/utlis/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mine() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {AppRoutes.homeRouteName: (context) => HomeScreen()},
    );
  }
}
