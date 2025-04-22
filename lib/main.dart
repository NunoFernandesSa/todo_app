import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:todo_app/pages/home_page.dart';

void main() async {
  /// Ensure that Flutter is initialized before using any Flutter widgets.
  /// This is necessary to use Flutter widgets in the main function.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Hive for local storage.
  /// This is necessary to use Hive for storing data locally.
  await Hive.initFlutter();

  /// Open a box named 'TODOS' for storing todo items.
  /// This box will be used to store the todo items in the app.
  var box = await Hive.openBox('TODOS');

  /// This function is the entry point of the application.
  /// It initializes the app and sets up the main widget.
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
