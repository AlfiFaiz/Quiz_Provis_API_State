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

class masukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildLoginCard(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Selamat Datang Di',
              style: darkPrimaryTextStyle.copyWith(fontSize: 16),
            )),
        SizedBox(height: 8),
        Align(
            alignment: Alignment.centerLeft,
            child: Image(
              image: AssetImage("../assets/gerum_text.png"),
              width: 300,
            ))
      ],
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          // Wrap with Card widget
          elevation: 4, // Add elevation for shadow effect
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Container(
            padding: EdgeInsets.all(
                20), // Add padding for space between card edges and content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                SizedBox(height: 40),
                buildTextField(
                  hint: 'Username',
                  obscureText: false,
                  prefixIcon: Icons.email,
                  backgroundColor: primaryColor,
                ),
                SizedBox(height: 16),
                buildTextField(
                  hint: 'Password',
                  obscureText: true,
                  prefixIcon: Icons.lock,
                  backgroundColor: primaryColor,
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'belum punya akun?',
                    style: darkPrimaryTextStyle,
                  ),
                ),
                SizedBox(height: 16),
                buildButton(context, 'MASUK', () {
                  redirectTo(context, '/home');
                }, alertColor, primaryColor),
                SizedBox(height: 16),
                buildButton(context, 'DAFTAR', () {
                  redirectTo(context, '/daftar');
                }, Colors.transparent, alertColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
