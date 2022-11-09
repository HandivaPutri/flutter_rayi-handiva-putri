import 'package:flutter/material.dart';
import 'package:pink_blue/screen/resep_dessert.dart';
import 'package:pink_blue/screen/sarapan_screen.dart';

class KategoriScreen extends StatefulWidget {
  const KategoriScreen({super.key});

  @override
  State<KategoriScreen> createState() => _KategoriState();
}

class _KategoriState extends State<KategoriScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 16.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Color.fromARGB(255, 84, 178, 255),
              labelColor: Color.fromARGB(255, 233, 136, 168),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 24),
              unselectedLabelColor: const Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    'Dessert',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Breakfast',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ]),
          SizedBox(
            height: MediaQuery.of(context).size.height - 160.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                ResepDessert(),
                ResepSarapan(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
