import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ir_project/app/core/utils/constants/constants.dart';

class AppTheme {
  static AppTheme? instance;

  AppTheme._();

  factory AppTheme.getInstance() {
    instance ??= AppTheme._();
    return instance!;
  }

  static ColorScheme colorScheme = ColorScheme(
      primary: blue.shade700,
      secondary: blue.shade400,
      surface: grey.shade400,
      background: blue.shade50,
      error: red.shade300,
      onPrimary: const Color(0xffffffff),
      onSecondary: const Color(0xffffffff),
      onSurface: const Color(0xff000000),
      onBackground: grey.shade200,
      onError: const Color(0xFFFF5959),
      brightness: Brightness.light,
      secondaryContainer: blue.shade800);

  static LinearGradient gradientBackground = LinearGradient(
    colors: [colorScheme.primary, colorScheme.primaryContainer],
  );

  TextTheme enTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 20.sp,
        letterSpacing: -1.5,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        fontSize: 18.sp,
        letterSpacing: -0.5,
        color: grey.shade700,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        fontSize: 16.sp,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 18.sp,
        letterSpacing: 0.25,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 16.sp,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(
        fontSize: 17.sp,
        letterSpacing: 0.15,
        color: colorScheme.primary,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w800),
    titleMedium: TextStyle(
        color: colorScheme.primary,
        fontSize: 16.sp,
        letterSpacing: 0,
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
        letterSpacing: 0),
    bodyLarge: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        letterSpacing: 0.2),
    bodyMedium: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        letterSpacing: 0.2),
    labelLarge: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontSize: 17.sp,
        color: blue.shade400,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
        letterSpacing: 0.4),
    labelSmall: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w400,
        // color: colorScheme.onBackground,
        fontSize: 12.sp,
        letterSpacing: 0.2),
    labelMedium: TextStyle(
        fontFamily: AppFonts.alexandria,
        fontWeight: FontWeight.w400,
        color: blue.shade700,
        fontSize: 15.sp,
        letterSpacing: 0.2),
  );

  TextTheme arTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.sp,
      letterSpacing: -1.5,
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 22.sp,
      letterSpacing: -0.5,
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 20.sp,
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 0.25,
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 0.15,
      fontFamily: AppFonts.alexandria,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      letterSpacing: 0,
      color: grey.shade600,
      fontFamily: AppFonts.alexandria,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
      fontSize: 13.sp,
      letterSpacing: 0,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.alexandria,
      fontSize: 16.sp,
      letterSpacing: 0.2,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.alexandria,
      fontSize: 14.sp,
      letterSpacing: 0.2,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.alexandria,
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
      letterSpacing: 1.25,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFonts.alexandria,
      fontSize: 16.sp,
      letterSpacing: 0.4,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFonts.alexandria,
      color: colorScheme.onBackground,
      fontSize: 14.sp,
      letterSpacing: 0.2,
    ),
  );

  ThemeData getAppTheme(String languageCode) => ThemeData(
        brightness: colorScheme.brightness,
        hintColor: grey.shade400,
        primaryColor: colorScheme.primary,
        unselectedWidgetColor: grey.shade600,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppLanguageKeys.en == languageCode
                  ? enTextTheme.labelLarge!.copyWith(
                      color: grey.shade300.withOpacity(.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )
                  : arTextTheme.labelLarge!.copyWith(
                      color: grey.shade300.withOpacity(.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    );
            } else {
              return AppLanguageKeys.en == languageCode
                  ? enTextTheme.labelLarge!.copyWith(
                      color: blue.shade100,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )
                  : arTextTheme.labelLarge!.copyWith(
                      color: blue.shade300,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    );
            }
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return blue.shade400.withOpacity(.5);
            } else {
              return blue.shade400;
            }
          }),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
          /*shape:
            MaterialStateProperty.resolveWith<RoundedRectangleBorder>((states) {
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.0),
              side: BorderSide(color: blue.shade400.withOpacity(.5)),
            );
          } else {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.0),
              side: BorderSide(color: blue.shade400),
            );
          }
        }),*/
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(88, 54),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return grey.shade500.withOpacity(.5);
            } else {
              return blue.shade200;
            }
          }),
          textStyle: MaterialStateProperty.all<TextStyle>(
              AppLanguageKeys.en == languageCode
                  ? enTextTheme.labelLarge!
                  : arTextTheme.labelLarge!),
        )),
        inputDecorationTheme: InputDecorationTheme(
          constraints: const BoxConstraints(
            minHeight: 50,
            minWidth: 88,
          ),
          errorStyle: languageCode == AppLanguageKeys.en
              ? enTextTheme.bodyMedium!.copyWith(color: colorScheme.error)
              : arTextTheme.bodyMedium!.copyWith(color: colorScheme.error),
          hintStyle: languageCode == AppLanguageKeys.en
              ? enTextTheme.titleSmall
              : arTextTheme.titleSmall,
          contentPadding:
              const EdgeInsetsDirectional.fromSTEB(20.04, 0, 0.0, 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: colorScheme.onError,
            ),
          ),
          errorMaxLines: 3,
          filled: true,
          fillColor: blue.shade900,
        ),
        primaryColorLight: grey.shade100,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        cardColor: Colors.white,
        dividerColor: colorScheme.onSurface.withOpacity(0.12),
        dialogBackgroundColor: colorScheme.background,
        textTheme:
            AppLanguageKeys.en == languageCode ? enTextTheme : arTextTheme,
        indicatorColor: colorScheme.primary,
        applyElevationOverlayColor: false,
        primaryColorDark: blue.shade700,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: grey.shade50,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: blue.shade700,
          ),
          unselectedIconTheme: IconThemeData(color: grey.shade400),
          selectedItemColor: blue.shade700,
          unselectedItemColor: grey.shade400,
          selectedLabelStyle: TextStyle(
              color: blue.shade700, fontSize: 9, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: grey.shade400, fontSize: 9),
        ),
        appBarTheme: AppBarTheme(color: colorScheme.primary),
        listTileTheme: const ListTileThemeData(
          dense: true,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return blue.shade200;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return blue.shade200;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return blue.shade200;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return blue.shade200;
            }
            return null;
          }),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface),
        colorScheme: colorScheme
            .copyWith(background: colorScheme.background)
            .copyWith(error: colorScheme.error),
        fontFamily: AppFonts.alexandria,
      );

  static LinearGradient navBarButtonsGradient = const LinearGradient(
    colors: [
      Color(0xff5EC4BF),
      Color(0xff1BA8CD),
      Color(0xff1BA8CD),
    ],
    transform: GradientRotation((360 - 140) * 2 * (3.1415926535897932) / 360),
  );

  static const MaterialColor red = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFF5ABBC),
      // 100: Color(0xffE15241),
      // 200: Color(0xFFFFFFFF),
      300: Color(0xFFFF5959),
      400: Color(0xffE62A50),
      // 500: Color(0xFFFFFFFF),
      // 600: Color(0xFFFFFFFF),
      // 700: Color(0xFFFFFFFF),
      // 800: Color(0xFFFFFFFF),
      // 900: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor grey = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFC7C7C7),
      200: Color(0xFFF4F5F7), //#F4F5F7
      300: Color(0xFF343434),
      400: Color(0xFF8690A2),
      500: Color(0xFF8E97A8),
      600: Color(0xFF42526E),
      700: Color(0xFF1D1D1D),
      800: Color(0xFF9E9E9E),
      // 900: Color(0xFFFFFFFF),
      // 111: Color(0xFFFFFFFF),
    },
  );
  static const MaterialColor blue = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color.fromRGBO(33, 230, 193, 1),
      200: Color.fromRGBO(81, 200, 255, 1),
      300: Color.fromRGBO(67, 170, 169, 1),
      400: Color.fromRGBO(67, 170, 169, 1),
      // 500: Color(0xFFFFFFFF),
      600: Color.fromRGBO(90, 168, 220, 1),
      700: Color.fromRGBO(48, 65, 107, 1),
      800: Color(0xff2e3552),
      900: Color(0xd3d0d0d0),
      // 111: Color(0xFFFFFFFF),
    },
  );
}
