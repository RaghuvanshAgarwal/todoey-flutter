import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/controllers/task_controller.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/task_screen/components/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    AppPadding padding = Theme.of(context).extension<AppPadding>()!;
    TaskController controller = context.watch<TaskController>();
    return ListView.builder(
      padding: EdgeInsets.all(padding.xl!),
      itemCount: controller.taskListCount,
      itemBuilder: (context, index) {
        Task? task = controller.tasks[index];
        return TaskTile(
          key: ValueKey(task.id),
          task: task.name,
          isDone: task.isDone,
          checkboxCallback: (newValue) {
            context.read<TaskController>().toggleTask(id: task.id);
          },
          onDelete: () => {
            context.read<TaskController>().deleteTask(id: task.id),
          },
        );
      },
    );
  }
}
