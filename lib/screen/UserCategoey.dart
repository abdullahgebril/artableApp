





import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/DummyData.dart';
import '../widget/UserCategoryWidget.dart';
import '../widget/AppDrawer.dart';
import 'AddEditingCategory.dart';

class UserCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Dummydata>(context).categories;
    return Scaffold(
      appBar: AppBar(title: Text('Category'),actions: <Widget>[
        IconButton(
          icon: Icon(

              Icons.add,
            size: 30,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEditindCategory('')),
            );
          },

        ),

      ],),
      drawer:AppDrawer() ,
      body: ListView.builder(itemCount: categories.length,itemBuilder:(context,i)=>EditingCategory(
        categories[i].id,categories[i].title,categories[i].imageUrl,
      ) ),

    );
  }
}
