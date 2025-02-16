// import 'package:flutter/material.dart';
//
// class AppTheme {
//   const AppTheme._();
//
//   static ThemeData theme(bool isLight) => _mainTheme(isLight).copyWith(
//     popupMenuTheme: PopupMenuThemeData(iconColor: _color(isLight).onError),
//     appBarTheme: _appBarTheme(isLight),
//     inputDecorationTheme: _inputDec(isLight),
//     chipTheme: _chipTheme(isLight),
//     dialogTheme: DialogTheme(
//       backgroundColor: _color(isLight).surface,
//     ),
//     bottomSheetTheme: BottomSheetThemeData(
//       backgroundColor: _color(isLight).surface,
//     ),
//     scaffoldBackgroundColor:
//     isLight ? const Color(0xffF5F5F5) : const Color(0xFF191B24),
//     outlinedButtonTheme: OutlinedButtonThemeData(
//         style: ButtonStyle(
//           shape: const WidgetStatePropertyAll(StadiumBorder()),
//           backgroundColor: WidgetStatePropertyAll(
//             _color(isLight).surface,
//           ),
//           foregroundColor: WidgetStatePropertyAll(
//             _color(isLight).onSurface,
//           ),
//         )),
//     filledButtonTheme: FilledButtonThemeData(
//       style: ButtonStyle(
//         shape: const WidgetStatePropertyAll(StadiumBorder()),
//         backgroundColor: WidgetStatePropertyAll(
//           _color(isLight).primary,
//         ),
//         foregroundColor: WidgetStatePropertyAll(
//           _color(isLight).onPrimary,
//         ),
//       ),
//     ),
//   );
//
//   static ChipThemeData _chipTheme(bool isLight) {
//     return ChipThemeData(
//       checkmarkColor: _color(isLight).onPrimary,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//       color: WidgetStateProperty.resolveWith(
//             (states) {
//           return _color(isLight).primaryContainer;
//         },
//       ),
//     );
//   }
//
//   static AppBarTheme _appBarTheme(bool isLight) {
//     return AppBarTheme(
//       centerTitle: true,
//       backgroundColor:
//       isLight ? const Color(0xffF5F5F5) : const Color(0xFF191B24),
//       iconTheme: IconThemeData(color: _color(isLight).onPrimary),
//       titleTextStyle: _mainTheme(isLight).textTheme.titleLarge?.copyWith(),
//     );
//   }
//
//   static InputDecorationTheme _inputDec(bool isLight) {
//     var border = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(100),
//       borderSide: BorderSide(
//         color: _color(isLight).primary,
//         width: .07,
//       ),
//     );
//     return InputDecorationTheme(
//       fillColor: _color(isLight).onSurface.withOpacity(.05),
//       border: border,
//       filled: true,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(100),
//         borderSide: BorderSide.none,
//       ),
//       outlineBorder: border.borderSide,
//     );
//   }
//
//   static ThemeData _mainTheme(bool isLight) => isLight ? _ThemeFlex.light : _ThemeFlex.dark;
//
//   static ColorScheme _color(bool isLight) => isLight ? ColorScheme.light() : ColorScheme.dark();
// }
//
// class _ThemeFlex {
//   const _ThemeFlex._();
//   static ThemeData light = _lightTheme;
//   static ThemeData dark = _darkTheme;
//
//   static int _blendLvl(bool isLight) => isLight ? 4 : 7;
//   static String? _fontFamily() => null; // No external font packages, so null
//
//   static FlexSubThemesData _subTheme(bool isLight) {
//     return FlexSubThemesData(
//       blendOnLevel: isLight ? 10 : 20,
//       blendOnColors: isLight ? false : true,
//       useTextTheme: true,
//       useM2StyleDividerInM3: true,
//       thinBorderWidth: 0.5,
//       splashType: FlexSplashType.inkSparkle,
//       defaultRadius: Corners.lg,
//       sliderValueTinted: true,
//       sliderTrackHeight: 3,
//       inputDecoratorIsFilled: false,
//       inputDecoratorUnfocusedBorderIsColored: false,
//       fabUseShape: true,
//       chipRadius: Corners.med,
//       popupMenuElevation: 2.0,
//       alignedDropdown: true,
//       useInputDecoratorThemeInDialogs: true,
//       tabBarIndicatorWeight: 2,
//       tabBarDividerColor: const Color(0x00000000),
//       drawerIndicatorSchemeColor: SchemeColor.primary,
//       drawerIndicatorOpacity: 0.2,
//       drawerSelectedItemSchemeColor: SchemeColor.primary,
//       bottomNavigationBarElevation: 2.0,
//       bottomNavigationBarShowUnselectedLabels: false,
//       navigationBarLabelBehavior:
//       filledButtonRadius: Corners.lg,
//     );
//   }
//
//   static final ThemeData _lightTheme = ThemeData.light().copyWith(
//     colorScheme: ColorScheme.light(),
//     surfaceMode: SurfaceMode.lowScaffold,
//     bottomAppBarElevation: 1.0,
//     tooltipsMatchBackground: true,
//     subThemesData: _subTheme(false),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     useMaterial3: true,
//     swapLegacyOnMaterial3: true,
//     fontFamily: _fontFamily(),
//     textTheme: textTheme,
//   );
//
//   static final ThemeData _darkTheme = ThemeData.dark().copyWith(
//     colorScheme: ColorScheme.dark(),
//     surfaceMode: SurfaceMode.lowScaffold,
//     bottomAppBarElevation: 1.0,
//     tooltipsMatchBackground: true,
//     subThemesData: _subTheme(true),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     useMaterial3: true,
//     swapLegacyOnMaterial3: true,
//     textTheme: textTheme,
//   );
//
//   static TextTheme textTheme = TextTheme(
//     displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
//     displayMedium: TextStyle(fontSize: 55, fontWeight: FontWeight.w300, letterSpacing: -0.5),
//     displaySmall: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
//     headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//     headlineSmall: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
//     titleLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
//     titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
//     titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
//     bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
//     bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//     labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
//     bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
//     labelSmall: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
//   );
// }
