import 'package:flutter/material.dart';
import 'package:state_management_pro/Model/favorite.dart';

class Fav extends ChangeNotifier {
  List<Favorite> _Fav = [];

  void add(Favorite favorite) {
    _Fav.add(favorite);
    notifyListeners();
  }

  void remove(Favorite favorite) {
    _Fav.remove(favorite);
    notifyListeners();
  }

  int getcoutfav() {
    return _Fav.length;
  }

  List<Favorite> get checkfav {
    return _Fav;
  }
}
