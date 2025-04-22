import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_tile.dart';

/// This is the main widget for the home page of the todo app.
/// It displays a list of todo items and allows the user to interact with them.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// This is the state class for the HomePage widget.
/// It manages the state of the todo list and handles user interactions.
class _HomePageState extends State<HomePage> {
  /// List of todos
  /// This is a list of strings that represent the tasks in the todo list.
  List<dynamic> toDoList = [
    ['Read a book', false],
    ['Complete Flutter project', false],
  ];

  /// This function is called when the checkbox is changed.
  /// It takes the index of the todo item as a parameter and updates the state of the checkbox.
  /// It uses setState to rebuild the widget with the new state.
  /// The index is used to access the specific todo item in the list.
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; // Toggle the checkbox state
    });
  }

  /// This function is called when the floating action button is pressed.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODOApp'), centerTitle: true),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:
            (context, index) => TodoTile(
              taskname: toDoList[index][0],
              taskDone: toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
            ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
