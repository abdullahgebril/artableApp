import 'package:flutter/material.dart';
import '../model/DummyData.dart';
import '../screen/ProductsListScreen.dart';
import 'package:provider/provider.dart';
import '../Constants.dart';
class CategoeyGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;

    final categories = Provider.of<Dummydata>(context).categories;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(GridBackgroundURL),
                fit: BoxFit.cover)),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 7 / 10,
          children: categories
              .map((category) =>GestureDetector(
      onTap: (){  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductsListScreen(category.id,category.title)),
      );},
      child: FittedBox(
        child: Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(height: screenheight* 0.3 ,child: category.imageUrl == null? Container() :Image.network(category.imageUrl,fit: BoxFit.cover)),

                Text(category.title== null?'anyThing':category.title,style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
      ),
    )
          )

.toList(),
        ));
  }
}
