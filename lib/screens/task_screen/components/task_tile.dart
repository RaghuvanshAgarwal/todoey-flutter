import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});

  final String task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        widget.task,
        style: TextStyle(
          decoration: _isChecked ? TextDecoration.lineThrough : null,
          color: Theme.of(
            context,
          ).colorScheme.onPrimaryContainer.withAlpha(_isChecked ? 150 : 255),
        ),
      ),
      trailing: Checkbox(
        value: _isChecked,
        onChanged: (newValue) {
          setState(() {
            _isChecked = newValue!;
          });
        },
      ),
    );
  }
}
