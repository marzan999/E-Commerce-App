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
    // TODO: implement initState
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).categoryList;
    return Scaffold(
      body: SingleChildScrollView(
        child: GridView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 23, crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Image.network("${imageUrl}${categoryList[index].image}"),
              );
            }),
      ),
    );
  }
}
