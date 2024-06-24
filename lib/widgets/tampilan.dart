import 'package:flutter/material.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/widgets/gridwidget.dart';
import 'package:provider/provider.dart';

class ItemGrid extends StatelessWidget {
  final TextStyle font = TextStyle(fontWeight: FontWeight.w900, fontSize: 25,fontFamily: 'Roboto');
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CartProvider>(context);
    final items = item.items;
    return Scaffold(
      
      appBar: 
      AppBar(
        leading: Container(),
        title: Text("Coffe Shop",
          style: font,
        ),backgroundColor: Colors.brown,
      ),
      body: WidgetGrid(items: items ),
    );
  }
}

