import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section26/screen/contact/contact_screen.dart';
import 'package:section26/screen/contact/contact_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactScreen(),
      ),
    ),
  );
}
