import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fery Rides',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.pinkAccent, // Replaces accentColor
          secondary: Colors.pinkAccent, // Secondary UI elements
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 20), // Use for large titles
          bodyLarge: TextStyle(color: Colors.white), // Use for body text
          bodyMedium: TextStyle(color: Colors.white70), // Use for secondary text
        ),
      ),
      home: const LoginScreen(), // Start with LoginScreen
    );
  }
}

