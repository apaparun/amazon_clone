import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
    "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
    "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See All",
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            )
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SingleProduct(image: list[index]);
              }),
        )
      ],
    );
  }
}
