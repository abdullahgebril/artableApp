



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Cart.dart';
class CartItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final int qountity;

  CartItem(this.id,this.imageUrl,this.price,this.title,this.qountity);
  double total=0.0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    total +=price;
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),


            child: FittedBox(child: Image.network(imageUrl),fit: BoxFit.cover,),
          ),
          title: Row(
            children: <Widget>[
              Text(title,style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16
              ),),
              SizedBox(width: 12,),
              Text('\$${price *qountity}',style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16
              ),),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,color: Theme.of(context).errorColor,
            ),
            onPressed: ()=> showDialog(context: context,builder:(context)=>AlertDialog(
              title: Text('Are you sure!?'),
              content: Text('Do you want remove item from cart?'),
              actions: <Widget>[
                FlatButton(
                child: Text("NO"),
                onPressed: (){
                  Navigator.pop(context);
                },
            ),
              FlatButton(
                child: Text("Yes"),
                onPressed: (){
                  cart.removeItem(id);
                  Navigator.pop(context);
                },
                )
                ]
            ),
            )

        )
          )


        ),
      );


  }
}
