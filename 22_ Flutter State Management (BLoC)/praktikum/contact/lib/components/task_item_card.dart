import 'package:flutter/material.dart';
import 'package:contact/models/task_model.dart';
import 'package:contact/screens/task_item_screens.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel task;
  final Function() onPressed;
  const TaskItemCard({
    Key? key,
    required this.task,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_pin,
              size: 40,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.Name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  task.Contact,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('NO'),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: Text('YES'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
