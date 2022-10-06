part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class addTask extends ContactEvent {
  TaskModel contact;

  addTask({required this.contact});
}

class deleteTask extends ContactEvent {}
