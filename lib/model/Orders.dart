





import 'package:flutter/cupertino.dart';

import 'Cart.dart';
class orderitem {
  final String id;
  final DateTime dateTime;
  final List<Cartitem> carts;
  final double amounts;
  orderitem(this.id,this.dateTime,this.amounts,this.carts);
}







class Orders with ChangeNotifier {
  
  List<orderitem> _items= [];
  
  List<orderitem> get items {
    return [..._items];
  }
  
  void addOrder(List<Cartitem> carts , double total) {
    _items.insert(0, orderitem(DateTime.now().toString(), DateTime.now(), total, carts));
    notifyListeners();
  }
}