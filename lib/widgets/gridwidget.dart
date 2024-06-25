
import 'package:flutter/material.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/widgets/itemdetail.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WidgetGrid extends StatelessWidget {
  const WidgetGrid({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,CartProvider,child){
      final coffe = CartProvider.items;
      return Scaffold(
        appBar: AppBar(title: Text("Coffee Shop",style: TextStyle(fontFamily: 'Lobster',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),),
        body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: coffe.length,
        itemBuilder: (context, index) {
          final item = coffe[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(item: item,),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            item.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ',decimalDigits: 0).format(item.price)}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      // color: Colors.red,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.withOpacity(0.8)),
                        onPressed: () {
                        
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Ditambahkan"),duration: Duration(milliseconds: 500),));
                          CartProvider.addItem(item);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_shopping_cart, size: 20,color: Colors.white,),
                            SizedBox(width: 4),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
            ),
      );
    });
  }
}

