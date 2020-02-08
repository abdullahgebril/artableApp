import 'package:flutter/material.dart';
import '../model/DummyData.dart';
import 'package:provider/provider.dart';
import '../widget/ProductItem.dart';

import '../Constants.dart';
import '../screen/CartScreen.dart';
import 'AddEdditpproduct.dart';




class ProductsListScreen extends StatefulWidget {
  final String categoruid;
  final String categorytitle;
  ProductsListScreen(this.categoruid, this.categorytitle);

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

  bool _isinti = true;
  bool _loading = false;
  @override
  void didChangeDependencies() {
    if(_isinti){
      setState(() {
        _loading = true;
      });
      Provider.of<Dummydata>(context).FetchProducts().then((_){
        setState(() {
          _loading = false;
        });
      });

    }
    _isinti = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Dummydata>(context).products;
    final selectedProducts = products.where((pro)=>pro.categoryId ==widget.categoruid).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.categorytitle)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart, size: 30),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              }),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEdditProduct(widget.categoruid),
                  ));
            },
          )
        ],
      ),
      body:_loading? Center(
          child: CircularProgressIndicator()
      ):Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(productsListBackgroundURL),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: selectedProducts.length,
            itemBuilder: (context, i) =>
                ProductItem(selectedProducts[i].productId),
          )),
    );
  }
}

