import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project1/screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 2,
        title: Image.asset(
          'assets/images/altera.png',
          height: 100,
          width: 100,
        ),
      ),
      endDrawer: buildDrawer(),
      body: Container(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              buildContact(context),
              // buildElevated(),
              // buildCardItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('About Us'),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 20, 44, 230),
              minimumSize: Size(150.0, 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Contact Us'),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 20, 44, 230),
              minimumSize: Size(150.0, 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 20, 44, 230),
              minimumSize: Size(150.0, 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContact(BuildContext context) {
    return Column(
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
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  primary: Color.fromARGB(255, 20, 44, 230),
                ),
                onPressed: () {
                  setState(() {
                    formKey.currentState!.validate();
                  });
                  if (controllerNama.text.isEmpty ||
                      controllerEmail.text.isEmpty) {
                    return;
                  }
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.send,
                      size: 20,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AboutScreen(),
          ],
        ),
      ],
    );
  }
}
