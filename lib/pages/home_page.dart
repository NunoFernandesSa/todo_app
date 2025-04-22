import 'package:flutter/material.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';

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
  /// This is the box for storing todo items in Hive.
  /// It is used to store the todo items in the app.
  final _todosBox = Hive.box('TODOS');

  /// Instance of the ToDoDatabase class.
  /// This class is responsible for managing the todo list and its operations.
  /// It contains a list of todo items and methods to manipulate them.
  /// It is used to store the todo items in the app.
  /// The list is a list of lists, where each inner list contains the task name and its completion status.
  /// The first element of the inner list is the task name (String),
  /// and the second element is a boolean indicating whether the task is completed or not.
  /// The list is initialized as an empty list.
  ToDoDatabase db = ToDoDatabase(); // Create an instance of ToDoDatabase

  @override
  void initState() {
    super.initState();
    db.loadData(); // Load the todo items from the Hive box when the app starts
  }

  /// This is the controller for the text field in the dialog box.
  /// It is used to retrieve the text entered by the user when creating a new task.
  final _controller = TextEditingController();

  /// This function is called when the checkbox state changes.
  /// It updates the state of the todo item in the list and the Hive box.
  /// It takes a boolean value and an index as parameters.
  /// The boolean value indicates whether the checkbox is checked or not,
  /// and the index indicates the position of the todo item in the list.
  /// It updates the todo item in the list and the Hive box.
  /// It uses the setState method to update the UI when the checkbox state changes.
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] =
          !db.toDoList[index][1]; // Toggle the checkbox state
      db.updateData(); // Update the todo items in the Hive box
    });
  }

  /// This function is called when the save button in the dialog box is pressed.
  /// It retrieves the text entered by the user and adds it to the todo list.
  /// It takes the trimmed text from the text field and adds it to the todo list.
  /// It uses the setState method to update the UI when a new task is added.
  /// It also clears the text field and closes the dialog box after saving.
  /// It updates the todo items in the Hive box after adding a new task.
  /// It checks if the trimmed text is empty before adding it to the list.
  /// If the trimmed text is empty, it does not add it to the list and returns.
  void _onSave() {
    setState(() {
      String trimmedText = _controller.text.trim(); // Trim the text
      if (trimmedText.isEmpty) return; // Check if the trimmed text is empty
      db.toDoList.add([trimmedText, false]); // Add the new task to the list
    });
    _controller.clear(); // Clear the text field after saving
    Navigator.pop(context); // Close the dialog box
    db.updateData(); // Update the todo items in the Hive box
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

  /// This function is called when the delete button is pressed.
  /// It removes the task from the todo list at the specified index.
  /// It uses the setState method to update the UI when a task is deleted.
  /// It updates the todo items in the Hive box after deleting a task.
  /// It takes the index of the task to be deleted as a parameter.
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData(); // Update the todo items in the Hive box
    });
  }

  /// This function is called when the widget is built.
  /// It returns a Scaffold widget that contains the app bar, body, and floating action button.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODOApp'), centerTitle: true),

      body:
          db.toDoList.isEmpty
              ? const Center(child: Text('No tasks available'))
              : ListView.builder(
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskname: db.toDoList[index][0],
                    taskDone: db.toDoList[index][1],
                    onChanged: (value) => checkBoxChange(value, index),
                    deleteFunction: (context) => deleteTask(index),
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
