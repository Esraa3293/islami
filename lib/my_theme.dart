import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFFFACC1D);
  static const Color darkSecondary = Color(0xFF141A2E);
  static const Color blackColor = Color(0xFF242424);
  static const Color whiteColor = Color(0xFFF8F8F8);

  static const double cardElevation = 8.0;
  static const double cardBorderRadius = 15.0;
  static const double appBarElevation = 0.0;
  static const double actionsIconSize = 30.0;
  static const double dividerThickness = 2.0;

  static const double bodyLargeFontSize = 30.0;
  static const double bodyMedFontSize = 25.0;
  static const double bodySmallFontSize = 20.0;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: blackColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: appBarElevation,
      actionsIconTheme: IconThemeData(size: actionsIconSize),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: lightPrimary),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: bodyLargeFontSize,
          color: blackColor,
          fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: bodyMedFontSize, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: bodySmallFontSize, fontWeight: FontWeight.w300),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: lightPrimary,
      onPrimary: whiteColor,
      secondary: blackColor,
      onSecondary: whiteColor,
      surface: whiteColor,
      onSurface: blackColor,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    dividerTheme: const DividerThemeData(
        color: lightPrimary, thickness: dividerThickness),
    cardTheme: CardThemeData(
      elevation: cardElevation,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      // لضمان قص الـ ListView مع تدويرة حواف الـ Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        side: const BorderSide(color: lightPrimary),
      ),
      margin: const EdgeInsets.all(12.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimary,
      foregroundColor: Colors.white,
    )),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: lightPrimary,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            return IconThemeData(
                color: states.contains(WidgetState.selected)
                    ? Colors.black
                    : Colors.white);
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            return TextStyle(
                fontSize: 14,
                color: states.contains(WidgetState.selected)
                    ? Colors.black
                    : Colors.white);
          },
        )),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: whiteColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: appBarElevation,
      actionsIconTheme: IconThemeData(size: actionsIconSize),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: darkPrimary),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: bodyLargeFontSize,
          color: whiteColor,
          fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: bodyMedFontSize,
          color: whiteColor,
          fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: bodySmallFontSize,
          color: whiteColor,
          fontWeight: FontWeight.w300),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: darkSecondary,
      secondary: darkPrimary,
      onSecondary: darkSecondary,
      surface: darkSecondary,
      onSurface: darkPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    dividerTheme:
        const DividerThemeData(color: darkPrimary, thickness: dividerThickness),
    cardTheme: CardThemeData(
      elevation: cardElevation,
      color: darkSecondary,
      clipBehavior: Clip.antiAlias,
      // لضمان قص الـ ListView مع تدويرة حواف الـ Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        side: const BorderSide(color: darkPrimary),
      ),
      margin: const EdgeInsets.all(12.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: darkPrimary,
      foregroundColor: blackColor,
    )),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: darkSecondary,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            return IconThemeData(
                color: states.contains(WidgetState.selected)
                    ? darkPrimary
                    : whiteColor);
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            return TextStyle(
                fontSize: 14,
                color: states.contains(WidgetState.selected)
                    ? darkPrimary
                    : whiteColor);
          },
        )),
  );
}
