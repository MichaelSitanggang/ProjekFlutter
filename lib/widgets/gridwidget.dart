import 'package:flutter/material.dart';
import 'package:projek_berhasil/models/tema.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/widgets/akun.dart';
import 'package:projek_berhasil/widgets/itemdetail.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WidgetGrid extends StatefulWidget {
  @override
  State<WidgetGrid> createState() => _WidgetGridState();
}

class _WidgetGridState extends State<WidgetGrid> {
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, ThemeProvider>(
      builder: (context, cartProvider, themeProvider, child) {
        final coffe = cartProvider.items;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Coffee Shop",
              style: TextStyle(
                fontFamily: 'Lobster',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AkunWidget()),
                  );
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mode",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Switch(
                                  value: themeProvider.isDarkMode,
                                  onChanged: (value) {
                                    themeProvider.tomboltema();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
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
                            builder: (context) =>
                                ItemDetailScreen(item: item),
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
                                      coffe[index].imageUrl,
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
                                "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(item.price)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.brown.withOpacity(0.8),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text("Berhasil Ditambahkan"),
                                        duration:
                                            Duration(milliseconds: 500),
                                      ),
                                    );
                                    cartProvider.addItem(item);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_shopping_cart,
                                          size: 20, color: Colors.white),
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
      },
    );
  }
}
