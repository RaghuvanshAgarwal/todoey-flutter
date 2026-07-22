import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/task_screen/components/tasks_list.dart';

class TaskListContainer extends StatelessWidget {
  const TaskListContainer({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final AppRadius radius = themeData.extension<AppRadius>()!;
    final AppPadding padding = themeData.extension<AppPadding>()!;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius.xl!),
            topRight: Radius.circular(radius.xl!),
          ),
        ),
        child: tasks.isNotEmpty
            ? TasksList(taskList: tasks)
            : Padding(
                padding: EdgeInsets.all(padding.md!),
                child: Center(
                  child: Text(
                    'Nothing on your plate... 🍽️',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.headlineLarge!.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
