





import 'package:flutter/material.dart';
import '../screen/categoryScreen.dart';
import '../screen/OrdersScreen.dart';
import '../screen/UserCategoey.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void shopFun(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryScreen()),
      );
    }
    void orderFun(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrdersScreen()),
      );
    }
    void addCategoryFun(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserCategory()),
      );
    }
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Artablr App'),
          ),
          Divider(
            height: 1,
            color: Colors.black,

          ),
          ListTitleOfDrawer(shopFun,'Shop',Icon(Icons.shop)),
          Divider(
            height: 1,
            color: Colors.black,

          ),

          ListTitleOfDrawer(orderFun,'Order',Icon(Icons.payment)),

          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTitleOfDrawer(addCategoryFun,'Editing Category',Icon(Icons.edit)),
        ],
      )
    );
  }
}

class ListTitleOfDrawer extends StatelessWidget {
final Function navigator;
final String title;
final Icon icon;

ListTitleOfDrawer(this.navigator,this.title,this.icon);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: icon
      ),
      title: Text(title),
      onTap: navigator

    );
  }
}
