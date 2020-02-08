







import 'package:flutter/material.dart';

class Cartitem{
  final String id;
  final imageUrl;
  final String title;
  final int qountity;
  final double price;
  Cartitem(this.id,this.imageUrl,this.title,this.price,this.qountity);
}











class Cart with ChangeNotifier {

  final Map<String, Cartitem> _items = {};

  Map<String, Cartitem> get items {
    return {..._items};
  }

  void addCartItem(String productId,String imageUrl, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (exitingValue) =>
          Cartitem(exitingValue.id, exitingValue.imageUrl,exitingValue.title, exitingValue.price,
              exitingValue.qountity + 1));
    } else {
      _items.putIfAbsent(productId, ()=>Cartitem(DateTime.now().toString(),imageUrl,title,price,1));

    }
    notifyListeners();
  }

  double get totalAmount{
    double total = 0.0;
    _items.forEach((key,CartItem){
      total += CartItem.price* CartItem.qountity;
    });
    return total;
  }

  void removeSingleItem(String productid) {
    if(!_items.containsKey(productid)) {
      return;
    }
    if(_items[productid].qountity>1) {
      _items.update(productid, (existingproduct)=>Cartitem(existingproduct.id, existingproduct.imageUrl,existingproduct.title, existingproduct.price,
          existingproduct.qountity -1));
    }
    else {
      _items.remove(productid);
    }
  }
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}