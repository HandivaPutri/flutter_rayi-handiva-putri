import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/models/task_manager.dart';
import 'package:task/screens/task_screens.dart';
import 'package:task/screens/empty_task_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: TaskScreen(),
      ),
    );
  }
}
