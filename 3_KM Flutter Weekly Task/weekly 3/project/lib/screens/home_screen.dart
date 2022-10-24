import 'package:flutter/material.dart';
import 'package:project/screens/about_screen.dart';
import 'package:project/screens/form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        child: ListView(
          children: [
            FormScreen(),
            AboutScreen(),
          ],
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
}
