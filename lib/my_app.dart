import 'package:contact/screens/home_screen.dart';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.darkBlue,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
