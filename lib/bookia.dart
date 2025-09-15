

import 'package:bookia_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "DMSerifDisplay"),

      home: WelcomeScreen(),
    );
  }
}