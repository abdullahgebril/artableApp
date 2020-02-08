import 'package:flutter/material.dart';
import '../model/Product.dart';

import 'package:provider/provider.dart';
import'../model/DummyData.dart';
class AddEdditProduct extends StatefulWidget {

final String id;
AddEdditProduct(this.id);
  @override
  _AddEdditProductState createState() => _AddEdditProductState();
}

class _AddEdditProductState extends State<AddEdditProduct> {
  final formKey = GlobalKey<FormState>();
  final priceFocusNode = FocusNode();
  final descreiptionFocusNode = FocusNode();
  final imageFocusNode = FocusNode();
  final imageController = TextEditingController();


  String id ;
  var editProduct;
  @override
  void initState() {
    imageController.addListener(updateUIImage);
   editProduct = Product(
    productId: null,
    categoryId:widget.id,
    title: '',
    price: 0.0,
    imageUrl: '',
    isFavorite: false,
    description: '');

    super.initState();
  }





  void updateUIImage() {
    if (!imageFocusNode.hasFocus) {
      setState(() {});
    }
  }
  bool _loading = false;
  Future<void> saveForm() async {
    final isvalid = formKey.currentState.validate();
    if (!isvalid) {
      return;
    }
    formKey.currentState.save();
     await Provider.of<Dummydata>(context,listen: false).addProduct(editProduct);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' your Category'),
        actions: <Widget>[
          IconButton(
            onPressed: saveForm,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please you Must Enter title';
                  }

                  return null;
                },
                onSaved: (value) {
                  editProduct = Product(
                      productId: editProduct.productId,
                      categoryId: editProduct.categoryId ,
                      title: value,
                      price: editProduct.price,
                      imageUrl: editProduct.imageUrl,
                      isFavorite: editProduct.isFavorite,
                      description: editProduct.description);
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(descreiptionFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please you Must Enter Price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please Enter Valid Number';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Please Enter Valid Number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editProduct = Product(
                        productId: editProduct.productId,
                        categoryId: editProduct.categoryId,
                        title: editProduct.title,
                        price: double.parse(value),
                        imageUrl: editProduct.imageUrl,
                        isFavorite: editProduct.isFavorite,
                        description: editProduct.description);
                  }),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(imageFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please you Must Enter Description';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    editProduct = Product(
                        productId: editProduct.productId,
                        categoryId: editProduct.categoryId,
                        title: editProduct.title,
                        price: editProduct.price,
                        imageUrl: editProduct.imageUrl,
                        isFavorite: editProduct.isFavorite,
                        description: value);
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: imageController.text.isEmpty
                        ? Center(
                            child: Text('Enter Image URL'),
                          )
                        : FittedBox(child: Image.network(imageController.text)),
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Enter Image URL'),
                        textInputAction: TextInputAction.done,
                        controller: imageController,
                        focusNode: imageFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter  URl';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return ' Please Enter valid URL';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          editProduct = Product(
                              productId: editProduct.productId,
                              categoryId: editProduct.categoryId,
                              title: editProduct.title,
                              price: editProduct.price,
                              imageUrl: value,
                              isFavorite: editProduct.isFavorite,
                              description: editProduct.description);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
