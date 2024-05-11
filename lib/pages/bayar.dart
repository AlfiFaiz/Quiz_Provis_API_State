import 'package:flutter/material.dart';
import 'package:api/pages/home.dart';
import 'package:api/pages/keranjang.dart';

void redirectTo(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

class PaymentPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const PaymentPage({Key? key, required this.cartItems}) : super(key: key);

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
            SizedBox(height: 20),
            buildButton(context, 'BAYAR', () {
              redirectTo(context, '/proses');
            }, Colors.transparent, alertColor),
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
