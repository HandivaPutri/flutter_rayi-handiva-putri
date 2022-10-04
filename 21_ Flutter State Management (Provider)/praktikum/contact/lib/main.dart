import 'package:flutter/material.dart';
import 'package:contact/pages/contact_add.dart';
import './pages/contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
