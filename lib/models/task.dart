import 'package:uuid/uuid.dart';

class Task {
  final String _name;
  bool _isDone;
  late final String id;

  String get name => _name;
  bool get isDone => _isDone;

  Task({required this._name, this._isDone = false}) {
    id = Uuid().v4();
  }

  void toggleDone() {
    _isDone = !_isDone;
  }

  @override
  String toString() {
    return ' id: $id name: $name isDone: $isDone';
  }
}
