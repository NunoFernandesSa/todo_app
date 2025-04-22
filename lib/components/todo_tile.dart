import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String? taskname;
  final bool? taskDone;
  final Function(bool?)? onChanged;

  // constructor
  const TodoTile({
    super.key,
    required this.taskname,
    required this.taskDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(6.0),
        ),

        child: Row(
          children: [
            Checkbox(value: taskDone, onChanged: onChanged),
            Text(taskname!.toString()),
          ],
        ),
      ),
    );
  }
}
