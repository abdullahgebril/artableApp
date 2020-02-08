


import 'package:flutter/material.dart';
import '../model/Orders.dart';
import 'dart:math';
class OrderItem extends StatefulWidget {
  final orderitem order;
  OrderItem(this.order);
  @override
  _OrderItemState createState() => _OrderItemState();
}
class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
     bool expanded = false;
     return Card(
       elevation: 8,
       margin: EdgeInsets.all(10),
       child: Column(
         children: <Widget>[
           ListTile(
             title: Text('\$${widget.order.amounts}'),
             subtitle: Text(widget.order.dateTime.toString()),
             trailing: IconButton(
               icon: Icon(expanded ? Icons.expand_more: Icons.expand_less),
               onPressed: () {
                 setState(() {
                   expanded = !expanded;
                 });
               },
             ),
           ),
           SizedBox(height: 5,),
           if (expanded)
             Container(
                 color: Colors.teal,
                 height: min(widget.order.carts.length * 20.0 + 100, 180),
                 child: ListView(
                     children: widget.order.carts
                         .map((pro) => Row(

                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         Text(
                           pro.title,
                           style: TextStyle(
                               fontSize: 20,
                               color: Colors.white
                           ),
                         ),
                         Text('${pro.qountity}x \$${pro.price}',  style: TextStyle(
                             fontSize: 20,
                             color: Colors.white),
                         )],
                     ))
                         .toList())
             )],

       ),
     )
     ;
  }
}
