import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои задачи'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Поле ввода и кнопка добавления
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Введите задачу...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: null, // Пока без логики
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Добавить'),
                ),
              ],
            ),
          ),
          
          // Список задач
          Expanded(
            child: ListView(
              children: const [
                TaskItem(
                  title: 'Купить молоко',
                  isCompleted: false,
                ),
                TaskItem(
                  title: 'Выучить Flutter',
                  isCompleted: true,
                ),
                TaskItem(
                  title: 'Позвонить другу',
                  isCompleted: false,
                ),
                TaskItem(
                  title: 'Сделать лабораторную работу',
                  isCompleted: false,
                ),
              ],
            ),
          ),
          
          // Кнопка перехода к экрану "О приложении"
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: null, // Пока без логики
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.info_outline),
              label: const Text('О приложении'),
            ),
          ),
        ],
      ),
    );
  }
}

// Виджет для отдельной задачи
class TaskItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  
  const TaskItem({
    super.key,
    required this.title,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: null, // Пока без логики
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: null, // Пока без логики
        ),
      ),
    );
  }
}