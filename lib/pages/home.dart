import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void redirectTo(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

double defaultMargin = 40.0;
double defaultMarginHome = 18.0;

const Color primaryColor = Color.fromARGB(255, 242, 255, 242);
const Color darkPrimaryColor = Color.fromARGB(255, 0, 0, 0);
const Color alertColor = Color.fromARGB(255, 102, 127, 59);

TextStyle darkPrimaryTextStyle = GoogleFonts.grandstander(
  color: darkPrimaryColor,
);
TextStyle lightTextStyle = GoogleFonts.grandstander(
  color: primaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight bolder = FontWeight.w900;

Widget buildTextField({
  required String hint,
  required bool obscureText,
  required IconData prefixIcon,
  Color backgroundColor = Colors.white,
  Color iconColor = Colors.black,
  double fieldHeight = 48.0,
}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hint,
      fillColor: backgroundColor,
      filled: true,
      prefixIcon: IconTheme(
        data: IconThemeData(
          color: iconColor,
        ),
        child: Icon(prefixIcon),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: (fieldHeight - 48.0) / 2,
        horizontal: 12,
      ),
    ),
  );
}

Widget buildButton(BuildContext context, String title, VoidCallback onPressed,
    Color bgColor, Color txtColor) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.85,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: Color.fromARGB(255, 102, 127, 59)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: txtColor),
      ),
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key});

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  void _selectTab(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\nSelamat datang di\nGerum Food',
                        style: darkPrimaryTextStyle.copyWith(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 60),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      child: toko(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari Makanan/Minuman',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: alertColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.search, color: primaryColor),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        // redirectTo(context, "/pesan");
                      },
                      child: daftarmenu(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
        backgroundColor: alertColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class toko extends StatelessWidget {
  const toko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              child: Image.network(
                '../assets/toko.jpg', // Ganti dengan URL gambar Anda.
                height: 130,
                fit: BoxFit
                    .cover, // Agar gambar diisi dengan baik dalam ukuran yang tersedia.
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class daftarmenu extends StatelessWidget {
  const daftarmenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailmenu()),
        );
      },
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: Image.network(
                '../assets/ayam_geprek.png', // Ganti dengan URL gambar Anda.
                height: 130,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ayam geprek',
                    style: darkPrimaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: bold),
                  ),
                  Text(
                    'Deskripsi',
                    style: darkPrimaryTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class detailmenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: 375,
              height: 650,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFFF2FFF2)),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 74,
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.only(
                        top: 17,
                        left: 14,
                        right: 14,
                        bottom: 15,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15,
                            offset: Offset(0, 0),
                            spreadRadius: -3,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 181,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      '../assets/ayam_geprek.png'), // Ganti dengan path gambar Anda
                                  fit: BoxFit
                                      .cover, // Sesuaikan dengan kebutuhan Anda
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 298,
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.only(
                        top: 22,
                        left: 14,
                        right: 23,
                        bottom: 136,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15,
                            offset: Offset(0, 0),
                            spreadRadius: -3,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Ayam Geprek Gerum',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                const SizedBox(width: 42),
                                Text(
                                  'Rp.12.000,00.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'deskripsinya....',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21,
                    top: 32,
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'Ayam Geprek',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bawah(),
        ],
      ),
    );
  }
}

class bawah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 122,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 15,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 275.50,
                top: 122,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB3CAD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 284.50,
                top: 122,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB3CAD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 293.50,
                top: 122,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB3CAD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 302.50,
                top: 122,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB3CAD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 311.50,
                top: 122,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB3CAD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 40,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Harga',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Rp. 12.000,00.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 68),
                      TextButton(
                        onPressed: () {
                          // Tambahkan logika ketika tombol ditekan di sini
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: Color.fromARGB(255, 3, 107,
                                    7)), // Tambahkan border jika diperlukan
                          ),
                        ),
                        child: Text(
                          'Tambah Ke Keranjang',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
