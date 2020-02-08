import 'package:artableapp/model/DummyData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/categoryScreen.dart';
import 'model/Product.dart';
import 'model/Cart.dart';
import 'model/Orders.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Dummydata()),
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())




      ],

      child: MaterialApp(
        title: 'Market App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home:CategoryScreen()
      ),
    );
  }
}
