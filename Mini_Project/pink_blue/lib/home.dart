import 'package:flutter/material.dart';
import 'package:pink_blue/providers/login_view_model.dart';
import 'package:pink_blue/screen/login_screen.dart';
import 'package:pink_blue/screen/resep_screen.dart';
import 'package:pink_blue/widget/navbar_widget.dart';
import 'package:provider/provider.dart';

import 'screen/kategori_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String email = '';
    final loginProvider = Provider.of<LoginViewModel>(context);
    loginProvider.initial();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 233, 136, 168),
                  Color.fromARGB(255, 84, 178, 255),
                ]),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Pink Blue',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.output,
              color: Color(0xFF545D68),
            ),
            onPressed: () {
              loginProvider.addBool(true);
              loginProvider.deleteName(username);
              loginProvider.deleteEmail(email);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 160.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                Resep(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => KategoriScreen()));
        },
        backgroundColor: Color.fromARGB(255, 233, 136, 168),
        child: const Icon(Icons.fastfood_outlined),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
