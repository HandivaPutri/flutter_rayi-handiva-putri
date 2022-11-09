import 'package:flutter/material.dart';
import 'package:pink_blue/model/sarapan_model.dart';
import 'package:pink_blue/providers/sarapan_view_model.dart';
import 'package:pink_blue/screen/resep_detail_screen.dart';
import 'package:provider/provider.dart';

class ResepSarapan extends StatefulWidget {
  const ResepSarapan({Key? key}) : super(key: key);

  @override
  State<ResepSarapan> createState() => _ResepSarapanState();
}

class _ResepSarapanState extends State<ResepSarapan> {
  @override
  void initState() {
    final sarapanProvider =
        Provider.of<ResepSarapanViewModel>(context, listen: false);
    sarapanProvider.getResepSarapan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sarapanProvider =
        Provider.of<ResepSarapanViewModel>(context, listen: true);

    final listSarapan = sarapanProvider.resepsarapan;
    final isLoading = sarapanProvider.state == ResepSarapanViewState.loading;
    final isError = sarapanProvider.state == ResepSarapanViewState.error;

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
                return _buildCard(listSarapan?.result?[index], context);
              },
              itemCount: listSarapan?.result?.length,
            ),
    );
  }

  Widget _buildCard(ResultSarapan? menu, context) {
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
              final tween = Tween(begin: (0.0), end: 1.0);
              return FadeTransition(
                opacity: animation.drive(tween),
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
