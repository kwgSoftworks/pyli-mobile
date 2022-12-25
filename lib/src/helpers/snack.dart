import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Snack{
  static void showErrorSnack({String? title, String? message}){
    Get.rawSnackbar(
      backgroundColor: Color(0xffAA0000),
      title: title ?? 'Error',
      message: message ?? 'Something Went wrong',
      margin: EdgeInsets.all(20),
      borderRadius: 12,
    );
  }

  static void top(String title, String message, [VoidCallback? onPress]){
    Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        backgroundColor: Color(0xFF6DC046),
        mainButton: onPress == null ? null : TextButton(onPressed: onPress, child: Text('Allow')),
        borderRadius: 12,
        margin: EdgeInsets.all(20)
    );
  }

  static void snack(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(
        message,
        style: GoogleFonts.roboto()
      ),
    ));
  }
}