import 'package:flipkart_clone/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: ThemeData().appBarTheme.copyWith(
        foregroundColor: kColorScheme.onPrimaryContainer,
        backgroundColor: kColorScheme.primaryContainer,
      ),
  textTheme: ThemeData().textTheme.apply(
        bodyColor: kColorScheme.onPrimaryContainer,
        displayColor: kColorScheme.onPrimaryContainer,
      ),
);
ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
        backgroundColor: kDarkColorScheme.primaryContainer,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: kDarkColorScheme.onPrimaryContainer,
        displayColor: kDarkColorScheme.onPrimaryContainer,
      ),
);
