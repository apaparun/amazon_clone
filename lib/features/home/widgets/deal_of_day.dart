import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/home/serivces/home_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    fetchdealofday();
    super.initState();
  }

  void fetchdealofday() async {
    product = await homeServices.fetchDealofday(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: const Text(
                      "Deal of the day",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Image.network(
                    "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                    height: 235,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                    child: const Text(
                      '\$100',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                    child: const Text(
                      "adsdasd",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.network(
                          "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.network(
                          "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.network(
                          "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.network(
                          "https://cdn.thewirecutter.com/wp-content/media/2023/06/macbooks-2048px-2349.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15)
                        .copyWith(left: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "See all deals",
                      style: TextStyle(color: Colors.cyan[800]),
                    ),
                  )
                ],
              );
  }
}
