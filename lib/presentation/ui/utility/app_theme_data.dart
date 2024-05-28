import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData{
  static ThemeData LightThemeData=ThemeData(
    primarySwatch: MaterialColor(
        AppColors.primaryColor.value,
        AppColors.colorSwatch
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    inputDecorationTheme:  InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            )
        )
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(150),
        ),
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,

        )
    ),
    appBarTheme:  AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5
    ),
  );
}