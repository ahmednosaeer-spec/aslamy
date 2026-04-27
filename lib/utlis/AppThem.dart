import 'package:aslimy/utlis/appColors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primarColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      // showSelectedLabels: true,
    ),
  );
}
