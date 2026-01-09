import 'package:aslimy/home_screen/tabs/qruan/details/suraDetailsScreen.dart';
import 'package:aslimy/utlis/AppThem.dart';
import 'package:flutter/material.dart';
import 'package:aslimy/home_screen/home_screen.dart';
import 'package:aslimy/utlis/app_routes.dart';
import 'package:aslimy/utlis/appTheme.dart'; // ★★★ أضف هذا ★★★
import 'home_screen/tabs/qruan/details/suraDetailsScreen1.dart';
import 'intro_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introRouteName,
      routes: {
        AppRoutes.introRouteName: (context) => const IntroScreen(),
        AppRoutes.homeRouteName: (context) => const HomeScreen(),
        AppRoutes.suraDetailRouteName: (context) => const Suradetailsscreen(),
        AppRoutes.suraDetail1RouteName: (context) => Suradetailsscreen1(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}