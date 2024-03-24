import 'dart:io';

import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/Constants/utils.dart';
import 'package:amazon_clone/common/widget/custom_button.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProductScreen extends StatefulWidget {
  static const String routName = "/add-products";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController();
  final AdminServices adminServices = AdminServices();
  final _addProductKey = GlobalKey<FormState>();
  String category = 'Mobiles';
  List<File> images = [];
  @override
  void dispose() {
    productNameCtrl.dispose();
    descriptionCtrl.dispose();
    priceCtrl.dispose();
    quantityCtrl.dispose();
    super.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  void sellProduct() {
    FocusScope.of(context).unfocus();
    if (_addProductKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameCtrl.text,
          description: descriptionCtrl.text,
          price: double.parse(priceCtrl.text),
          quantity: double.parse(quantityCtrl.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: const Text(
            "Add Product",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map((e) {
                            return Builder(
                                builder: (BuildContext context) => Image.file(
                                      e,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ));
                          }).toList(),
                          options:
                              CarouselOptions(viewportFraction: 1, height: 200),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Select Product Images",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 30),
                  CustomFormField(
                    controller: productNameCtrl,
                    hinttext: "Product Name",
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: descriptionCtrl,
                    hinttext: "Description",
                    maxLines: 7,
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: priceCtrl,
                    hinttext: "Price",
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: quantityCtrl,
                    hinttext: "Quantity",
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            category = newValue!;
                          });
                        }),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(text: "Sell", onTap: sellProduct)
                ],
              ),
            )),
      ),
    );
  }
}
