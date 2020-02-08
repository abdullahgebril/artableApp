



import 'package:flutter/material.dart';
import '../widget/ProductDetail.dart';
import '../model/DummyData.dart';
import 'package:provider/provider.dart';
class ProductDetailsScreen extends StatelessWidget {
  final String id;
  ProductDetailsScreen(this.id);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Dummydata>(context).products;
    final selectedProduct = products.firstWhere((pro) {return pro.productId == id;});
    return Scaffold(
      body: ProductDetails(selectedProduct) ,
    );
  }
}
