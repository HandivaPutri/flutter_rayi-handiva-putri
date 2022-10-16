import 'package:register_bloc/bloc/register_bloc.dart';
import 'package:register_bloc/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  late SharedPreferences registerdata;
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = BlocProvider.of<RegisterBloc>(context);
    userProvider.add(Initial());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state is RegisterChanged) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, ${state.username}',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      state.email,
                      style: const TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userProvider.add(AddBool(newUser: true));
                        userProvider.add(RemoveName());
                        userProvider.add(RemoveEmail());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text('Sign Out'),
                    )
                  ],
                );
              }
              return const Text('Coba Lagi!');
            },
          ),
        ),
      ),
    );
  }
}
