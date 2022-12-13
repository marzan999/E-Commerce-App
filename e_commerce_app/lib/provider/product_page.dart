import 'package:e_commerce_app/custom_http/custom_http.dart';
import 'package:e_commerce_app/model/product_model.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];

  getProductData() async {
    productList = await CustomeHttpRequest.getProductApi();
    notifyListeners();
  }
}
