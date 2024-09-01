import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/theme/app_color.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      appBarTheme:
          AppBarTheme(iconTheme: IconThemeData(color: AppColor.yellowColor)),
      scaffoldBackgroundColor: AppColor.primaryColor,
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        backgroundColor: AppColor.blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.secondGrayColor,
        selectedItemColor:AppColor.darkYellowColor
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor),
        titleMedium: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor),
        titleSmall: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColor.grayColor),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.lightGrayColor),
        bodySmall: GoogleFonts.inter(
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: AppColor.grayColor),
        headlineMedium: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor),
        headlineSmall: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor),
      ));
}
