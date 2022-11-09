import 'package:flutter/material.dart';
import 'package:pink_blue/model/dessert_model.dart';
import 'package:pink_blue/providers/dessert_view_model.dart';
import 'package:pink_blue/screen/resep_detail_screen.dart';
import 'package:provider/provider.dart';

class ResepDessert extends StatefulWidget {
  const ResepDessert({Key? key}) : super(key: key);

  @override
  State<ResepDessert> createState() => _ResepState();
}

class _ResepState extends State<ResepDessert> {
  @override
  void initState() {
    final dessertProvider =
        Provider.of<ResepDessertViewModel>(context, listen: false);
    dessertProvider.getDessertResep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dessertProvider =
        Provider.of<ResepDessertViewModel>(context, listen: true);

    final listDessert = dessertProvider.resepdessert;
    final isLoading = dessertProvider.dessert == ResepDessertViewState.loading;
    final isError = dessertProvider.dessert == ResepDessertViewState.error;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFCFAF8),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                return _buildCard(listDessert?.results?[index], context);
              },
              itemCount: listDessert?.results?.length,
            ),
    );
  }

  Widget _buildCard(ResultsDessert? menu, context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return ResepDetail(
                gambar: menu!.thumb!,
                waktu: menu.times!,
                judul: menu.title!,
                porsi: menu.serving!,
                tingkat: menu.difficulty!,
                kunci: menu.key!,
              );
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: Offset(0, .5), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(menu!.thumb!),
                  scale: 10,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              menu.title!,
              maxLines: 10,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: const Color(0xFFEBEBEB),
                height: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: const Color(0xFFD17E50),
                        size: 16,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        menu.times!,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        color: const Color(0xFFD17E50),
                        size: 16,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        menu.serving!,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.speed_outlined,
                        color: const Color(0xFFD17E50),
                        size: 16,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        menu.difficulty!,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
