import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const TodoeyApp());
}

class TodoeyApp extends StatelessWidget {
  const TodoeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = Colors.lightBlueAccent;
    return MaterialApp(
      theme: AppTheme.buildTheme(seedColor: seed, brightness: Brightness.light),
      darkTheme: AppTheme.buildTheme(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: TasksScreen(),
    );
  }
}
