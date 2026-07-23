import 'package:flutter/material.dart';
import 'package:todoey/app_theme.dart';
import 'package:todoey/controllers/task_controller.dart';
import 'package:todoey/screens/task_screen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/services/task_service.dart';

void main() {
  runApp(const TodoeyApp());
}

class TodoeyApp extends StatelessWidget {
  const TodoeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = Colors.lightBlueAccent;
    return MultiProvider(
      providers: [
        Provider(create: (_) => TaskService()),
        ChangeNotifierProvider(
          create: (context) => TaskController(context.read<TaskService>()),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.buildTheme(
          seedColor: seed,
          brightness: Brightness.light,
        ),
        darkTheme: AppTheme.buildTheme(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: TasksScreen(),
      ),
    );
  }
}
