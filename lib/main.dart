import 'package:api/pages/daftar.dart';
import 'package:api/pages/home.dart';
import 'package:api/pages/masuk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => masukPage(),
        '/masuk': (context) => masukPage(),
        '/daftar': (context) => daftarPage(),
        '/home': (context) => home(),
      },
    );
  }
}
