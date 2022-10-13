import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/screens/home_screen.dart';
import 'package:register/screens/register_screen.dart';
import 'package:register/providers/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Register Storage',
        routes: {
          '/': (context) => const RegisterScreen(),
          '/homepage': (context) => HomeScreen(),
        },
      ),
    );
  }
}
