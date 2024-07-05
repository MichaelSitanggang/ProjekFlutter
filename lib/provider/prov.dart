import 'package:flutter/foundation.dart';
import 'package:projek_berhasil/models/cart.dart';
import 'package:projek_berhasil/models/item.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _items = [
     Item(
      id: 1,
      name: 'Kopi Arabika + Pop Corn',
      description: 'Kopi Arabika Terbaik Dengan Paduan Pop Corn Yang Enak',
      price: 35000,
      imageUrl: 'assets/item1.jpg',
    ),
    Item(
      id: 2,
      name: 'Kopi Jahe',
      description: 'Kopi Dari Jahe Asli Dan Yang terbaik',
      price: 20000,
      imageUrl: 'assets/item2.jpg',
    ),
    Item(
      id: 3,
      name: 'Kopi Cappucino',
      description: 'Kopi Cappucino Dengan Rasa Ala Italiano',
      price: 30000,
      imageUrl: 'assets/kopi1.jpeg',
    ),
    Item(
      id: 4,
      name: 'Kopi Hitam Pahit',
      description: 'Kopi Hitam Dengan Rasa Yang Sangat Gurih',
      price: 10000,
      imageUrl: 'assets/kopi2.jpeg',
    ),
    Item(
      id: 5,
      name: 'Kopi Gula Aren Cokelat',
      description: 'Kopi Gula Aren Yang Dipadu Dengan Cokelat Asli',
      price: 37500,
      imageUrl: 'assets/kopi3.jpeg',
    ),
    Item(
      id: 6,
      name: 'Kopi Susu',
      description: 'Kopi Susu Yang Creamy Saat Diminum Dengan Santai',
      price: 25000,
      imageUrl: 'assets/kopi4.jpeg',
    ),
    Item(
      id: 7,
      name: 'Kopi Gula Aren + Susu',
      description: 'Kopi Gula Aren Yang Dipadu Dengan Susu Yang Creamy Cocok Buat Santai',
      price: 30000,
      imageUrl: 'assets/kopi5.jpeg',
    ),
    Item(
      id: 8,
      name: 'Kopi Gula Aren',
      description: 'Kopi Dengan Gula Aren Murni Tanpa Ada Campuran Yang Lain',
      price: 10000,
      imageUrl: 'assets/kopi6.jpeg',
    ),
  ];
  // item untuk barang
  List<Item> get items => _items;

  //untuk menampung item yg ditambahkan ke keranjang
  List<Chart> _chart = [];
  List<Chart> get chart => _chart;

  // list dan map untuk keranjang dan totalharga keseluruan
  List<Map<String, dynamic>> _checkoutHistory = [];
  List<Map<String, dynamic>> get checkoutHistory => _checkoutHistory;

  // menambah item dikeranjang kalau id nya sama maka qty bertmbh satu
  void addItem(Item item) {
    bool kondisi = false;
    for (var chartItem in _chart) {
      if (chartItem.item.id == item.id) {
        chartItem.quantity++;
        kondisi = true;
        break;
      }
    }
    if (!kondisi) {
      _chart.add(Chart(item: item));
    }
    notifyListeners();
  }

  //menghitung berapa barang yg ada di keranjang
  int get totalQuantity {
    return _chart.fold(0, (total, chartItem) => total + chartItem.quantity);
  }

  /// menghapus item dikeranjang
  void removeItem(Chart chartItem) {
    if (chartItem.quantity > 1) {
      chartItem.quantity--;
    } else {
      _chart.remove(chartItem);
    }
    notifyListeners();
  }

  //menghapus item keseluruan dikeranjang saat checkout
  void resetitem() {
    _chart.clear();
    notifyListeners();
  }

  /// total harga barang keseluruan
  double get totalPrice => _chart.fold(0, (total, chartItem) => total + (chartItem.item.price * chartItem.quantity));


  // mengambil item dari keranjang dan menampilkan pada history
  void checkout() {
    if (_chart.isNotEmpty) {
      _checkoutHistory.add({
        'chart': List<Chart>.from(_chart),
        'totalPrice': totalPrice,
      });
      resetitem();
    }
  }

  //menghapus item percard di history
  void removecheck(int index){
    if(index >= 0 && index < _checkoutHistory.length){
      _checkoutHistory.removeAt(index);
      notifyListeners();
    }
  }
}
