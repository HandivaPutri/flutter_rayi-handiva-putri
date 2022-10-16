import 'package:bloc/bloc.dart';
import 'package:register_bloc/screens/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterChanged()) {
    late SharedPreferences registerdata;
    late bool newUser;
    bool toogle = true;
    String username = '';
    String email = '';

    on<CheckUser>(
      (event, emit) async {
        if (state is RegisterChanged) {
          // final state = this.state as UserChanged;
          registerdata = await SharedPreferences.getInstance();
          newUser = registerdata.getBool('register') ?? true;
          if (newUser == false) {
            Navigator.pushAndRemoveUntil(
                event.context!,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false);
          }
          // print('Check User');
        }
      },
    );

    on<Initial>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          username = registerdata.getString('username').toString();
          email = registerdata.getString('email').toString();
          emit(RegisterChanged(username: username, email: email));
        }
      },
    );

    on<AddBool>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setBool('register', event.newUser);
        }
      },
    );

    on<AddName>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setString('username', event.username);
          print('Name Changed ${event.username}');
        }
      },
    );

    on<AddEmail>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setString('email', event.email);
          print('Email Changed ${event.email}');
        }
      },
    );

    on<RemoveName>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.remove('username');
          print('Name Deleted');
        }
      },
    );

    on<RemoveEmail>(
      (event, emit) async {
        if (state is RegisterChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.remove('email');
          print('Email Deleted');
        }
      },
    );

    on<ChangeUser>(
      (event, emit) {
        if (state is RegisterChanged) {
          final state = this.state as RegisterChanged;
          emit(RegisterChanged(toogle: toogle = !toogle));
        }
      },
    );
  }
}
