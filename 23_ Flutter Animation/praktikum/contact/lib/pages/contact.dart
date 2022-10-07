import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import 'package:contact/pages/contact_add.dart';

class Contact extends StatelessWidget {
  final data = [
    ContactModel(
      id: "1",
      Name: "Jojo",
      Contact: "082134567321",
    ),
    ContactModel(
      id: "2",
      Name: "Snowy",
      Contact: "087889763422",
    ),
    ContactModel(
      id: "3",
      Name: "Bocil",
      Contact: "085678343576",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 8,
            child: ListTile(
              title: Text(
                data[i].Name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('No. Telp: ${data[i].Contact}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return ContactAdd();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Transition
                // final tween = Tween(begin: Offset(0, .5), end: Offset.zero);
                // return SlideTransition(
                //   position: animation.drive(tween),
                //   child: child,
                // );
                // Fade Transition
                // final tween = Tween(begin: (0.0), end: 1.0);
                // return FadeTransition(
                //   opacity: animation.drive(tween),
                //   child: child,
                // );
                // Scale Transition
                final tween = Tween(begin: (0.0), end: 1.0);
                return ScaleTransition(
                  scale: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
