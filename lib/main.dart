import 'package:flutter/material.dart';
import 'pages/register.dart'; // Import halaman register
import 'pages/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SplashPage(),

    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke halaman Register setelah 10 detik
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Register()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Warna biru tua untuk latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/megaphone.png', // Ganti dengan path gambar megaphone
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Lapor Yuk!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white, // Warna teks putih agar kontras
              ),
            ),
          ],
        ),
      ),
    );
  }
}
