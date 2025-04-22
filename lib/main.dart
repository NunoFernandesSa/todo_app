import 'package:flutter/material.dart';

import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

/// MainApp is the main entry point of the application.
/// It sets up the MaterialApp with a custom theme and the HomePage as the initial screen.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// This widget is the root of the application.
  /// It sets up the MaterialApp with a custom theme and the HomePage as the initial screen.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner

      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[200],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black, // Text color in AppBar
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      home: HomePage(),
    );
  }
}
