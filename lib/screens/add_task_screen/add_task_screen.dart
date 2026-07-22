import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, required this.onNewTaskAdded});
  final TextEditingController taskLabelController = TextEditingController();
  final Function(Task) onNewTaskAdded;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    AppPadding padding = themeData.extension<AppPadding>()!;
    AppSpacing spacing = themeData.extension<AppSpacing>()!;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(padding.xl!),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: spacing.s4!,
            children: [
              Text(
                'Add Task',
                style: themeData.textTheme.headlineLarge!.copyWith(
                  color: themeData.colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: taskLabelController,
                autofocus: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) =>
                    onNewTaskAdded(Task(name: taskLabelController.text)),
              ),
              TextButton(
                onPressed: () {
                  onNewTaskAdded(Task(name: taskLabelController.text));
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
