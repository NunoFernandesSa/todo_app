import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// A widget that represents a single todo item in the list.
/// It displays the task name, a checkbox to mark it as done or not,
class TodoTile extends StatelessWidget {
  /// The name of the task.
  final String? taskname;

  /// A boolean value indicating whether the task is done or not.
  /// It is used to determine the state of the checkbox.
  final bool? taskDone;

  /// A callback function that is called when the checkbox is changed.
  /// It takes a boolean value as an argument.
  final Function(bool?)? onChanged;

  /// A callback function that is called when the delete action is triggered.
  /// It takes a BuildContext as an argument.
  /// This function is used to delete the todo item from the list.
  final Function(BuildContext)? deleteFunction;

  /// Constructor for the TodoTile widget.
  /// Creates a [TodoTile] widget.
  /// The [taskname] parameter specifies the name of the todo item.
  /// The [taskDone] parameter indicates whether the todo item is completed.
  /// The [onChanged] callback is triggered when the checkbox state changes.
  /// The [deleteFunction] callback is triggered when the delete action is performed.
  /// The [key] parameter is optional and can be used to uniquely identify the widget in the widget tree.
  const TodoTile({
    super.key,
    required this.taskname,
    required this.taskDone,
    required this.onChanged,
    required this.deleteFunction,
  });

  /// The build method is called to build the widget.
  /// It returns a Padding widget that contains a Slidable widget.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(6.0),
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(6.0),
          ),

          child: Row(
            children: [
              Checkbox(
                value: taskDone,
                activeColor: Colors.grey[500],
                onChanged: onChanged,
              ),
              Text(
                taskname!.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  decoration:
                      taskDone!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
