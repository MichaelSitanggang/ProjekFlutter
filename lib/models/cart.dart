import 'package:projek_berhasil/models/item.dart';

class Chart {
  final Item item;
  int quantity;

  Chart({
    required this.item,
    this.quantity = 0,
  });
  double get totalHarga => item.price * quantity;
}
