/* 
'Mhs 1:  [2207045, MUHAMMAD ALFI FAIZ]'  
'Mhs 2:  [2206131,DEFRIZAL YAHDIYAN RISYAD]',
*/

import 'package:flutter/material.dart';
import 'package:api/pages/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void redirectTo(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

class masukPage extends StatefulWidget {
  @override
  _masukPageState createState() => _masukPageState();
}

class _masukPageState extends State<masukPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final url = Uri.parse('http://146.190.109.66:8000/login');
    final response = await http.post(
      url,
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Berhasil login
      final responseData = jsonDecode(response.body);
      final accessToken = responseData['access_token'];
      // Simpan token, arahkan ke halaman selanjutnya, dll.
      print('Access token: $accessToken');

      // Redirect ke halaman home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home(accessToken: accessToken)),
      );
    } else {
      // Gagal login
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['detail'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
            style: TextStyle(
              fontSize: 16,
              color:
                  Colors.black, // Sesuaikan dengan warna teks yang diinginkan
              fontWeight: FontWeight
                  .bold, // Sesuaikan dengan ketebalan teks yang diinginkan
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('../assets/gerum_text.png'),
            width: 300,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                SizedBox(height: 40),
                _buildTextField(
                  hint: 'Username',
                  obscureText: false,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hint: 'Password',
                  obscureText: true,
                  prefixIcon: Icons.lock,
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'belum punya akun?',
                    style: TextStyle(
                      color: Colors
                          .black, // Sesuaikan dengan warna teks yang diinginkan
                      fontWeight: FontWeight
                          .bold, // Sesuaikan dengan ketebalan teks yang diinginkan
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _buildButton(
                  context,
                  'MASUK',
                  () => _login(context),
                  // Sesuaikan dengan warna latar belakang tombol yang diinginkan
                  Colors.white,
                  Colors
                      .green, // Sesuaikan dengan warna teks tombol yang diinginkan
                ),
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

  Widget _buildTextField({
    required String hint,
    required bool obscureText,
    required IconData prefixIcon,
  }) {
    return TextField(
      controller: obscureText ? _passwordController : _usernameController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors
            .white, // Sesuaikan dengan warna latar belakang teks yang diinginkan
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black, // Sesuaikan dengan warna ikon yang diinginkan
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String title,
    VoidCallback onPressed,
    Color bgColor,
    Color txtColor,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // primary: bgColor, // Sesuaikan dengan warna latar belakang tombol yang diinginkan
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: txtColor), // Sesuaikan dengan warna teks yang diinginkan
        ),
      ),
    );
  }
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
