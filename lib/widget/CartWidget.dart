import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Cart.dart';
import '../widget/CartItem.dart';
import '../screen/paymentMethod.dart';
import '../model/Orders.dart';
import '../screen/OrdersScreen.dart';
class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final order = Provider.of<Orders>(context);

    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items;
    double totalAmountofEachProduct = 0.0;
    totalAmountofEachProduct += cart.totalAmount;

    const double fees = 1.40;
    double total = 0.0;
    double gettotal() {
      total = totalAmountofEachProduct + fees;
      return total;
    }

    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, i) => CartItem(
                cartItems.keys.toList()[i],
                  cartItems.values.toList()[i].imageUrl,
                  cartItems.values.toList()[i].price,
                  cartItems.values.toList()[i].title,
                  cartItems.values.toList()[i].qountity)),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'payment Method',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectPaymentMethod()));

                      },
                      child: Container(
                        child: Text('Visa 4242',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Shoping',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Text('Select method',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                RoundRow('SubTotal', totalAmountofEachProduct),
                SizedBox(
                  height: 8,
                ),
                RoundRow('Processinf fee', fees),
                SizedBox(
                  height: 8,
                ),
                RoundRow('Shoping and handleing ', 0.00),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                RoundRow('Total', gettotal()),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: RaisedButton(
                    onPressed: () {
                      order.addOrder(cart.items.values.toList(), totalAmountofEachProduct);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));
                    },
                    color: Color.fromRGBO(43, 51, 65, 1),
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RoundRow extends StatelessWidget {
  final String title;
  final double value;
  RoundRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        Text('${value.toString()}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800))
      ],
    );
  }
}
