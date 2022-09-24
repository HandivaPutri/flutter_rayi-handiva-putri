import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Wrap(
              direction: Axis.vertical,
              children: [
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Alterra Academy',
                  errorBuilder: (context, error) => Center(child: Text(error)),
                ),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Flutter Asik',
                  errorBuilder: (context, error) => Center(child: Text(error)),
                ),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Rayi Handiva Putri',
                  errorBuilder: (context, error) => Center(child: Text(error)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
