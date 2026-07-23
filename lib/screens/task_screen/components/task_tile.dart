import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.isDone,
    required this.checkboxCallback,
    required this.onDelete,
  });
  final String task;
  final bool isDone;
  final Function(bool?)? checkboxCallback;
  final VoidCallback? onDelete;
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
      leading: Checkbox(value: isDone, onChanged: checkboxCallback),
      trailing: IconButton(
        onPressed: onDelete,
        icon: FaIcon(
          FontAwesomeIcons.trash,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
