import 'package:flutter/material.dart';
import 'package:projek_berhasil/models/item.dart';
import 'package:projek_berhasil/widgets/gridwidget.dart';

class ItemGrid extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Kopi Arabika + Pop Corn',
      description: 'Kopi Arabika Terbaik Dengan Paduan Pop Corn Yang Enak ',
      price: 35000,
      imageUrl: 'assets/item1.jpg',
    ),
    Item(
      name: 'Kopi Jahe',
      description: 'Kopi Dari Jahe Asli Dan Yang terbaik',
      price: 20000,
      imageUrl: 'assets/item2.jpg',
    ),
    Item(
      name: 'Kopi Cappucino',
      description: 'Kopi Cappucino Dengan Rasa Ala Italiano',
      price: 30000,
      imageUrl: 'assets/kopi1.jpeg',
    ),
    Item(
      name: 'Kopi Hitam Pahit',
      description: 'Kopi Hitam Dengan Rasa Yang Sangat Gurih',
      price: 10000,
      imageUrl: 'assets/kopi2.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren Cokelat',
      description: 'Kopi Gula Aren Yang Dipadu Dengan Cokelat Asli',
      price: 37500,
      imageUrl: 'assets/kopi3.jpeg',
    ),
    Item(
      name: 'Kopi Susu',
      description: 'Kopi Susu Yang Creamy Saat Diminum Dengan Santai',
      price: 25000,
      imageUrl: 'assets/kopi4.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren + Susu',
      description: 'Kopi Gula Aren Yang Dipadu Dengan Susu Yang Creamy Cocok Buat Santai',
      price: 30000,
      imageUrl: 'assets/kopi5.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren',
      description: 'Kopi Dengan Gula Aren Murni Tanpa Ada Campuran Yang Lain',
      price: 10000,
      imageUrl: 'assets/kopi6.jpeg',
    ),
  ];
  final TextStyle font = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: 
      AppBar(
        leading: Container(),
        title: 
        Text(
          "Home",
          style: font,
        ),
      ),
      body: WidgetGrid(items: items),
    );
  }
}

