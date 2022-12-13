import 'package:e_commerce_app/provider/product_page.dart';
import 'package:e_commerce_app/screens/add_product_page.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).productList;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 187, 109, 183),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddProduct()))
                .then((value) =>
                    Provider.of<ProductProvider>(context, listen: false)
                        .getProductData());
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 180, 178),
          elevation: 0,
          title: Text(
            "Product",
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          centerTitle: true,
        ),
        body: productList.isEmpty
            ? spinkit
            : GridView.builder(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                shrinkWrap: true,
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 231, 229),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 199, 135),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${imageUrl}${productList[index].image.toString()}"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            productList[index].name.toString(),
                            style: GoogleFonts.acme(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.teal),
                          ),
                        ),
                        Text(
                          "  Quantity: " +
                              productList[index]
                                  .stockItems![0]
                                  .quantity
                                  .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "  Price: " +
                              productList[index]
                                  .price![0]
                                  .originalPrice
                                  .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "  Discount Price: " +
                              productList[index]
                                  .price![0]
                                  .discountedPrice
                                  .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 172, 190, 172),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Icon(
                                Icons.edit,
                              )),
                            ),
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 172, 190, 172),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Icon(
                                Icons.delete,
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}





// import 'package:e_commerce_app/provider/product_page.dart';
// import 'package:e_commerce_app/widget/common_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   @override
//   void initState() {
//     Provider.of<ProductProvider>(context, listen: false).getProductListData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productList = Provider.of<ProductProvider>(context).productList;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 154, 180, 178),
//           elevation: 0,
//           title: Text(
//             "Product",
//             style: TextStyle(color: Colors.black, fontSize: 26),
//           ),
//           centerTitle: true,
//         ),
//         // body: SingleChildScrollView(
//         //   child: GridView.builder(
//         //       physics: NeverScrollableScrollPhysics(),
//         //       itemCount: productList.length,
//         //       shrinkWrap: true,
//         //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //           crossAxisCount: 2, mainAxisSpacing: 23, crossAxisSpacing: 20),
//         //       itemBuilder: (context, index) {
//         //         return Padding(
//         //           padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
//         //           child: Container(
//         //             height: 300,
//         //             decoration: BoxDecoration(
//         //                 color: Color.fromARGB(179, 216, 213, 213),
//         //                 borderRadius: BorderRadius.circular(15)),
//         //             child: Column(
//         //               children: [
//         //                 Expanded(
//         //                     flex: 5,
//         //                     child: Stack(
//         //                       children: [
//         //                         Container(
//         //                           decoration: BoxDecoration(
//         //                               image: DecorationImage(
//         //                                   image: NetworkImage(
//         //                                     "${imageUrl}${productList[index].image}",
//         //                                   ),
//         //                                   fit: BoxFit.cover),
//         //                               color: Colors.red,
//         //                               borderRadius: BorderRadius.only(
//         //                                   topLeft: Radius.circular(15),
//         //                                   topRight: Radius.circular(15))),
//         //                         ),
//         //                         Positioned(
//         //                           child: Icon(
//         //                             Icons.favorite_border_outlined,
//         //                             color: Colors.white,
//         //                           ),
//         //                           top: 15,
//         //                           left: 15,
//         //                         ),
//         //                       ],
//         //                     )),
//         //                 Expanded(
//         //                     flex: 1,
//         //                     child: Container(
//         //                       child: Center(
//         //                           child: Text(
//         //                         '${productList[index].name}',
//         //                         style: TextStyle(
//         //                             fontSize: 25, color: Colors.black),
//         //                       )),
//         //                     )),
//         //               ],
//         //             ),
//         //           ),
//         //         );
//         //       }),
//         // ),
//         // body: Column(
//         //   children: [
//         //     ListView.builder(
//         //         shrinkWrap: true,
//         //         itemCount: 5,
//         //         itemBuilder: (context, index) {
//         //           return ListTile(
//         //             // leading: Icon(Icons.favorite),
//         //             leading: Text('data'),
//         //             trailing: Icon(Icons.favorite),
//         //           );
//         //         })
//         //   ],
//         // ),
//         body: SingleChildScrollView(
//           child: GridView.builder(
//               //  physics: NeverScrollableScrollPhysics(),
//               itemCount: productList.length,
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, mainAxisSpacing: 23, crossAxisSpacing: 20),
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 200,
//                   color: Colors.yellow,
//                   child: Text('${productList[index].name}'),
//                 );
//               }),
//         ),
//         // body: productList.isEmpty
//         //     ? null
//         //     : SingleChildScrollView(
//         //         child: Column(
//         //           children: [
//         //             ListView.builder(
//         //                 physics: NeverScrollableScrollPhysics(),
//         //                 shrinkWrap: true,
//         //                 itemCount: productList.length,
//         //                 itemBuilder: (context, index) {
//         //                   return Column(
//         //                     children: [
//         //                       Text('${productList[index].name} '),
//         //                       Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaaa')
//         //                     ],
//         //                   );
//         //                   // var clr = productList[index];
//         //                   // return Padding(
//         //                   //   padding: EdgeInsets.only(top: 15, left: 20, right: 20),
//         //                   //   child: Center(
//         //                   //     child: Container(
//         //                   //       padding: EdgeInsets.only(
//         //                   //           top: 15, left: 15, right: 15, bottom: 15),
//         //                   //       height: 150,
//         //                   //       decoration: BoxDecoration(
//         //                   //         borderRadius: BorderRadius.circular(15),
//         //                   //         color: Color.fromARGB(255, 240, 236, 236),
//         //                   //         boxShadow: [
//         //                   //           BoxShadow(
//         //                   //             color: Color.fromARGB(255, 199, 191, 115),
//         //                   //             offset: const Offset(
//         //                   //               5.0,
//         //                   //               5.0,
//         //                   //             ), //Offset
//         //                   //             blurRadius: 10.0,
//         //                   //             spreadRadius: 2.0,
//         //                   //           ), //BoxShadow
//         //                   //           BoxShadow(
//         //                   //             color: Colors.white,
//         //                   //             offset: const Offset(0.0, 0.0),
//         //                   //             blurRadius: 0.0,
//         //                   //             spreadRadius: 0.0,
//         //                   //           ), //BoxShadow
//         //                   //         ],
//         //                   //       ),
//         //                   //       child: Column(
//         //                   //         children: [
//         //                   //           Row(
//         //                   //             children: [
//         //                   //               Expanded(
//         //                   //                   flex: 2,
//         //                   //                   child: Column(
//         //                   //                     crossAxisAlignment:
//         //                   //                         CrossAxisAlignment.start,
//         //                   //                     children: [
//         //                   //                       Row(
//         //                   //                         children: [
//         //                   //                           Text(
//         //                   //                             'Name     :  ',
//         //                   //                             style: TextStyle(fontSize: 20),
//         //                   //                           ),
//         //                   //                           Text(
//         //                   //                             "${productList[index].name} ",
//         //                   //                             style: TextStyle(fontSize: 30),
//         //                   //                           ),
//         //                   //                         ],
//         //                   //                       ),
//         //                   //                       // Row(
//         //                   //                       //   children: [
//         //                   //                       //     Text(
//         //                   //                       //       'Order ID :  ',
//         //                   //                       //       style: TextStyle(
//         //                   //                       //           fontSize: 20),
//         //                   //                       //     ),
//         //                   //                       //     Text(
//         //                   //                       //       orderList[index]
//         //                   //                       //           .id
//         //                   //                       //           .toString(),
//         //                   //                       //       style: TextStyle(
//         //                   //                       //           fontSize: 30),
//         //                   //                       //     ),
//         //                   //                       //   ],
//         //                   //                       // ),

//         //                   //                       // Row(
//         //                   //                       //   children: [
//         //                   //                       //     Text(
//         //                   //                       //       'Price      :  ',
//         //                   //                       //       style: TextStyle(
//         //                   //                       //           fontSize: 20),
//         //                   //                       //     ),
//         //                   //                       //     Text(
//         //                   //                       //       "${orderList[index].price} taka only",
//         //                   //                       //       style: TextStyle(
//         //                   //                       //           fontSize: 30),
//         //                   //                       //     ),
//         //                   //                       //   ],
//         //                   //                       // ),
//         //                   //                     ],
//         //                   //                   )),
//         //                   //               // Expanded(
//         //                   //               //     flex: 2,
//         //                   //               //     child: Column(
//         //                   //               //       crossAxisAlignment:
//         //                   //               //           CrossAxisAlignment.start,
//         //                   //               //       children: [],
//         //                   //               //     )),
//         //                   //             ],
//         //                   //           ),
//         //                   //         ],
//         //                   //       ),
//         //                   //     ),
//         //                   //   ),
//         //                   // );
//         //                 })
//         //           ],
//         //         ),
//         //       ),
//       ),
//     );
//   }
// }
