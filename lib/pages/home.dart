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
  int _selectedIndex = 0;
  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    return Card(
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
              '../assets/ayam_geprek.png', // Replace with your image URL.
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
                  'Deskrips',
                  style: darkPrimaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
