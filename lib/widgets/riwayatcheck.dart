import 'package:flutter/material.dart';
import 'package:projek_berhasil/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:projek_berhasil/provider/prov.dart';

class CheckoutHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutHistory = cartProvider.checkoutHistory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Checkout'),
        backgroundColor: Colors.brown,
      ),
      body: checkoutHistory.isEmpty
          ? Center(
              child: Text('Tidak ada riwayat checkout.'),
            )
          : ListView.builder(
              itemCount: checkoutHistory.length,
              itemBuilder: (context, index) {
                final checkout = checkoutHistory[index];
                final totalPrice = checkout['totalPrice'];
                final chartItems = checkout['chart'] as List<Chart>;

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Checkout ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.removecheck(index);
                              },
                            ),
                          ],
                        ),
                        ...chartItems.map((cartItem) {
                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  cartItem.item.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(cartItem.item.name),
                            subtitle: Text(
                              "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(cartItem.totalHarga)} x ${cartItem.quantity}",
                            ),
                          );
                        }).toList(),
                        SizedBox(height: 8),
                        Container(
                          margin: EdgeInsets.only(left: 270),
                          child: Text(
                            '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(totalPrice)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
