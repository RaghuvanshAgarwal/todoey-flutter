import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey/app_theme.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final AppSpacing spacing = themeData.extension<AppSpacing>()!;
    final AppRadius radius = themeData.extension<AppRadius>()!;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                Text('12 Tasks', style: themeData.textTheme.headlineMedium),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius.xl!),
                  topRight: Radius.circular(radius.xl!),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
