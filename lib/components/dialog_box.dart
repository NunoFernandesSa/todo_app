import 'package:flutter/material.dart';
import 'package:todo_app/components/my_button.dart';

/// This widget represents a dialog box that allows the user to add a new task.
/// It contains a text field for entering the task name and buttons for saving or canceling the action.
class DialogBox extends StatelessWidget {
  /// This is the controller for the text field in the dialog box.
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  /// This constructor initializes the DialogBox widget with a TextEditingController.
  /// It is used to retrieve the text entered by the user when creating a new task.
  /// The [super.key] parameter is used to pass the key to the parent class.
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  /// This method is called when the widget is built.
  /// It returns a widget that represents the dialog box.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
                hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // Add button
                MyButton(
                  textButton: "Save",
                  color: Colors.green[300],
                  onPressed: onSave,
                ),
                // Cancel button
                MyButton(
                  textButton: "Cancel",
                  color: Colors.red[300],
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
