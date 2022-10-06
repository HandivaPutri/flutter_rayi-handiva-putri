import 'package:flutter/material.dart';
import 'package:contact/models/task_model.dart';

class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Icon(Icons.people), Text('Your contact is empty')],
      ),
    );
  }
}
