part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoaded extends ContactState {
  var data = [];

  ContactLoaded({required this.data});
}
