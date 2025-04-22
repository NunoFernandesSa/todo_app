import 'package:flutter/material.dart';
import 'package:todo_app/components/dialog_box.dart';
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
  /// This is the controller for the text field in the dialog box.
  /// It is used to retrieve the text entered by the user when creating a new task.
  final _controller = TextEditingController();

  /// List of todos
  /// This is a list of strings that represent the tasks in the todo list.
  List<dynamic> toDoList = [];

  /// This function is called when the checkbox is changed.
  /// It takes the index of the todo item as a parameter and updates the state of the checkbox.
  /// It uses setState to rebuild the widget with the new state.
  /// The index is used to access the specific todo item in the list.
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; // Toggle the checkbox state
    });
  }

  /// This function is called when the save button in the dialog box is pressed.
  /// It retrieves the text from the text field and adds it to the todo list.
  void _onSave() {
    setState(() {
      toDoList.add([_controller.text, false]); // Add the new task to the list
    });
    _controller.clear(); // Clear the text field after saving
    Navigator.pop(context); // Close the dialog box
  }

  /// This function is called when the cancel button in the dialog box is pressed.
  /// It simply closes the dialog box without saving any changes.
  void _onCancel() {
    Navigator.pop(context); // Close the dialog box
    _controller.clear(); // Clear the text field
  }

  /// This function is called when the floating action button is pressed.
  /// It shows a dialog box where the user can enter a new task.
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: _onSave,
          onCancel: _onCancel,
        );
      },
    );
  }

  /// This function is called when the floating action button is pressed.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODOApp'), centerTitle: true),

      body:
          toDoList.isEmpty
              ? const Center(child: Text('No tasks available'))
              : ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskname: toDoList[index][0],
                    taskDone: toDoList[index][1],
                    onChanged: (value) => checkBoxChange(value, index),
                  );
                },
              ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
