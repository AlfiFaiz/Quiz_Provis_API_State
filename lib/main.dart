/* 
'Mhs 1:  [2207045, MUHAMMAD ALFI FAIZ]'  
'Mhs 2:  [2206131,DEFRIZAL YAHDIYAN RISYAD]',
*/

import 'package:api/pages/daftar.dart';
import 'package:api/pages/home.dart';
import 'package:api/pages/masuk.dart';
import 'package:api/pages/terima_kasih.dart';
import 'package:api/pages/tolak.dart';
import 'package:api/welcome.dart';
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
        '/': (context) => WelcomeScreen(),
        '/masuk': (context) => masukPage(),
        '/daftar': (context) => daftarPage(),
        '/home': (context, {arguments}) => home(accessToken: arguments),
        '/terimakasi': (context, {arguments}) =>
            terimakasi(accessToken: arguments),
        '/tolak': (context) => tolak(),
      },
    );
  }
}
