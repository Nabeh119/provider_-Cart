import 'package:flutter/material.dart';
import 'package:state_management_pro/Model/item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];

  double price = 0.0;

  void add(Item item) {
    // print("item added");
    _items.add(item);
    price += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return price;
  }

  List<Item> get basketItem {
    return _items;
  }
}
