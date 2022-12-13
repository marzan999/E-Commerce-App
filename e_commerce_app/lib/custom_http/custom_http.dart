import 'dart:convert';

import 'package:e_commerce_app/model/catagory_model.dart';
import 'package:e_commerce_app/model/order_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomeHttpRequest {
  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var header = {
      "Accept": "Application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}"
    };
    print("Saved token is ${sharedPreferences.getString("token")}");
    return header;
  }

  static Future<List<OrderModel>> fetchOrderData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    var uri = "${baseUrl}all/orders";
    var responce = await http.get(Uri.parse(uri),
        headers: await CustomeHttpRequest.getHeaderWithToken());
    var data = jsonDecode(responce.body);
    for (var i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }

  static Future<List<CategoryModel>> fetchCategoryData() async {
    List<CategoryModel> categoryList = [];
    CategoryModel categoryModel;
    var uri = "${baseUrl}category";
    var responce = await http.get(Uri.parse(uri),
        headers: await CustomeHttpRequest.getHeaderWithToken());
    var data = jsonDecode(responce.body);

    for (var i in data) {
      categoryModel = CategoryModel.fromJson(i);
      categoryList.add(categoryModel);
    }
    return categoryList;
  }

  static Future<List<ProductModel>> getProductApi() async {
    List<ProductModel> productList = [];
    String link = "${baseUrl}products";
    final response =
        await http.get(Uri.parse(link), headers: await getHeaderWithToken());

    var data = jsonDecode(response.body.toString());

    print("bghfghfghfggggggggg${response.body}");

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        productList.add(ProductModel.fromJson(i));
      }
      return productList;
    } else {
      return productList;
    }
  }
}
