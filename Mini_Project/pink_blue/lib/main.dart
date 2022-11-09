import 'package:flutter/material.dart';
import 'package:pink_blue/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_blue/providers/dessert_view_model.dart';
import 'package:pink_blue/providers/detail_view_model.dart';
import 'package:pink_blue/providers/login_view_model.dart';
import 'package:pink_blue/providers/sarapan_view_model.dart';
import 'package:pink_blue/screen/kategori_screen.dart';
import 'package:pink_blue/screen/login_screen.dart';
import 'package:pink_blue/providers/resep_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ResepViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailResepViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResepDessertViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResepSarapanViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pink Blue',
            theme: ThemeData(
              primarySwatch: Colors.pink,
            ),
            initialRoute: '/',
            routes: {
              '/': (_) => const LoginScreen(),
              '/home': (_) => const Home(),
              '/kategori': (_) => const KategoriScreen(),
            },
          );
        },
      ),
    );
  }
}
