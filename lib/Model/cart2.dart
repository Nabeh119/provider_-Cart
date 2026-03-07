import 'package:flutter/material.dart';
import 'package:state_management_pro/Model/item2.dart';

class Cart2 extends ChangeNotifier {
  List<Item2> _item2 = [];

  double price = 0.0;

  void add2(Item2 item2) {
    _item2.add(item2);
    price += item2.price;
    notifyListeners();
  }

  void remove2(Item2 item2) {
    _item2.remove(item2);
    price -= item2.price;
    notifyListeners();
  }

  int getCount2() {
    return _item2.length;
  }

  double totalPrice() {
    return price;
  }

  List<Item2> get basketItem2 {
    return _item2;
  }
}
