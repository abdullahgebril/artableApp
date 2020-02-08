


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Orders.dart';
import '../widget/OrderItemWidget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(itemCount: orders.items.length,itemBuilder:(context,i)=>OrderItem(orders.items[i])),
    );
  }
}
