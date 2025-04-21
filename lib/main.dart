import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner

      home: Scaffold(body: ToDoPage()),
    );
  }
}
