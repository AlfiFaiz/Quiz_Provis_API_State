import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class daftarPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final url = Uri.parse('http://146.190.109.66:8000/users/');
    final response = await http.post(
      url,
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Berhasil membuat akun
      final responseData = jsonDecode(response.body);
      final message = responseData['message'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.pushNamed(
                    context, '/masuk'); // Redirect ke halaman masuk
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Gagal membuat akun
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
          _buildRegisterCard(context),
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
            'Daftar Di',
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

  Widget _buildRegisterCard(BuildContext context) {
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
                SizedBox(height: 16),
                _buildButton(
                  context,
                  'KONFIRMASI',
                  () => _register(context),
                  Colors
                      .green, // Sesuaikan dengan warna latar belakang tombol yang diinginkan
                  Colors
                      .white, // Sesuaikan dengan warna teks tombol yang diinginkan
                ),
                SizedBox(height: 16),
                _buildButton(
                  context,
                  'RESET',
                  () {
                    // Tambahkan navigasi atau tindakan lainnya di sini
                  },
                  Colors
                      .transparent, // Sesuaikan dengan warna latar belakang tombol yang diinginkan
                  Colors
                      .green, // Sesuaikan dengan warna teks tombol yang diinginkan
                ),
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
