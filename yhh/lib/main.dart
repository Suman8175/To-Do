import 'package:flutter/material.dart';
import 'package:yhh/get_started_page.dart';
import 'package:yhh/theme/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GetStarted(),
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
