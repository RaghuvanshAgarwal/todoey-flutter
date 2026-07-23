import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/services/task_service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService;

  TaskController(this._taskService);

  List<Task> get tasks => _taskService.tasks;
  int get taskListCount => _taskService.taskListCount;
  int get finishedTasksCount => _taskService.getFinishedTaskCount();
  int get pendingTasksCount => _taskService.getPendingTaskCount();

  void addTask({required String taskName}) {
    _taskService.addTask(taskName: taskName);
    notifyListeners();
  }

  void toggleTask({required String id}) {
    _taskService.toggleTask(id: id);
    notifyListeners();
  }

  void deleteTask({required String id}) {
    _taskService.deleteTask(id: id);
    notifyListeners();
  }
}
