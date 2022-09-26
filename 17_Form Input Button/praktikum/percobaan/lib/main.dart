import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTelp = TextEditingController();

  void kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: [
            Text("Nama : ${controllerNama.text}"),
            Text("No. Telp : ${controllerTelp.text}"),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: ((context) => alertDialog));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Contact"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
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
