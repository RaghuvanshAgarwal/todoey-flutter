import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/controllers/task_controller.dart';

class TaskScreenHeader extends StatelessWidget {
  const TaskScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final AppSpacing spacing = themeData.extension<AppSpacing>()!;
    TaskController controller = context.watch<TaskController>();
    return Container(
      padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: colorScheme.primaryContainer,
            child: FaIcon(
              FontAwesomeIcons.list,
              color: colorScheme.onPrimaryContainer,
              size: 40,
            ),
          ),
          SizedBox(height: spacing.s5!),
          Text('Todoey', style: themeData.textTheme.displayLarge),
          Visibility(
            visible: controller.taskListCount != 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: FittedBox(
              child: Text(
                getTaskCountLabel(context, controller),
                style: themeData.textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTaskCountLabel(BuildContext context, TaskController controller) {
    final int allTaskCount = controller.taskListCount;
    final int finishedTaskCount = controller.finishedTasksCount;

    if (allTaskCount == finishedTaskCount) {
      return 'All done and dusted';
    }
    if (finishedTaskCount == 0) {
      return 'Its time to get things done';
    }
    return '$finishedTaskCount out of $allTaskCount done';
  }
}
