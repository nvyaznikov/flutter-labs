import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/task_repository.dart';
import 'data/services/quote_service.dart';
import 'ui/view_models/home_view_model.dart';
import 'ui/view_models/about_view_model.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => TaskRepository()),
        Provider(create: (context) => QuoteService()),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            context.read<TaskRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AboutViewModel(
            context.read<QuoteService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}