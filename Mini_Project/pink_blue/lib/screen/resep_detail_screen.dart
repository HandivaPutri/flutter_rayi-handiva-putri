import 'package:flutter/material.dart';
import 'package:pink_blue/providers/detail_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResepDetail extends StatefulWidget {
  final String gambar;
  final String waktu;
  final String judul;
  final String porsi;
  final String tingkat;
  final String kunci;

  const ResepDetail({
    required this.gambar,
    required this.waktu,
    required this.judul,
    required this.porsi,
    required this.tingkat,
    required this.kunci,
  });

  @override
  State<ResepDetail> createState() => _ResepDetailState();
}

class _ResepDetailState extends State<ResepDetail> {
  @override
  void initState() {
    final resepdetailProvider =
        Provider.of<DetailResepViewModel>(context, listen: false);
    resepdetailProvider.getDetailResep(widget.kunci);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resepdetailProvider =
        Provider.of<DetailResepViewModel>(context, listen: true);
    final bahan = Provider.of<DetailResepViewModel>(context);
    final langkah = Provider.of<DetailResepViewModel>(context);

    final listDetailResep = resepdetailProvider.resepdetail;

    final isLoading =
        resepdetailProvider.detail == DetailResepViewState.loading;
    final isError = resepdetailProvider.detail == DetailResepViewState.error;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 233, 136, 168),
                  Color.fromARGB(255, 84, 178, 255),
                ]),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Detail',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.only(left: 16.0.sp),
                  child: Text(
                    '${widget.judul}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                  ),
                  child: Hero(
                    tag: widget.gambar,
                    child: Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.sp),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.gambar),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //waktu
                      Icon(
                        Icons.access_time,
                        color: const Color(0xFFD17E50),
                        size: 16.sp,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        '${widget.waktu}',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF17532),
                        ),
                      ),
                      //porsi
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.restaurant_menu,
                        color: const Color(0xFFD17E50),
                        size: 16.sp,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        '${widget.porsi}',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF17532),
                        ),
                      ),
                      //tingkat
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.speed_outlined,
                        color: const Color(0xFFD17E50),
                        size: 16.sp,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        '${widget.tingkat}',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF17532),
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bahan : ',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                buildResepBahan(bahan),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Langkah : ',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                buildResepLangkah(langkah),
              ],
            ),
    );
  }

  Widget buildResepBahan(DetailResepViewModel detailResepViewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          detailResepViewModel.resepdetail!.resultdetail!.ingredient!.length,
          (index) => Column(
            children: [
              Text(
                detailResepViewModel
                    .resepdetail!.resultdetail!.ingredient![index],
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResepLangkah(DetailResepViewModel detailResepViewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          detailResepViewModel.resepdetail!.resultdetail!.step!.length,
          (index) => Column(
            children: [
              Text(
                detailResepViewModel.resepdetail!.resultdetail!.step![index],
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
