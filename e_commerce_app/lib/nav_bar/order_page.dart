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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 180, 178),
          // backgroundColor: AppColor.kbgcolor,
          elevation: 0,
          title: Text(
            "Order",
            style: TextStyle(color: Colors.black, fontSize: 26),
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
                                EdgeInsets.only(top: 15, left: 20, right: 20),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 15),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 240, 236, 236),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 199, 191, 115),
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
                                                // Icon(
                                                //   clr == 1
                                                //       ? Icons.snowmobile_sharp
                                                //       : clr == 2
                                                //           ? Icons.abc
                                                //           : Icons
                                                //               .zoom_in_map_sharp,
                                                //   color: clr == 1
                                                //       ? Colors.red
                                                //       : clr == 2
                                                //           ? Colors.green
                                                //           : Colors.blue,
                                                // ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'Name     :  ',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "${orderList[index].user!.name} ",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Order ID :  ',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      orderList[index]
                                                          .id
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'Price      :  ',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "${orderList[index].price} taka only",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        // Expanded(
                                        //     flex: 2,
                                        //     child: Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [],
                                        //     )),
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
      ),
    );
  }
}
