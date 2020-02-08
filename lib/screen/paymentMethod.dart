




import 'package:flutter/material.dart';
class SelectPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment MEthos',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
      ),body: Column(
      children: <Widget>[
        Container(
          height: screenheight * 0.3,
          child: Image.network('https://cdn2.iconfinder.com/data/icons/aami-web-internet/64/aami7-78-512.png',fit: BoxFit.cover,),


        ),
        SizedBox(height: 10,),
        Container(
          height: screenheight * 0.2,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              paymentmethod('Visa Ending 4242'),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              paymentmethod('Visa Ending 4040'),

            ],
          ),

        )
      ],
    ),
    );
  }
}
class paymentmethod extends StatefulWidget {
  final String title;
  paymentmethod(this.title);
  @override
  _paymentmethodState createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  bool   istapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
setState(() {
  istapped = !istapped;
});
      },
      child: ListTile(
        leading: Icon(Icons.payment,color: istapped?Colors.blueAccent:Colors.black54),
        title: Text(widget.title,style: TextStyle(
            color: istapped? Colors.blue: Colors.black54
        ),),
        trailing:istapped?Icon(Icons.check,color: Colors.blueAccent,):null,

      ),

    );
  }
}

