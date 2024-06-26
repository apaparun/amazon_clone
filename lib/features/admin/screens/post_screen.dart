import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminServices adminservices = AdminServices();
  List<Product>? products;
  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  getAllProducts() async {
    products = await adminservices.fetchAllPoducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routName).then((value) {
      print("then calll");
      getAllProducts();
    });
  }

  void deletProduct(Product product, int index) async {
    adminservices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: Container(
              margin: EdgeInsets.only(right: 18, top: 18, left: 18, bottom: 50),
              child: GridView.builder(
                  itemCount: products?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: SingleProduct(image: productData.images[0]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () => deletProduct(productData, index),
                              icon: const Icon(Icons.delete_outline),
                            )
                          ],
                        )
                      ],
                    );
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: "Add product",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
