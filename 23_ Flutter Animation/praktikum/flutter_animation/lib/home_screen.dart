import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBig = !isBig;
                });
              },
              child: Text('Resize'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              width: isBig ? 200 : 100,
              height: isBig ? 200 : 100,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              width: isBig ? 200 : 100,
              height: isBig ? 200 : 100,
              color: Colors.pinkAccent,
              duration: Duration(milliseconds: 300),
            )
          ],
        ),
      ),
    );
  }
}
