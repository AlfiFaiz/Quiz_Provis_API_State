import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 242, 255, 242);
const Color darkPrimaryColor = Color.fromARGB(255, 0, 0, 0);
const Color alertColor = Color.fromARGB(255, 102, 127, 59);

TextStyle darkPrimaryTextStyle = GoogleFonts.grandstander(
  color: darkPrimaryColor,
);
TextStyle lightTextStyle = GoogleFonts.grandstander(
  color: primaryColor,
);

class Item {
  final int id;
  final String title;
  final String description;
  final String imgName;
  final int price;

  Item(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgName,
      required this.price});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imgName: json['img_name'],
      price: json['price'],
    );
  }
}

class home extends StatefulWidget {
  final String accessToken;

  home({required this.accessToken});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(
      Uri.parse('http://146.190.109.66:8000/items/'),
      headers: {'Authorization': 'Bearer ${widget.accessToken}'},
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        items =
            responseData.map((itemJson) => Item.fromJson(itemJson)).toList();
      });
    } else {
      // Handle error
    }
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index].title),
                          subtitle: Text(items[index].description),
                          leading: Image.asset(
                            '../assets/${items[index].imgName}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          trailing: Text('\Rp${items[index].price.toString()}'),
                        );
                      },
                    ),
                  ),
                  // Akhir daftar item
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
