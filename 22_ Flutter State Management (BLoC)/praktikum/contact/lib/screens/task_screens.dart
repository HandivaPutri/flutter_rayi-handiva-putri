import 'package:flutter/material.dart';
import 'package:contact/models/task_manager.dart';
import 'package:contact/models/task_model.dart';
import 'package:contact/screens/empty_task_screens.dart';
import 'package:contact/models/task_manager.dart';
import 'package:contact/screens/task_item_screens.dart';
import 'package:contact/screens/task_item_screens.dart';
import 'package:contact/screens/empty_task_screens.dart';
import 'package:provider/provider.dart';
import 'package:contact/screens/task_list_screens.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Home'),
      ),
      body: Container(child: buildTaskScreen()),
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
