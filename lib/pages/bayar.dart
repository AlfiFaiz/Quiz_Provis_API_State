import 'package:flutter/material.dart';
import 'package:api/pages/home.dart';
import 'package:api/pages/keranjang.dart';
import 'package:api/pages/terima_kasih.dart';

class PaymentPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final String accessToken; // Tambahkan parameter accessToken

  const PaymentPage(
      {Key? key, required this.cartItems, required this.accessToken})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int calculateTotalPrice() {
      int totalPrice = 0;
      for (var cartItem in cartItems) {
        totalPrice += cartItem.item.price * cartItem.quantity;
      }
      return totalPrice;
    }

    // Hitung total harga
    int totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar GoPay atau logo pembayaran lainnya
            Image.asset(
              '../assets/bayar.jpg', // Ganti dengan path gambar GoPay
              width: 300,
            ),
            SizedBox(height: 20),
            // Jumlah yang harus dibayar
            Text(
              'Total yang harus dibayar:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Rp $totalPrice',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          terimakasi(accessToken: accessToken)),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent, // Transparent background
                shadowColor: alertColor, // Shadow color
                elevation: 0, // No elevation
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
                  constraints: BoxConstraints(
                      minWidth: 200, minHeight: 40), // Button size
                  alignment: Alignment.center,
                  child: Text(
                    'BAYAR',
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
