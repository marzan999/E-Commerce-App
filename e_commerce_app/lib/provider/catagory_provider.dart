import 'package:e_commerce_app/custom_http/custom_http.dart';
import 'package:e_commerce_app/model/catagory_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategoryData() async {
    categoryList = await CustomeHttpRequest.fetchCategoryData();
    notifyListeners();
  }
}
