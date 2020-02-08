

import 'package:flutter/material.dart';
import '../widget/CategoryGrid.dart';
import '../model/DummyData.dart';
import 'package:provider/provider.dart';
import 'FavoritScreen.dart';
import 'UserCategoey.dart';
import '../widget/AppDrawer.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  bool _isinit = true;
  bool _loading =false;

  @override
  void didChangeDependencies() {

    if(_isinit){
      setState(() {
        _loading = true;
      });
    }
    Provider.of<Dummydata>(context).FetchCategories().then((_){
  setState(() {
    _loading = false;
  });
    });
    _isinit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final favproduct = Provider.of<Dummydata>(context);
      return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Category'),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.star, size: 30), onPressed:(){
            favproduct.showFavoritOnly();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteScreen()),
            );
          }),
          IconButton(
              icon: Icon(Icons.shopping_cart, size: 30), onPressed: () {}),
        ],
      ),
      drawer: AppDrawer(),

      body: _loading? Center(
          child: CircularProgressIndicator(),
    ):CategoeyGrid()

      );}
}

