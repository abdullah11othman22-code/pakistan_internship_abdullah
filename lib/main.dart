import 'package:flutter/material.dart';
import 'package:project1/screens/splash_screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white)
      ),
      home: WelcomeScreen(),
    );
  }
}
