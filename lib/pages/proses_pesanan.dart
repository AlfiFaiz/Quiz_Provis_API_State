import 'package:flutter/material.dart';
import 'package:api/pages/terima_kasih.dart';

class prosesPage extends StatelessWidget {
  final String accessToken;

  const prosesPage({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay navigation to terima kasih page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => terimakasi(accessToken: accessToken)),
      );
    });

    return Container(
      width: 400,
      height: 400,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 15,
            offset: Offset(0, 0),
            spreadRadius: -3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Pesanan Kamu Sedang Diproses!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          Image.asset(
            'assets/proses.png', // Ubah sesuai dengan nama dan path gambar
            width: 350,
            height: 250,
          ),
          Text(
            'Mohon untuk bersabar. Karena toko dan driver sedang mempersiapkan pesanan kamu!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            'assets/proses_bar.png', // Ubah sesuai dengan nama dan path gambar
            width: 650,
            height: 65,
          ),
        ],
      ),
    );
  }
}
