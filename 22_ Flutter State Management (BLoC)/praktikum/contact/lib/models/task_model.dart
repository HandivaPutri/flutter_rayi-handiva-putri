import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class TaskModel extends Equatable {
  final String id;
  final String Name;
  final String Contact;

  TaskModel({
    required this.id,
    required this.Name,
    required this.Contact,
  });

  @override
  List<Object?> get props => [id, Name, Contact];
}
