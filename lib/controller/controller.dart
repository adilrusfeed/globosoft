import 'package:flutter/material.dart';
import 'package:globosoft/model/model.dart';
import 'package:globosoft/service/service.dart';

class ProductController extends ChangeNotifier{
  final ProductService _productController = ProductService();
  List<Product> _products =[];
  bool  _isloading = true;

  List <Product> get products => _products;
  bool get isloading => _isloading;

  Future<void> loadProducts() async {
    _isloading = true;
    notifyListeners();

    try{
      _products = await _productController.fetchProducts();
    }catch(e){
      print('Error fetching products: $e');
    }finally{
      _isloading = false;
      notifyListeners();
    }
  }

}