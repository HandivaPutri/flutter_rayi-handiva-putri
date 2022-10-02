import 'package:flutter/material.dart';

class ContactAdd extends StatefulWidget {
  @override
  _ContactAddState createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTelp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: controllerTelp,
                  decoration: InputDecoration(
                    hintText: "No. Telp",
                    labelText: "No. Telp",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
