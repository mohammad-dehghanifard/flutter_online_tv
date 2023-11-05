import 'dart:ui';
// ignore: implementation_imports
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyle{
  AppTextStyle._();
  static TextStyle titleMedium = GoogleFonts.vazirmatn(color: AppColors.black,fontWeight: FontWeight.w700);
  static TextStyle subTitle = GoogleFonts.vazirmatn(color: AppColors.white,fontWeight: FontWeight.w400);
}