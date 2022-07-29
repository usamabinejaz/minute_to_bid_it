import 'package:flutter/material.dart';

import '../data/constants.dart';

ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: Constants.appWhiteColor,
  selectedRowColor: Constants.appColor4,
  primaryColorDark: Constants.appBlackColor,
  primaryColorLight: Constants.appColor3,
  primaryColor: Constants.mainColor,
  colorScheme: const ColorScheme.light(
    primary: Constants.appColor1,
    secondary: Constants.appColor2,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.mainColor),
      borderRadius: BorderRadius.circular(5.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.mainColor),
      borderRadius: BorderRadius.circular(5.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.appErrorColor),
      borderRadius: BorderRadius.circular(5.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.appErrorColor),
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          MaterialStateProperty.all<Color>(Constants.appWhiteColor),
      backgroundColor: MaterialStateProperty.all<Color>(Constants.appColor1),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          side: BorderSide(color: Constants.appColor1),
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        const Size(250, 45),
      ),
    ),
  ),
);
