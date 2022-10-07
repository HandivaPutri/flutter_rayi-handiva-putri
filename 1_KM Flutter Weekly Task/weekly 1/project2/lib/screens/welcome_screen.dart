import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
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
                  color: Colors.grey),
            ),
            Text(
              'Makanan yang sehat, lezat dan bergizi',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 233, 136, 168),
                minimumSize: Size(240.0, 40.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                textStyle: GoogleFonts.poppins(
                  fontSize: 14.0,
                ),
                side: BorderSide(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            // Register
            ElevatedButton(
              onPressed: () {},
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Color.fromARGB(255, 233, 136, 168),
                minimumSize: Size(240.0, 40.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                textStyle: GoogleFonts.poppins(
                  fontSize: 14.0,
                ),
                side: BorderSide(color: Color.fromARGB(255, 233, 136, 168)),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
