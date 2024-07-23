

import 'package:flutter/material.dart';

import 'components/our_colors.dart';

ThemeData theme() {
  return ThemeData(
      fontFamily: 'Inter',
      dividerColor: Colors.transparent,
    appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: OurColors.scaffoldBackgroundColor,
      useMaterial3: true,
      textTheme: textTheme(),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: Colors.pink,
      ).copyWith(),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: textTheme().bodySmall?.copyWith(color: OurColors.focusColorLight)
        ),
      ),
      unselectedWidgetColor: Colors.white,
      primaryColor: Colors.black,
    focusColor: OurColors.focusColorLight,
    //  appBarTheme: appBarTheme(),
      //textTheme: textTheme(),
      hintColor: Colors.black,
      //inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
TextTheme textTheme(){

    return const TextTheme(
        bodyLarge: TextStyle(color: OurColors.textColor, fontSize: 15,fontFamily: "Inter"),
    // body
    bodyMedium: TextStyle(color: OurColors.textColor, fontSize: 13,fontFamily: "Inter"),
        bodySmall: TextStyle(color: OurColors.textColor, fontSize: 12,fontFamily: "Inter"),
    // body small
    titleMedium: TextStyle(
    color: OurColors.textColor,
    fontSize: 17,
      fontFamily: "Inter",fontWeight: FontWeight.bold
    ),
        titleLarge: TextStyle(
            color: OurColors.textColor,
            fontSize: 20,
            fontFamily: "Inter"
        ),
        titleSmall: TextStyle(
            color: OurColors.textColor,
            fontSize: 12,
            fontFamily: "Inter",
          fontWeight: FontWeight.w600
        ),
    // (default for TextField)
    headlineSmall: TextStyle(
    color: OurColors.textColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter"));
    // body large
  }

  AppBarTheme appBarTheme(){
return const AppBarTheme(
  titleTextStyle: TextStyle(
      color: OurColors.textColorWhite,
      fontSize: 16,
      fontFamily: "Inter"
  ),
  color: OurColors.backgroundColor,
  foregroundColor: OurColors.textColorWhite,
);
}