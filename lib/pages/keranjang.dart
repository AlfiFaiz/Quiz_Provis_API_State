/* 
'Mhs 1:  [2207045, MUHAMMAD ALFI FAIZ]'  
'Mhs 2:  [2206131,DEFRIZAL YAHDIYAN RISYAD]',
*/

import 'package:flutter/material.dart';
import 'package:api/pages/bayar.dart'; // Sesuaikan dengan path yang benar
import 'package:api/pages/home.dart'; // Sesuaikan dengan path yang benar

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;
  final String accessToken; // Tambahkan parameter accessToken

  const CartPage({Key? key, required this.cartItems, required this.accessToken})
      : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeCartItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var cartItem in widget.cartItems) {
      totalPrice += cartItem.item.price * cartItem.quantity;
    }
    return totalPrice;
  }

  void navigateToPaymentPage() {
    if (calculateTotalPrice() > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            cartItems: widget.cartItems,
            accessToken: widget.accessToken,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Keranjang belanja masih kosong!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cartItems[index];
                return ListTile(
                  title: Text(
                    cartItem.item.title,
                    style: TextStyle(fontSize: 10),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.item.description,
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(height: 2), // Memberikan jarak antara teks
                      Text(
                        'Harga: Rp ${cartItem.item.price}',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  leading: Image.asset(
                    '../assets/${cartItem.item.imgName}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (cartItem.quantity > 1) {
                                  cartItem.quantity--;
                                }
                              });
                            },
                          ),
                          Text(cartItem.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                cartItem.quantity++;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              removeCartItem(index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Total Harga: Rp ${calculateTotalPrice()}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToPaymentPage();
        },
        label: Text('Pembayaran'),
        icon: Icon(Icons.payment),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
