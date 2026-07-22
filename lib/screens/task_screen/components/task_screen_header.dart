import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey/app_theme.dart';

class TaskScreenHeader extends StatelessWidget {
  final int taskCount;

  const TaskScreenHeader({super.key, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final AppSpacing spacing = themeData.extension<AppSpacing>()!;
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
            visible: taskCount != 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Text(
              '$taskCount ${taskCount == 1 ? 'Task' : 'Tasks'}',
              style: themeData.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
