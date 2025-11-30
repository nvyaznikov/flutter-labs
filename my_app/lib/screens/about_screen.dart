import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void _loadQuote(BuildContext context) {
    // Пока просто показываем сообщение
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Цитата загружена!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Описание приложения
            const Text(
              'ToDo List',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'ToDo List — простое приложение для управления задачами. '
              'Позволяет добавлять, отмечать выполненными и удалять задачи.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Кнопка загрузки цитаты
            Center(
              child: ElevatedButton(
                onPressed: () => _loadQuote(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: const Text('Загрузить цитату дня'),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Поле для отображения цитаты
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.format_quote,
                    color: Colors.grey,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Нажмите "Загрузить цитату дня", чтобы увидеть случайную цитату',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Кнопка назад
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _navigateBack(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Назад'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}