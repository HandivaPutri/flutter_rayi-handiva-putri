// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterChanged extends RegisterState {
  String username;
  String email;
  bool toogle;
  RegisterChanged({
    this.username = '',
    this.email = '',
    this.toogle = true,
  });

  @override
  List<Object> get props => [username, email, toogle];
}
