import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: GridView.count(
        //widget yang akan ditampilkan dalam 1 baris adalah 2
        crossAxisCount: 2,
        children: [
          //card ditampilkan disini
          //saya membuat custom card di bawah agar kodingan tidak terlalu panjang
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Image.network(
                      "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg");
                },
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.network(
                      "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg"),
                ),
              );
            },
            child: CustomCard(
                title: "Potret Alam Indah",
                image:
                    "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg"),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Image.network(
                      "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg");
                },
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.network(
                      "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
                ),
              );
            },
            child: CustomCard(
                title: "Wisata Alam",
                image:
                    "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Image.network(
                      "https://cdn.pixabay.com/photo/2016/11/29/02/23/cliffs-1866832__340.jpg");
                },
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.network(
                      "https://cdn.pixabay.com/photo/2016/11/29/02/23/cliffs-1866832__340.jpg"),
                ),
              );
            },
            child: CustomCard(
                title: "Tebing",
                image:
                    "https://cdn.pixabay.com/photo/2016/11/29/02/23/cliffs-1866832__340.jpg"),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Image.network(
                      "https://cdn.pixabay.com/photo/2016/09/18/23/23/sugarloaf-mountain-1679285__340.jpg");
                },
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.network(
                      "https://cdn.pixabay.com/photo/2016/09/18/23/23/sugarloaf-mountain-1679285__340.jpg"),
                ),
              );
            },
            child: CustomCard(
                title: "Tebing / Kereta Gantung",
                image:
                    "https://cdn.pixabay.com/photo/2016/09/18/23/23/sugarloaf-mountain-1679285__340.jpg"),
          ),
        ],
      ),
    );
  }
}

//membuat customcard yang bisa kita panggil setiap kali dibutuhkan
class CustomCard extends StatelessWidget {
  //ini adalah konstruktor, saat class dipanggil parameter konstruktor wajib diisi
  //parameter ini akan mengisi title dan gambar pada setiap card
  CustomCard({required this.title, required this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        //menambahkan bayangan
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
