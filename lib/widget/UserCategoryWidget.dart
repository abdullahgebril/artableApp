


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/DummyData.dart';
import '../screen/AddEditingCategory.dart';
class EditingCategory extends StatelessWidget {
  final String id;
  final String imageURl;
  final String title;
  EditingCategory(this.id,this.title,this.imageURl);
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Dummydata>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURl),

      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEditindCategory(id)),
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.teal,
              ),

            ),
            IconButton(
              onPressed:() {Provider.of<Dummydata>(context).deleteCategory(id);},
               icon: Icon(

                  Icons.delete,
                color: Theme.of(context).errorColor,
              ),

            ),


          ],
        ),
      ),



    );
  }
}
