import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/screens/register_screen.dart';
import 'package:register/providers/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  late SharedPreferences registerdata;
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User>(context);
    userProvider.initial();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<User>(
              builder: (BuildContext context, value, Widget? child) {
                return Text('Hello, ${value.username}');
              },
            ),
            Consumer<User>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(value.email);
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  userProvider.addBool(true);
                  userProvider.deleteName(username);
                  userProvider.deleteEmail(email);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
