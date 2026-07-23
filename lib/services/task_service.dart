import 'package:collection/collection.dart';
import 'package:todoey/models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  int get taskListCount => _tasks.length;
  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask({required String taskName}) {
    _tasks.add(Task(name: taskName));
  }

  void toggleTask({required String id}) {
    Task? taskToToggle = _tasks.firstWhereOrNull((element) => element.id == id);
    if (taskToToggle != null) {
      taskToToggle.toggleDone();
    }
  }

  void deleteTask({required String id}) {
    Task? taskToDelete = _tasks.firstWhereOrNull((element) => element.id == id);
    if (taskToDelete != null) {
      _tasks.remove(taskToDelete);
    }
  }

  int getFinishedTaskCount() {
    return _tasks.where((element) => element.isDone).length;
  }

  int getPendingTaskCount() {
    return _tasks.where((element) => !element.isDone).length;
  }
}
