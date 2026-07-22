import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/task_screen/components/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key, required this.taskList});
  final List<Task> taskList;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    AppPadding padding = Theme.of(context).extension<AppPadding>()!;
    return ListView.builder(
      padding: EdgeInsets.all(padding.xl!),
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) {
        Task task = widget.taskList[index];
        return TaskTile(
          task: task.name,
          isDone: task.isDone,
          checkboxCallback: (newValue) {
            setState(() {
              task.toggleDone();
            });
          },
        );
      },
    );
  }
}
