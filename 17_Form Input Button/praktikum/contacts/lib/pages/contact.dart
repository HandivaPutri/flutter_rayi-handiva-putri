import 'package:flutter/material.dart';
import '../models/contact_model.dart';

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
        title: Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Text('+'),
        onPressed: () {},
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
    );
  }
}
