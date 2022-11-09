import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
        title: Text('FAQ'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.amber,
                  child: Text(
                    'Informasi Akun',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text('Bagaimana cara ingin membuat Akun Baru?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Untuk saat ini anda hanya dapat memasuki akun melalui login saja. ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.amber,
                  child: Text(
                    'Hubungi Kami',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text('Bagaimana saya dapat menghubungi Pink Blue?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Anda dapat mengirimkan email ke hallopinkblue@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
