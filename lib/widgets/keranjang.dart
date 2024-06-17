import 'package:flutter/material.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context); // Mengambil CartProvider

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final item = cartProvider.items[index];
                return ListTile(
                  leading: Image.asset(
                    item.imageUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('Rp ${item.price.toStringAsFixed(0)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {     
                      showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Konfirmasi Penghapusan'),
                        content: Text('Anda yakin ingin Menghapus ?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              cartProvider.removeItem(item);
                              Navigator.pop(context);
                            },
                            child: Text('Ya'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: Text('Batal'),
                          ),
                        ],
                      ),
                    );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.deepOrange,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Harga: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp ${cartProvider.totalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
            
            Container(
              margin: EdgeInsets.only(left: 280,bottom: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange.withOpacity(0.8)),
                onPressed: () {
                   showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Konfirmasi Pembelian'),
                            content: Text('Anda yakin ingin menyelesaikan pembelian?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Di CheckOut"),duration: Duration(milliseconds: 1500),));
                                  Navigator.pop(context); 
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                  Navigator.pushReplacementNamed(context, '/order-success');
                                },
                                child: Text('Ya'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Tutup dialog
                                },
                                child: Text('Batal'),
                              ),
                            ],
                          ),
                        );
                  // Logika untuk proses checkout
                },
                child: Text('CheckOut',style: TextStyle(color: Colors.black),),
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

