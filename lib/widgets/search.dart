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
  final List<Item> items = [
    Item(
      name: 'Kopi Arabika + Poc Corn',
      description: 'Kopi arabika terbaik',
      price: 35000,
      imageUrl: 'assets/item1.jpg',
    ),
    Item(
      name: 'Kopi Jahe',
      description: 'Kopi Jahe terbaik',
      price: 20000,
      imageUrl: 'assets/item2.jpg',
    ),
    Item(
      name: 'Kopi Cappucino',
      description: 'Kopi arabika terbaik',
      price: 30000,
      imageUrl: 'assets/kopi1.jpeg',
    ),
    Item(
      name: 'Kopi Hitam Pahit',
      description: 'Kopi arabika terbaik',
      price: 10000,
      imageUrl: 'assets/kopi2.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren Cokelat',
      description: 'Kopi arabika terbaik',
      price: 37500,
      imageUrl: 'assets/kopi3.jpeg',
    ),
    Item(
      name: 'Kopi Susu',
      description: 'Kopi arabika terbaik',
      price: 25000,
      imageUrl: 'assets/kopi4.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren + Susu',
      description: 'Kopi arabika terbaik',
      price: 30000,
      imageUrl: 'assets/kopi5.jpeg',
    ),
    Item(
      name: 'Kopi Gula Aren',
      description: 'Kopi arabika terbaik',
      price: 100000,
      imageUrl: 'assets/kopi6.jpeg',
    ),
  ];

  TextEditingController searchController = TextEditingController();
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    List<Item> filteredItems = searchKeyword.isEmpty
        ? items.take(4).toList() 
        // ? []
        : items
            .where((item) =>
                item.name.toLowerCase().contains(searchKeyword.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Cari Item',
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
      body: filteredItems.isEmpty
          ? Center(child: Text('Tidak ada item yang ditemukan'))
          : GridView.builder(
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
                builder: (context) => ItemDetailScreen(item: item),
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
                              onPressed: () {
                                context.read<CartProvider>().addItem(item);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_shopping_cart, size: 20),
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