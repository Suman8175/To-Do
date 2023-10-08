import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 24,
        ),
        titleMedium: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: Colors.black, fontSize: 48, fontWeight: FontWeight.w900)),
    colorScheme: const ColorScheme.light(secondary: Colors.blueAccent),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(197, 110, 180, 0.8),
        shape: RoundedRectangleBorder()),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 193, 142, 142),
    ),
    hintColor: Colors.grey,
    useMaterial3: true);
