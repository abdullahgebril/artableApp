import 'dart:convert';

import 'package:artableapp/model/Category.dart';
import 'package:artableapp/model/Product.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Dummydata with ChangeNotifier {
  List _categories = [];

  List<Category> get categories {
    return [..._categories];
  }

  Category findById(String id) {
    return _categories.firstWhere((pro) => pro.id == id);
  }




  List _Products = [
//    Product(
//        productId: 'c1',
//        categoryId: 'p1',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1514718074492-9f8b50884524?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=334&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c2',
//        categoryId: 'p2',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1569580356822-26e9deb5198c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=755&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c3',
//        categoryId: 'p1',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1574681332110-c45ff35a5e09?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c4',
//        categoryId: 'p4',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1574681783851-3be8e3db4af1?ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c5',
//        categoryId: 'p1',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1564678164-f00ad53a38e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c6',
//        categoryId: 'p1',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1566308051577-7a0cd0ad8f31?ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
//        description: 'This is the nice description'),
//    Product(
//        productId: 'c1',
//        categoryId: 'p1',
//        title: 'nature',
//        price: 10.0,
//        imageUrl:
//        'https://images.unsplash.com/photo-1547686669-9a8cb1a22d91?ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
//        description: 'This is the nice description')
];

  List<Product> get products {
    return [..._Products];
  }

  bool showFavorit = false;

  void showFavoritOnly() {
    showFavorit = true;
    notifyListeners();
  }

  List<Product> favorits = [];

  List get favoritProducts {
    if (showFavorit == true) {
      favorits = _Products.where((pro) => pro.isFavorite == true).toList();
    }
  }

  Future<void> addCategory(Category category) async {
    final url = 'https://artableshop-29e4b.firebaseio.com/Categories.json';
    try {
      final response = await http.post(url,
          body: json
              .encode({'id':category.title,'name': category.title, 'imageURl': category.imageUrl}));
      final newCategor = Category(
        id: category.title,
        title: category.title,
        imageUrl: category.imageUrl

      );
      _categories.add(newCategor);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
  Future<void> deleteCategory(String id) async {
    final url =
        'https://artableshop-29e4b.firebaseio.com/Categories.json';
    await http.delete(url);
    _categories.removeWhere((pro) => pro.id == id);

    notifyListeners();
  }

  Future<void> FetchCategories() async {
    final url ='https://artableshop-29e4b.firebaseio.com/Categories.json';
    try {
      final response = await http.get(url);
      final categoriesData = json.decode(response.body) as Map<String, dynamic>;

      final List<Category> loadingList = [];
      categoriesData.forEach((categoryId, categoryData) {
        loadingList.add(Category(
          id: categoryData['id'],

          title: categoryData['name'],
          imageUrl: categoryData['imageURl']

        ));
      });
      _categories = loadingList;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
  Future<void> updateCategory(String id, Category category) async {
    final categoryindex = _categories.indexWhere((pro) => pro.id == id);
    if (categoryindex >= 0) {
      final url =
          'https://artableshop-29e4b.firebaseio.com/Categories.json';
      await http.patch(url,
          body: json.encode({
            'id':category.title,
            'name': category.title,
            'imageURl': category.imageUrl,

          }));
      _categories[categoryindex] = category;
      notifyListeners();
    } else {
      print('No Product');
    }
  }


  Future<void> addProduct(Product product)async {

    final url =
        'https://artableshop-29e4b.firebaseio.com/Products.json';
    try {
      final response = await http.post(url, body: jsonEncode({
        'categoryID': product.categoryId,
        'title': product.title,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'description': product.description
      }));
      final newProduct = Product(
          productId:jsonDecode(response.body)['name'],
          categoryId: product.categoryId,
          title: product.title,
          price: product.price,
          imageUrl: product.imageUrl,
          description: product.description);
      _Products.add(newProduct);

      notifyListeners();
    }catch(e){
      throw e;
    }
  }
  Future<void> FetchProducts()async{
   final url =
        'https://artableshop-29e4b.firebaseio.com/Products.json';
   try {
     final response = await http.get(url);
     final productsData = jsonDecode(response.body) as Map<String, dynamic>;

     final List<Product> loadingProdcuts = [];
     productsData.forEach((id, productsData) {

         loadingProdcuts.add(Product(
           categoryId: productsData['categoryID'],
           title: productsData['title'],
           price: productsData['price'],
           imageUrl: productsData['imageUrl'],
           description: productsData['description'],

         ));

     });
     _Products = loadingProdcuts;
     notifyListeners();
   }catch(e){
     throw e;
   }




  }



}
