import 'package:flutter/material.dart';
import 'package:task/pages/contact_add.dart';
import './pages/contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final String parameter;
  // const MyApp({Key? key, required this.parameter}) : super(key: key);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // fungsi untuk menampilkan dan menghilangkan banner build sebelah kanan atas
      debugShowCheckedModeBanner: false,

      // Navigation dengan Named Routes
      // menentukan halaman yang pertama kali dibuka
      initialRoute: '/',
      routes: {
        '/': (context) => Contact(),
        '/contactadd': (context) => ContactAdd(),
      },
    );
  }
}
