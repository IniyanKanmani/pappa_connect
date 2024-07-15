import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kPrimaryBackgroundColor = const Color(0xFFEFEFF4);
Color kSecondaryBackgroundColor = Colors.white54;
Color kTertiaryBackgroundColor = Colors.white;
Color kSelectedItemColor = const Color(0xFF0265DC);
Color kUnSelectedItemColor = const Color(0xFF6D6D6D);
Color kSaveTextColor = const Color(0xFF0F80FF);
Color kClearTextColor = const Color(0xFFFF473C);
Color kHintTextColor = const Color(0xFFC4C4C6);
Color kCheckboxCheckedColor = const Color(0xFF9A3DF1);
Color kCursorColor = const Color(0xFF333333);
Color kInputFieldFillColor = const Color(0xEEE8DEF8);
Color kDropdownMenuFillColor = const Color(0xFFE3E3E6);
Color kButtonTextColor = const Color(0xFF6750A4);
Color kButtonBackgroundColor = const Color(0xFF007BFE);
Color kPassBackgroundColor = const Color(0xFFCCFFDD);
Color kPassForegroundColor = const Color(0xFF208441);
Color kFailBackgroundColor = const Color(0xFFFFCBDD);
Color kFailForegroundColor = const Color(0xFF981F48);

TextStyle kLabelTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);

TextStyle kHintTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: kHintTextColor,
  ),
);

TextStyle kSaveButtonTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: kSaveTextColor,
  ),
);

TextStyle kCancelButtonTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: kClearTextColor,
  ),
);

BorderRadius kBorderRadius = BorderRadius.circular(5.0);
List<BoxShadow> kBoxShadowList = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
];
