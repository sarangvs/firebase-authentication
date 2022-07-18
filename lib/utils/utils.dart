import 'package:assignment/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String text) {
    final snackBar = SnackBar(
      content:
          Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.w400)),
      backgroundColor: AppTheme.primaryColor,
      duration: const Duration(seconds: 3),
      // shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    snackbarKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
