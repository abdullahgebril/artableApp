


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/DummyData.dart';
import '../widget/ProductItem.dart';
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Dummydata>(context);
    final favproducts =product.favorits;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favorite'
        ),

      ),

    );
  }
}
