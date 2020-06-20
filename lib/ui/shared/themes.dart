import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycustomers/ui/shared/const_text_style.dart';

import 'const_color.dart';

final _lightThemeData = ThemeData.light();
final _darkThemeData = ThemeData.dark();

/// Material Light Theme
final primaryMaterialTheme = _lightThemeData.copyWith(
  textTheme: _lightThemeData.textTheme.apply(
    fontFamily: 'Lato',
  ),
  appBarTheme: _lightThemeData.appBarTheme.copyWith(
    color: ThemeColors.background,
    textTheme: TextTheme(
      headline6: kheadingText,
      bodyText2: bodyTextStyle(FontWeight.normal),
    ),
    iconTheme: IconThemeData(
      color: ThemeColors.black,
    ),
  ),
  iconTheme: _lightThemeData.iconTheme.copyWith(
    color: BrandColors.secondary,
  ),
  accentIconTheme: _lightThemeData.accentIconTheme.copyWith(
    color: ThemeColors.gray[800],
  ),
);

/// Material Dark Theme
final darkMaterialTheme = _darkThemeData.copyWith(
  textTheme: _darkThemeData.textTheme.apply(
    fontFamily: 'Lato',
  ),
  appBarTheme: _lightThemeData.appBarTheme.copyWith(
    textTheme: TextTheme(
      headline6: kheadingText,
      bodyText2: bodyTextStyle(FontWeight.normal),
    ),
    iconTheme: IconThemeData(
      color: ThemeColors.background,
    ),
  ),
  iconTheme: _lightThemeData.iconTheme.copyWith(color: ThemeColors.background),
  accentIconTheme: _lightThemeData.accentIconTheme.copyWith(
    color: ThemeColors.gray[800],
  ),
);

/// Cupertino Theme Data
final primaryCupertinoTheme = CupertinoThemeData(
  primaryColor: CupertinoDynamicColor.withBrightness(
    color: Colors.purple,
    darkColor: Colors.cyan,
  ),
);
