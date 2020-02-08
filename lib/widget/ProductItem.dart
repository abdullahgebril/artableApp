import 'package:flutter/material.dart';



import 'package:provider/provider.dart';
import '../model/Product.dart';
import '../screen/ProductDetailsScreen.dart';
import '../model/DummyData.dart';

class ProductItem extends StatelessWidget {

  final String productId;

  ProductItem(this.productId);

  @override
  Widget build(BuildContext context) {

    final products = Provider.of<Dummydata>(context).products;
    final selectedProduct = products.firstWhere((pro) {return pro.productId == productId;});
    final product = Provider.of<Product>(context);

    final screenheight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    void goToProductDetailsScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetailsScreen(selectedProduct.productId)),
      );
    }
    return GestureDetector(
      onTap: goToProductDetailsScreen,
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                    child: Image.network(
                      selectedProduct.imageUrl,
                  height: screenheight *0.2,
                  width: screenWidth * 0.2,
                  fit: BoxFit.cover,
                )),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      selectedProduct.title,
                      style:
                          TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$${selectedProduct.price}',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  ],
                ),
              ),
                Align(
                alignment: Alignment.topRight,
                child:IconButton(
                  onPressed: (){
                    product.toggleFavoirte();

                  },
                  icon: Icon( product.isFavorite?Icons.star:
                    Icons.star_border,
                    size: 40,
                    color: Colors.lime,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
