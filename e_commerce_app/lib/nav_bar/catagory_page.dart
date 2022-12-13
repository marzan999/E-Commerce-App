import 'package:e_commerce_app/provider/catagory_provider.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                                  height: 150,
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
                            flex: 3,
                            child: Container(
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${categoryList[index].name}',
                                    style: GoogleFonts.acme(
                                        fontSize: 30, color: Colors.teal),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 172, 190, 172),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Icon(
                                          Icons.edit,
                                        )),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 172, 190, 172),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Icon(
                                          Icons.delete,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
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
