class Task {
  final String _name;
  bool _isDone;

  String get name => _name;
  bool get isDone => _isDone;

  Task({required this._name, this._isDone = false});

  void toggleDone() {
    _isDone = !_isDone;
  }
}
