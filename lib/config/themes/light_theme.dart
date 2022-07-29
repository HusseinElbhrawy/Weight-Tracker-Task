import 'package:flutter/material.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';

ThemeData lightTheme(context) {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent.shade200,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    sliderTheme: const SliderThemeData(
      thumbShape: RoundSliderOverlayShape(),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(color: Colors.white),
    ),
  );
}
