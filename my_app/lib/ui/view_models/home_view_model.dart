import 'package:flutter/foundation.dart';
import '../../data/models/task.dart';
import '../../data/repositories/task_repository.dart';

class HomeViewModel with ChangeNotifier {
  final TaskRepository _taskRepository;
  List<Task> _tasks = [];
  bool _isLoading = false;

  HomeViewModel(this._taskRepository);

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _tasks = await _taskRepository.getTasks();
    } catch (e) {
      // Обработка ошибки
      if (kDebugMode) {
        print('Error loading tasks: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title.trim(),
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    
    await _taskRepository.addTask(newTask);
    await loadTasks(); // Перезагружаем задачи
  }

  Future<void> toggleTaskCompletion(int taskId) async {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    
    await _taskRepository.updateTask(updatedTask);
    await loadTasks();
  }

  Future<void> deleteTask(int taskId) async {
    await _taskRepository.deleteTask(taskId);
    await loadTasks();
  }
}