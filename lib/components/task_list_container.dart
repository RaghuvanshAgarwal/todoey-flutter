import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/components/tasks_list.dart';

class TaskListContainer extends StatelessWidget {
  const TaskListContainer({super.key, required this.mockTasks});
  final List<String> mockTasks;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final AppRadius radius = themeData.extension<AppRadius>()!;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius.xl!),
            topRight: Radius.circular(radius.xl!),
          ),
        ),
        child: TasksList(mockTasks: mockTasks),
      ),
    );
  }
}
