import 'package:flutter/material.dart';
import 'package:task/models/task_manager.dart';
import 'package:task/screens/empty_task_screens.dart';
import 'package:task/models/task_manager.dart';
import 'package:task/screens/task_item_screens.dart';
import 'package:task/screens/task_item_screens.dart';
import 'package:task/screens/empty_task_screens.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/task_list_screens.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Home'),
      ),
      body: buildTaskScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(
                onCreate: (task) {
                  manager.addTask(task);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<TaskManager>(
      builder: (context, manager, child) {
        if (manager.taskModels.isNotEmpty) {
          return TaskListScreen(
            manager: manager,
          );
        } else {
          return EmptyTaskScreen();
        }
      },
    );
  }
}
