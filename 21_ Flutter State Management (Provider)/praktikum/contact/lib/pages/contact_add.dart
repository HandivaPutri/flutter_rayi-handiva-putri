import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:contact/pages/contact.dart';

class ContactAdd extends StatefulWidget {
  @override
  _ContactAddState createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {
  var item;
  String _taskName = '';

  final formKey = GlobalKey<FormState>();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTelp = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerNama.addListener(() {
      setState(() {
        _taskName = controllerNama.text;
      });
    });
  }

  @override
  void dispose() {
    controllerNama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerNama,
                    decoration: InputDecoration(
                      hintText: "Nama",
                      labelText: "Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    controller: controllerTelp,
                    decoration: InputDecoration(
                      hintText: "No. Telp",
                      labelText: "No. Telp",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Phone Number';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  buildButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: () {
        setState(() {
          formKey.currentState!.validate();
        });
        if (controllerNama.text.isEmpty || controllerTelp.text.isEmpty) {
          return;
        }
        Navigator.pop(context);
      },
      child: Text('Create Contact'),
    );
  }
}
