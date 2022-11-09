import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 233, 136, 168),
                  Color.fromARGB(255, 84, 178, 255),
                ]),
          ),
        ),
        title: Text('Tentang Kami'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/image/logo.png'),
                height: 100,
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              Text(
                  'Pink Blue merupakan salah satu komunitas masak global untuk mencari dan menelusuri berbagai resep masakan rumahan setiap hari. Masak sehari-hari semakin mudah dan menyenangkan dikarenakan terdapat berbagai kategori yang bisa memudahkan anda dalam pencarian.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}
