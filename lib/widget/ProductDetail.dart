



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/Product.dart';
import '../Constants.dart';
import 'package:provider/provider.dart';
import '../model/Cart.dart';
class ProductDetails extends StatelessWidget {

  final Product product;

  ProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    void keepShoping(){
      Navigator.pop(context);
    }
    void addToCart(){
      cart.addCartItem(product.productId, product.imageUrl,product.title, product.price);
      Navigator.pop(context);
    }


    final screenhieght = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(productDetailBackroundURL),fit: BoxFit.cover)
          ),
        ),

         Center(
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 200),
             child: Card(
               color: Colors.white.withOpacity(0.8),
               elevation: 5,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    height: screenhieght *0.3,
                    width: double.infinity,

                    child: Image.network(product.imageUrl,fit: BoxFit.cover,),

                  ),SizedBox(height: 5,),
                  Text(product.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(product.price.toString(),style: TextStyle(fontWeight: FontWeight.bold),),


                  SizedBox(height: 5,),

                  Align(alignment: Alignment.centerLeft,child: Text(product.description,style: TextStyle(
                    fontSize: 12,fontWeight: FontWeight.normal
                  ),)),
                  SizedBox(height: 5,),

                  RoundRaisedButton(addToCart,Color.fromRGBO(43,51,65,1),'Add to Cart'),
                  SizedBox(height: 10,),
                  RoundRaisedButton(keepShoping,Color.fromRGBO(213,100,80,1),'Keep shoping'),

                ],
        ),
             ),
           ),
         ),

      ],
    );
  }
}
class RoundRaisedButton extends StatelessWidget {
 final String title;
 final Color color;
 final Function onpressed;
 RoundRaisedButton(this.onpressed,this.color,this.title);
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10,right: 10),

      child: RaisedButton(
        onPressed: onpressed,

        color: color,
        child: Text(title,style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white
        ),),
      ),
    );
  }
}
