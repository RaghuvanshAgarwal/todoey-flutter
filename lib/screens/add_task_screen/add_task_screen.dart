import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, required this.onNewTaskAdded});
  final Function(String) onNewTaskAdded;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskLabelController = TextEditingController();

  @override
  void dispose() {
    taskLabelController.dispose();
    super.dispose();
  }

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
                    widget.onNewTaskAdded(taskLabelController.text),
              ),
              TextButton(
                onPressed: () {
                  widget.onNewTaskAdded(taskLabelController.text);
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
