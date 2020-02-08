


import 'package:flutter/material.dart';


import '../widget/CartWidget.dart';
class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: CartWidget(),
    );
  }
}
