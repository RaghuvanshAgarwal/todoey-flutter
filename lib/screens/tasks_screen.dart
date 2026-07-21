import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey/components/task_list_container.dart';
import 'package:todoey/components/task_screen_header.dart';

class TasksScreen extends StatelessWidget {
  final List<String> mockTasks = [
    'Buy Milk',
    'Go to office',
    'Get Ready',
    'Study Flutter',
  ];

  TasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskScreenHeader(),
          TaskListContainer(mockTasks: mockTasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
