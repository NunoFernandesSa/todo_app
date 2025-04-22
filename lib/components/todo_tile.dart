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
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),

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
    );
  }
}
