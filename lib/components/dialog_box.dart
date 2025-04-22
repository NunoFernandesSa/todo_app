import 'package:flutter/material.dart';
import 'package:todo_app/components/my_button.dart';

/// This class represents a dialog box that allows the user to add a new task.
/// It contains a text field for the user to enter the task name and two buttons:
class DialogBox extends StatelessWidget {
  /// The text editing controller used to retrieve the text entered by the user.
  /// It is passed to the dialog box to manage the text input.
  final TextEditingController controller;

  /// The callback function that is called when the user clicks the "Save" button.
  /// This function is used to save the new task entered by the user.
  final VoidCallback onSave;

  /// The callback function that is called when the user clicks the "Cancel" button.
  /// This function is used to close the dialog box without saving any changes.
  final VoidCallback onCancel;

  /// Constructor for the DialogBox class.
  /// It initializes the text editing controller and the callback functions for saving and canceling.
  /// The [key] parameter is optional and can be used to identify the widget in the widget tree.
  /// The [controller], [onSave], and [onCancel] parameters are required.
  /// The [controller] parameter is used to manage the text input in the dialog box.
  /// The [onSave] and [onCancel] parameters are used to handle the actions when the user clicks the respective buttons.
  /// The [onSave] parameter is a callback function that is called when the user clicks the "Save" button.
  /// The [onCancel] parameter is a callback function that is called when the user clicks the "Cancel" button.
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  /// This method builds the dialog box widget.
  /// It returns an AlertDialog widget with a text field for the user to enter the task name,
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
