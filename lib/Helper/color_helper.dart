import 'dart:ui';
import 'package:flutter/material.dart';

class ColorHelper {
  ColorHelper._();
  static final ColorHelper assetsHelper = ColorHelper._();

  factory ColorHelper (){
    return assetsHelper;
  }

  static const Color appColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color tpColor = Color(0x00000000);
  static const Color primaryColor = Color(0xFFC73618);
}