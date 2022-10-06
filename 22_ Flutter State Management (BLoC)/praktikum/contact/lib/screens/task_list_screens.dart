import 'package:contact/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:contact/models/task_manager.dart';
import 'package:contact/components/task_item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatelessWidget {
  final TaskManager manager;
  const TaskListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModels;
    return Padding(
      padding: EdgeInsets.all(16),
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: taskItems.length,
            itemBuilder: (context, index) {
              final item = taskItems[index];
              return TaskItemCard(
                key: Key(item.id),
                task: item,
                onPressed: () {
                  manager.deleteTask(index);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.Name} Deleted'),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          );
        },
      ),
    );
  }
}
