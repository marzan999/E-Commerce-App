import 'dart:io';
import 'package:e_commerce_app/custom_http/custom_http.dart';
import 'package:e_commerce_app/model/catagory_model.dart';
import 'package:e_commerce_app/provider/catagory_provider.dart';
import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? categoryType;
  TextEditingController nameController = TextEditingController();
  TextEditingController orginalPriceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController discountTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  bool isLoading = true;
  uploadProduct() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
      String uriLink = "${baseUrl}product/store";
      var request = http.MultipartRequest("POST", Uri.parse(uriLink));
      request.headers.addAll(await CustomeHttpRequest.getHeaderWithToken());
      request.fields["name"] = nameController.text.toString();
      request.fields["category_id"] = categoryType.toString();
      request.fields["quantity"] = quantityController.text.toString();
      request.fields["original_price"] = orginalPriceController.text.toString();
      request.fields["discounted_price"] =
          discountPriceController.text.toString();
      request.fields["discount_type"] = "fixed";
      var photo = await http.MultipartFile.fromPath("image", image!.path);
      request.files.add(photo);
      var responce = await request.send();
      var responceData = await responce.stream.toBytes();
      var responceString = String.fromCharCodes(responceData);
      //print("${responceString}");
      print(
          "Status code issss${responce.statusCode} ${request.fields} ${request.files.toString()}");
      if (responce.statusCode == 201) {
        showInToast("Product Uploaded Succesfully");

        Navigator.of(context).pop();
      } else {
        showInToast("Something wrong, try again plz bro");
      }
    }
  }

  List<CategoryModel> categoryList = [];
  @override
  Widget build(BuildContext context) {
    var categoryList = Provider.of<CategoryProvider>(context).categoryList;
    final height = MediaQuery.of(context).size.height;
    final weidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 180, 178),
          elevation: 0,
          title: Text(
            "Choose Category",
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 168, 202, 199),
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60,
                    child: Center(
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                        decoration: InputDecoration.collapsed(hintText: ''),
                        value: categoryType,
                        hint: Text(
                          'Select Category',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            categoryType = newValue;
                            print("my Category is $categoryType");
                          });
                        },
                        validator: (value) =>
                            value == null ? 'field required' : null,
                        items: categoryList.map((item) {
                          return DropdownMenuItem(
                            child: Text(
                              "${item.name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            value: item.id.toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Enter Product Name'),
                  ),
                  TextField(
                    controller: orginalPriceController,
                    decoration:
                        InputDecoration(hintText: 'Enter Product Price'),
                  ),
                  TextField(
                    controller: discountPriceController,
                    decoration:
                        InputDecoration(hintText: 'Enter Discount Price'),
                  ),
                  TextField(
                    controller: quantityController,
                    decoration:
                        InputDecoration(hintText: 'Enter Product Quantity'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: image == null
                            ? InkWell(
                                onTap: () {
                                  getImageformGallery();
                                },
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.teal,
                                        size: 40,
                                      ),
                                      Text(
                                        "UPLOAD",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.teal.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: 150,
                                width: 200,
                                child: Image.file(image!),
                              ),
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            getImageformGallery();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: Icon(
                              Icons.edit,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        bottom: 10,
                        right: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      uploadProduct();
                    },
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 123, 161, 158)),
                        child: Center(
                            child: Text(
                          'Upload Product',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  File? image;
  final picker = ImagePicker();

  Future getImageformGallery() async {
    print('on the way of gallery');
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        print('image found');
        print('${image!.path}');
      } else {
        print('no image found');
      }
    });
  }
}
