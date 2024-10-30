import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class ProductService{
  static const String baseUrl = "https://mansharcart.com/api/products/category/139/key/123456789";
  static const String imagePath = "https://mansharcart.com/image/";

  Future<List<Product>> fetchProducts()async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      List products = data['products'];
      return products.map((product) => Product.fromJson(product)).toList();
    }else{
      throw Exception("Failed to load products");
    }
  }


  String getImageUrl(String thumb){
    return "$imagePath$thumb";
  }
}

