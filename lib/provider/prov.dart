import 'package:flutter/foundation.dart';
import 'package:projek_berhasil/models/item.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (total, current) => total + current.price);
}
