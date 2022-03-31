import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_all_store_products.dart';
import 'package:user_app/views/screens/cart_screen.dart';
import 'package:user_app/views/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  String shopeName;
  ProductScreen({Key? key, required this.shopeName}) : super(key: key);

  final _getAllProductController = Get.find<GetAllShopeProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(shopeName),
        actions: [
          IconButton(
              onPressed: () async {
                await Get.to(CartScreen());
              },
              icon: const FaIcon(
                FontAwesomeIcons.cartArrowDown,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ProductCard(
                allProducts: _getAllProductController.resposeMode,
                index: index,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: _getAllProductController.resposeMode.length),
      ),
    );
  }
}
