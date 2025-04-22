import 'package:hive_ce_flutter/hive_flutter.dart';

/// This class is responsible for managing the todo list and its operations.
/// It contains a list of todo items and methods to manipulate them.
/// It is used to store the todo items in the app.
class ToDoDatabase {
  List<dynamic> toDoList = [];

  /// This function is called when the app starts.
  /// It initializes Hive and opens a box for storing todo items.
  final _todosBox = Hive.box('TODOS'); // Open the box for storing todo items

  /// loadData() is a function that loads the todo items from the Hive box.
  /// It retrieves the todo items from the box and assigns them to the toDoList variable.
  void loadData() {
    toDoList =
        _todosBox.get('TODOSLIST') ?? []; // Load the todo items from the box
  }

  /// updateData() is a function that updates the todo items in the Hive box.
  /// It saves the current state of the todo items to the box.
  void updateData() {
    _todosBox.put('TODOSLIST', toDoList); // Update the todo items in the box
  }
}
