import 'package:flutter/material.dart';
import 'package:task/models/task_model.dart';
import 'package:task/models/task_manager.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  const TaskItemScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);
  final Function(TaskModel) onCreate;

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskPhoneController = TextEditingController();
  String _taskName = '';
  String _taskPhone = '';

  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        _taskName = _taskNameController.text;
      });
    });
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //buildNameField
              buildNameField(),
              //buildButton
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _taskNameController,
          decoration: InputDecoration(
            hintText: "Nama",
            labelText: "Nama",
            fillColor: Colors.grey.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        TextFormField(
          controller: _taskPhoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
            labelText: "Phone Number",
            fillColor: Colors.grey.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your hone number';
            }
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }

  Widget buildButton() {
    final contactProvider = Provider.of<TaskManager>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: () {
        setState(() {
          formKey.currentState!.validate();
        });
        if (_taskNameController.text.isEmpty ||
            _taskPhoneController.text.isEmpty) {
          return;
        }
        final taskItem = TaskModel(
          id: Uuid().v1(),
          Name: _taskNameController.text,
          Contact: _taskPhoneController.text,
        );
        contactProvider.addTask(taskItem);
        Navigator.pop(context);
      },
      child: Text('Create Contact'),
    );
  }
}
