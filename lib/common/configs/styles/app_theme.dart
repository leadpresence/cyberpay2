import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// Styles class holding app theming information

/// Dark theme data of the app
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: AppTextStyles.fontFamily,
  primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary),
  scaffoldBackgroundColor: AppColors.dark_background,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.dark_background,
  ),

  backgroundColor: AppColors.black,
  textTheme: darkTextTheme,
  primaryTextTheme: primaryTextTheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.black,
    titleTextStyle: AppTextStyles.h2,
  ),
);

/// Light theme data of the app
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary),
  textTheme: appTextTheme,
  scaffoldBackgroundColor: AppColors.white,
  primaryTextTheme: primaryTextTheme,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  dropdownMenuTheme:DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.blue2.withOpacity(0.5), fontSize: 12),
      filled: true,
      fillColor: AppColors.blue2.withOpacity(0.2),
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: AppColors.blue2.withOpacity(0.2), width: 21.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: AppColors.blue2.withOpacity(0.2), width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.2), width: 2.0),
      ),
    ),
    menuStyle: MenuStyle(

    )

  ) ,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.blue2.withOpacity(0.5), fontSize: 12),
    filled: true,
    fillColor: AppColors.blue2.withOpacity(0.2),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: AppColors.blue2.withOpacity(0.2), width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: AppColors.blue2.withOpacity(0.2), width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red.withOpacity(0.2), width: 2.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.white,
  ),
);

/// Styles class holding app text theming information
// class TextThemes {
/// Main text theme
TextTheme appTextTheme = TextTheme(
  bodyText1: AppTextStyles.bodyLg,
  bodyText2: AppTextStyles.body,
  subtitle1: AppTextStyles.bodySm,
  subtitle2: AppTextStyles.bodyXs,
  headline1: AppTextStyles.h1,
  headline2: AppTextStyles.h2,
  headline3: AppTextStyles.h3,
  headline4: AppTextStyles.h4,
);

/// Dark text theme
TextTheme darkTextTheme = TextTheme(
  bodyText1: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
  bodyText2: AppTextStyles.body.copyWith(color: AppColors.white),
  subtitle1: AppTextStyles.bodySm.copyWith(color: AppColors.white),
  subtitle2: AppTextStyles.bodyXs.copyWith(color: AppColors.white),
  headline1: AppTextStyles.h1.copyWith(color: AppColors.white),
  headline2: AppTextStyles.h2.copyWith(color: AppColors.white),
  headline3: AppTextStyles.h3.copyWith(color: AppColors.white),
  headline4: AppTextStyles.h4.copyWith(color: AppColors.white),
);

/// Primary text theme
/// Uses [AppColors.primary] for all text styles
TextTheme primaryTextTheme = TextTheme(
  bodyText1: AppTextStyles.bodyLg.copyWith(color: AppColors.primary),
  bodyText2: AppTextStyles.body.copyWith(color: AppColors.primary),
  subtitle1: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
  subtitle2: AppTextStyles.bodyXs.copyWith(color: AppColors.primary),
  headline1: AppTextStyles.h1.copyWith(color: AppColors.primary),
  headline2: AppTextStyles.h2.copyWith(color: AppColors.primary),
  headline3: AppTextStyles.h3.copyWith(color: AppColors.primary),
  headline4: AppTextStyles.h4.copyWith(color: AppColors.primary),
);
