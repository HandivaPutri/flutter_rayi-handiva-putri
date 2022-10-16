import 'package:register_bloc/bloc/register_bloc.dart';
import 'package:register_bloc/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Register Storage BLoC',
        routes: {
          '/': (context) => const RegisterScreen(),
          '/homepage': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
