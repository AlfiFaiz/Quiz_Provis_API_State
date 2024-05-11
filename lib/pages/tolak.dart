/* 
'Mhs 1:  [2207045, MUHAMMAD ALFI FAIZ]'  
'Mhs 2:  [2206131,DEFRIZAL YAHDIYAN RISYAD]',
*/

import 'package:flutter/material.dart';

class tolak extends StatelessWidget {
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
            'Mohon Maaf Pesananmu Ditolak!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          Image.network(
            '../assets/tolak.png',
            width: 350,
            height: 250,
          ),
          Text(
            'Karena toko sedang sibuk terlalu banyak pesanan atau kehabisan stok bahan.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.network(
            '../assets/tolak_bar.png',
            width: 650,
            height: 65,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => home()),
              // );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
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
                  ], // Gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Container(
                constraints:
                    BoxConstraints(minWidth: 200, minHeight: 40), // Button size
                alignment: Alignment.center,
                child: Text(
                  'Kembali ke Halaman Awal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, // Text color
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
