




import 'package:flutter/cupertino.dart';

class  Product with ChangeNotifier{
  final String productId;
  final String title;
   final String categoryId;
  final String imageUrl;
  bool isFavorite;
  final double price;
  final description;
  Product({
    this.productId,this.categoryId,this.title,this.price,this.imageUrl,this.isFavorite =false,this.description
});



  void toggleFavoirte(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

}