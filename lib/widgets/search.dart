import 'package:flutter/material.dart';
import 'package:projek_berhasil/models/item.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/widgets/itemdetail.dart';
import 'package:provider/provider.dart';

class SearchGrid extends StatefulWidget {
  @override
  _SearchGridState createState() => _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
  
 
  TextEditingController searchController = TextEditingController();
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CartProvider>(context);
    final items = item.items;
    List<Item> filteredItems = searchKeyword.isEmpty? items.take(4).toList() : items.where((item) =>item.name.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
    // ? []
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Coffe Cappucino',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  searchKeyword = value;
                });
              },
            ),
          ),
        ),
      ),
      body: filteredItems.isEmpty? Center(child: Text('Tidak ada item yang ditemukan'))
      :
      GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
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
                            'Rp ${item.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.withOpacity(0.8)),
                              onPressed: () {
                                context.read<CartProvider>().addItem(item);
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
  }
}
