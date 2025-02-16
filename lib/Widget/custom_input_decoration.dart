// lib/custom_input_decoration.dart

import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration getDecoration({
    required String hintText,
    required Widget icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      counter: const Offstage(),
      contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
      hintStyle: const TextStyle(
        color: Color(0xFFB0B0B0), // Replace with your ColorHelper.greyColor
        fontWeight: FontWeight.w500, // Replace with your FontHelper.medium
        fontSize: 18.0, // Replace with your FontHelper.size_18
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16.0), // Replace with your DimensHelper.dimens_16
        child: icon,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), // Replace with your DimensHelper.dimens_50
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)), // Replace with your ColorHelper.grey300
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), // Replace with your DimensHelper.dimens_50
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)), // Replace with your ColorHelper.grey300
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), // Replace with your DimensHelper.dimens_50
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)), // Replace with your ColorHelper.grey300
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), // Replace with your DimensHelper.dimens_50
        borderSide: const BorderSide(color: Color(0xFF6200EE)), // Replace with your ColorHelper.primaryColor
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), // Replace with your DimensHelper.dimens_50
        borderSide: const BorderSide(color: Color(0xFFFF0000)), // Replace with your ColorHelper.redColor
      ),
    );
  }
}