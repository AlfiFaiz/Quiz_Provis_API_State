import 'package:api/pages/home.dart';
import 'package:flutter/material.dart';

class terimakasi extends StatelessWidget {
  final String accessToken;

  const terimakasi({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Terima Kasih!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          Image.network(
            'assets/terima_kasih.png', // Ubah sesuai dengan nama dan path gambar
            width: 350,
            height: 250,
          ),
          Text(
            'Pesananmu sudah diantar dengan selamat! Selamat menikmati pesanannya!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.network(
            'assets/terima_kasih_bar.png', // Ubah sesuai dengan nama dan path gambar
            width: 650,
            height: 65,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => home(accessToken: accessToken)),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Sudut yang dibulatkan
              ),
              padding: EdgeInsets.zero,
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF093128),
                    Color(0xFF667F3B),
                    Color(0xFFA4B938)
                  ], // Warna gradien
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8), // Sudut yang dibulatkan
              ),
              child: Container(
                constraints: BoxConstraints(
                    minWidth: 200, minHeight: 40), // Ukuran tombol
                alignment: Alignment.center,
                child: Text(
                  'Kembali ke Halaman Awal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
