import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final String task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(task),
      trailing: Checkbox(value: true, onChanged: (newValue) {}),
    );
  }
}
