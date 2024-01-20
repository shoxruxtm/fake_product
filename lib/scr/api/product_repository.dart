import 'dart:convert';

import 'package:fake_product/scr/api/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> productList = [];

    final url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final res = await http.get(url);
      final resData = json.decode(utf8.decode(res.bodyBytes));
      if (res.statusCode == 200) {
        for (final item in resData) {
          productList.add(ProductModel.fromJson(item));
        }
      }
      else{
        throw Exception("Server error. Error code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error $e");
    }
    return productList;
  }
}
