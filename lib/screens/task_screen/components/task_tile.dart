import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.isDone,
    required this.checkboxCallback,
  });
  final String task;
  final bool isDone;
  final Function(bool?)? checkboxCallback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        task,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          decoration: isDone ? TextDecoration.lineThrough : null,
          color: Theme.of(
            context,
          ).colorScheme.onPrimaryContainer.withAlpha(isDone ? 150 : 255),
        ),
      ),
      trailing: Checkbox(value: isDone, onChanged: checkboxCallback),
    );
  }
}
