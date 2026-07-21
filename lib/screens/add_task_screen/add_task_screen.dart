import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

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
              TextField(autofocus: true, textInputAction: TextInputAction.done),
              TextButton(onPressed: () {}, child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}
