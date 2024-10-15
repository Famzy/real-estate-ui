import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/core/utils/string_constants.dart';

import 'color_constants.dart';

class ThemeConfig {
  static ThemeData get darkTheme => createTheme(
      brightness: Brightness.dark,
      background: Colors.white,
      primaryColor: ColorConstants().primaryColor,
      cardBackground: Colors.white,
      primaryText: ColorConstants().primaryTextColor,
      secondaryText: ColorConstants().secondaryTextColor,
      accentColor: ColorConstants().primaryColor,
      divider: ColorConstants().primaryColor,
      primaryColorDark: ColorConstants().primaryColor,
      primaryColorLight: ColorConstants().primaryColor,
      buttonBackground: ColorConstants().primaryColor,
      buttonText: ColorConstants().primaryTextColor,
      disabled: Colors.red,
      error: Colors.red,
      fontFamily: primaryFont);

  static ThemeData get lightTheme => createTheme(
      brightness: Brightness.light,
      background: Colors.white,
      primaryColor: ColorConstants().primaryColor,
      cardBackground: Colors.white,
      primaryText: ColorConstants().primaryTextColor,
      secondaryText: ColorConstants().secondaryTextColor,
      accentColor: ColorConstants().primaryColor,
      divider: ColorConstants().primaryColor,
      primaryColorDark: ColorConstants().primaryColor,
      primaryColorLight: ColorConstants().primaryColor,
      buttonBackground: ColorConstants().primaryColor,
      buttonText: ColorConstants().primaryTextColor,
      disabled: Colors.red,
      error: Colors.red,
      fontFamily: primaryFont);

  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color secondaryText,
    required Color accentColor,
    required Color divider,
    required Color buttonBackground,
    required Color buttonText,
    required Color cardBackground,
    required Color disabled,
    required Color primaryColorLight,
    required Color primaryColorDark,
    required Color error,
    required Color primaryColor,
    required String fontFamily,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      primaryColorLight: primaryColorDark,
      primaryColorDark: primaryColorLight,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              )),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(18.5)))),
      //  backgroundColor: background,
      primaryColor: primaryColor,
      //  toggleableActiveColor: accentColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: cardBackground,
        iconTheme: IconThemeData(
          color: secondaryText,
        ),
        toolbarTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            color: secondaryText,
            fontFamily: fontFamily,
            fontSize: 18,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            color: secondaryText,
            fontFamily: fontFamily,
            fontSize: 18,
          ),
        ).titleLarge,
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 16.0,
      ),
      // errorColor: error,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          secondary: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryText,
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      fontFamily: fontFamily,
      textTheme: TextTheme(

        displayLarge: baseTextTheme.displayLarge?.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: baseTextTheme.displaySmall?.copyWith(
          color: secondaryText,
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: baseTextTheme.headlineSmall?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          color: secondaryText,
          fontFamily: fontFamily,
          fontSize: 14,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          color: secondaryText,
          fontFamily: fontFamily,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          color: primaryText,
          fontFamily: fontFamily,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: baseTextTheme.titleSmall?.copyWith(
          color: secondaryText,
          fontFamily: fontFamily,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: accentColor, brightness: brightness),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
      ),
    );
  }
}
