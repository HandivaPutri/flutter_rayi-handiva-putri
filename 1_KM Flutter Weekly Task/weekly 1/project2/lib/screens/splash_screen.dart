import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 233, 136, 168),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ganti dengan image
              Image.asset(
                'assets/logo.png',
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 25,
              ),
              //ubah styling teks, dan gunakan google fonts
              Text(
                'Pink Blue',
                style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Makanan yang sehat, lezat dan bergizi',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
