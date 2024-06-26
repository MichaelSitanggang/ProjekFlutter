import 'package:flutter/material.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final chart = Provider.of<CartProvider>(context);
    final charts = chart.chart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: charts.length,
              itemBuilder: (context, index) {
                final cartItem = charts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              cartItem.item.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cartItem.item.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                cartItem.item.description,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(cartItem.totalHarga)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "x${cartItem.quantity.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                chart.removeItem(cartItem);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.brown,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(chart.totalPrice)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder:(context) {
                      return AlertDialog(
                        title: Center(child: Text("Checkout",style: TextStyle(fontWeight: FontWeight.bold),)),
                        content: Text("Apakah Anda yakin ingin memesan semua produk ini ?"),
                        actions: [
                          TextButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${chart.totalQuantity} Barang Berhasil Di Checkout"),duration: Duration(seconds: 5),));
                            Navigator.pop(context);
                            // chart.resetitem();
                            chart.checkout();
                          }, child: Text("Ya",style: TextStyle(color: Colors.black))),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Tidak",style: TextStyle(color: Colors.black),))
                        ]
                          
                      );
                    },);
                },
                child: Text(
                  'Checkout (${chart.totalQuantity})',
                  style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
