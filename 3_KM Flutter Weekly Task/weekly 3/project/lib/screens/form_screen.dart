import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/models/user_model.dart';
import 'package:project/screens/user/user_view_model.dart';
import 'package:project/screens/user/user_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController textarea = TextEditingController();

  void showuserdialog(UserModel user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: ListView(
              children: [
                Text('Name: ${user.username}'),
                Text('Email: ${user.email}'),
                Text('Message: ${user.message}'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<UserViewModel>(context);
    return Form(
      key: formKey,
      // child: Padding(
      //   padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            color: Colors.grey,
            colorBlendMode: BlendMode.hue,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Contact Us',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              // Nama
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              // Email
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Input your email ';
                    }
                    return null;
                  },
                ),
              ),
              // Message
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: textarea,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 7,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          onPressed: () {
                            setState(() {
                              formKey.currentState!.validate();
                            });
                            if (controllerNama.text.isEmpty ||
                                controllerEmail.text.isEmpty ||
                                textarea.text.isEmpty) {
                              return;
                            }
                            final contactItem = UserModel(
                              username: controllerNama.text,
                              email: controllerEmail.text,
                              message: textarea.text,
                            );
                            showuserdialog(contactItem);
                            modelView.addUser(contactItem);
                          },
                          child: const Text(
                            'Submit',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserScreen()));
                        },
                        child: const Text(
                          'Data User',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      // ),
    );
  }
}
