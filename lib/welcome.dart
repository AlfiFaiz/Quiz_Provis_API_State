import 'package:flutter/material.dart';
import 'main.dart'; // Import HomeScreen from main.dart

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation for 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to HomeScreen defined in main.dart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF17C688), Color(0xFF0A6D49)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 215, // Setengah dari lebar layar dikurangi setengah dari lebar container (430/2)
              top: MediaQuery.of(context).size.height / 2 - 466, // Setengah dari tinggi layar dikurangi setengah dari tinggi container (932/2)
              child: Container(
                width: 430, // Lebar container
                height: 932, // Tinggi container
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center, // Posisi teks di tengah secara vertikal
                  crossAxisAlignment: CrossAxisAlignment.center, // Posisi teks di tengah secara horizontal
                  children: [
                    Text(
                      'Selamat Datang di',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Grandstander',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Gerum Food',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFCD4D),
                        fontSize: 64,
                        fontFamily: 'Grandstander',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.64,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
