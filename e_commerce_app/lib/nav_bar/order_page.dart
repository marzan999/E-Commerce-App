import 'dart:convert';

import 'package:e_commerce_app/provider/order_provider.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<OrderProvider>(context, listen: false).getOrderListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.kbgcolor,
        elevation: 0,
        title: Text(
          "Order",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: orderList.isEmpty
          ? spinkit
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        var clr = orderList[index]
                            .orderStatus!
                            .orderStatusCategory!
                            .id;
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ), //Offset
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                clr == 1
                                                    ? Icons.snowmobile_sharp
                                                    : clr == 2
                                                        ? Icons.abc
                                                        : Icons
                                                            .zoom_in_map_sharp,
                                                color: clr == 1
                                                    ? Colors.red
                                                    : clr == 2
                                                        ? Colors.green
                                                        : Colors.blue,
                                              ),
                                              Text(
                                                "Order Id: " +
                                                    orderList[index]
                                                        .id
                                                        .toString(),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name:${orderList[index].user!.name} ",
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                "Price: ${orderList[index].price}",
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
