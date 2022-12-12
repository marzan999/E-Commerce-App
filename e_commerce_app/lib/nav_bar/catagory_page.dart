import 'package:e_commerce_app/provider/catagory_provider.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).categoryList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 180, 178),
          elevation: 0,
          title: Text(
            "Category",
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: categoryList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 23, crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(179, 216, 213, 213),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "${imageUrl}${categoryList[index].image}",
                                          ),
                                          fit: BoxFit.cover),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                ),
                                Positioned(
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                  top: 15,
                                  left: 15,
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              // color: Colors.yellow,
                              child: Center(
                                  child: Text(
                                '${categoryList[index].name}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              )),
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}



// child:
//                       Image.network("${imageUrl}${categoryList[index].image}"),

  // padding: const EdgeInsets.only(left: 20, right: 20),