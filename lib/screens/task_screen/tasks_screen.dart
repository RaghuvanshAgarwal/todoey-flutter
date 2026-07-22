import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen/add_task_screen.dart';
import 'package:todoey/screens/task_screen/components/task_list_container.dart';
import 'package:todoey/screens/task_screen/components/task_screen_header.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskScreenHeader(taskCount: tasks.length),
          TaskListContainer(tasks: tasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTapAddTaskButton(context);
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  void onTapAddTaskButton(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AppRadius radius = themeData.extension<AppRadius>()!;
    final ColorScheme colorScheme = themeData.colorScheme;
    showModalBottomSheet(
      barrierColor: colorScheme.tertiary.withAlpha(150),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(radius.xl!),
          topRight: Radius.circular(radius.xl!),
        ),
      ),
      context: context,
      builder: (sheetContext) {
        return AddTaskScreen(
          onNewTaskAdded: (Task task) {
            setState(() {
              tasks.add(task);
            });
            Navigator.of(sheetContext).pop();
          },
        );
      },
    );
  }
}
