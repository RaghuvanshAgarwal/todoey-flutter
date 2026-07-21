import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/components/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.mockTasks});
  final List<String> mockTasks;

  @override
  Widget build(BuildContext context) {
    AppPadding padding = Theme.of(context).extension<AppPadding>()!;
    return ListView.builder(
      padding: EdgeInsets.all(padding.xl!),
      itemCount: mockTasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: mockTasks[index]);
      },
    );
  }
}
